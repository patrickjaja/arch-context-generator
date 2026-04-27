# PC System CHANGELOG

## 2026-04-27 — Major disk cleanup: recovered ~182G (98% → 71%)

**Problem:** Root partition at 98% full (671G/727G used, only 20G free).

**Root Cause:** Accumulated caches, stale build artifacts, unused Docker resources, old JetBrains IDE versions, and unpacked git objects across the system.

**Changes:**

1. **User caches cleared (~60G):**
   - `~/.cache/yay/` (29G) — AUR build cache
   - `~/.cache/paru/` (1.4G, sudo) — AUR build cache with read-only Go modules
   - `~/.npm/` (15G, sudo) — npm package cache
   - `~/.cache/pip/`, `~/.cache/pip-tools/` (6.5G) — Python package caches
   - `~/.cache/uv/` (5.4G) — uv Python cache
   - `~/.cache/phpactor/` (3.9G), `~/.cache/google-cloud-tools-java/` (2G), `~/.cache/puppeteer/` (1.8G), `~/.cache/electron/` (1.6G), `~/.cache/Cypress/` (604M)

2. **JetBrains old IDE versions removed (~14G):**
   - Cleared `~/.cache/JetBrains/` and `~/.local/share/JetBrains/` for: PhpStorm ≤2025.2, IdeaIC ≤2025.2, PyCharmCE ≤2025.2, GoLand 2025.2
   - Kept only current versions (2025.3 + 2026.1)

3. **Docker full prune (~24G):**
   - `docker system prune -a --volumes --force`
   - Removed 22 stopped containers, unused images, 124 volumes (93% reclaimable), build cache

4. **Stale project dependencies in ~/development (~35G):**
   - Removed `node_modules/` from 23 projects untouched >1 year (suite_*, lr-*, b2b-*, oryx, esaspryker, etc.)
   - Removed `vendor/` from 21 stale PHP projects
   - Removed `venv`/`.venv` from 10 stale Python projects

5. **~/Downloads cleanup (~11G):**
   - 3 Linux ISOs (linuxmint, lmde, MX-23.6 — 7.6G)
   - Windows `.exe` installers, `.deb` packages (540M)
   - Old data dirs (IPS_FULL, migration_files_dt, test, tmp, joyn — 1.7G)
   - Old log/data files (.dat, .log, .mov, .tif — 500M)

6. **Misc home dir cleanup (2.8G):**
   - `java_error_in_phpstorm_.hprof` (1.8G) + `java_error_in_phpstorm.hprof` (982M) — JVM crash heap dumps

7. **Trash emptied (6.9G):** `~/.local/share/Trash/`

8. **Pacman cleanup (~7G):**
   - `sudo paccache -rk1` — trimmed package cache to 1 version per package
   - `sudo pacman -Rns $(pacman -Qtdq)` — removed 42 orphaned packages

9. **git gc on ~/development/claude-desktop-bin (~13G):**
   - `.git/objects/` had 15G of loose objects from committed binaries
   - `git gc --aggressive --prune=now` repacked 16G → 3.3G
   - Removed `build/`, `tmp/`, `cache/`, `tmp-asar-extract/` build artifacts (2.5G)

**Result:** `/dev/nvme0n1p5` — 671G used → 489G used, 20G free → 202G free (98% → 71%)

**To revert:** Caches and dependency dirs regenerate automatically on next use (`npm install`, `composer install`, `pip install`, `yay -S`, etc.). Docker images/volumes need to be recreated. JetBrains caches rebuild on next IDE launch. `git gc` is non-destructive — no history lost.

---

## 2026-04-09 — Fix /var/lib/nfs/statd/ directory permissions after nfs-utils upgrade

**Problem:** `pacman` warning during `nfs-utils 2.9.1-1` upgrade: `directory permissions differ on /var/lib/nfs/statd/ — filesystem: 755, package: 700`.

**Root Cause:** Directory had `755` (world-readable) from a previous package version. The current `nfs-utils` package expects `700` since `statd` holds NFS lock state that should be private to `rpcuser`.

**Change:** `sudo chmod 700 /var/lib/nfs/statd/`

**To revert:** `sudo chmod 755 /var/lib/nfs/statd/`

---

## 2026-04-05 — System cleanup: remove unused packages and stale kernel modules

**Problem:** System accumulated dead weight over time — orphaned electron versions, deprecated GNOME packages, debug symbols, unused GPU drivers, and stale kernel module directories from 2023-era kernels.

**Changes:**
1. Removed 3 orphaned Electron versions (`electron25-bin`, `electron35`, `electron38`) — no package depended on them
2. Removed deprecated/dead packages: `gksu`, `libgksu` (dead since 2018), `caribou` (unmaintained on-screen keyboard), `neofetch-git` (abandoned, replaced by `fastfetch-git`), `clutter` + `cogl` (legacy GNOME rendering libs, unrequired)
3. Removed `xf86-video-openchrome` — VIA/S3 GPU driver, irrelevant on Intel Iris Xe (i915)
4. Removed `openbox-themes-pambudi-git` — system runs XFCE/Xfwm4, Openbox not in use
5. Removed 18 `-debug` companion packages (~253 MiB) — not actively debugging any of these
6. Cleaned pacman cache with `paccache -rk2` (kept 2 most recent versions per package)
7. Cleaned 10 stale kernel module directories from `/usr/lib/modules/` (6.4.x, 6.5.x, 6.9.x)

**To revert:** Reinstall individual packages with `yay -S <package>`. Debug packages can be re-enabled per-package in `/etc/makepkg.conf`.

---

## 2026-04-05 — Replace pandoc-cli with pandoc-bin to eliminate Haskell dependency churn

**Problem:** Every system update pulled ~90 `haskell-*` package rebuilds (226 packages total) due to cascading ABI rebuilds in the Haskell stack — even when no upstream versions changed (only `pkgrel` bumps).

**Root Cause:** `pandoc-cli` is packaged with dynamically-linked Haskell libraries on Arch. When GHC or any core Haskell library rebuilds, the entire dependency tree must be rebuilt due to Haskell's strict ABI requirements.

**Changes:**
1. Removed `pandoc-cli` and all 226 orphaned `haskell-*` dependencies (`yay -Rns pandoc-cli`)
2. Installed `pandoc-bin` from AUR — a statically-linked upstream binary with zero dependencies
3. `ripgrep-all` (optional dep on pandoc) is unaffected — it bundles its own adapters

**To revert:**
1. `yay -Rns pandoc-bin`
2. `yay -S pandoc-cli`

---

## 2026-03-16 — Fix WPS Office Spreadsheets/Presentation/PDF not launching

**Problem:** WPS Spreadsheets (`et`), Presentation (`wpp`), and PDF (`wpspdf`) fail to open when launched from the XFCE menu or terminal. WPS Writer (`wps`) works fine.

**Root Cause:** The `wps-office-cn` package (12.1.2.24722) installs binaries to `/usr/lib/office6/` instead of the upstream default `/opt/kingsoft/wps-office/office6/`. The `et` and `wpp` binaries attempt to re-exec themselves in "Prometheus/Fusion" mode but compute a broken path — `execve("/et", ["/et", "/prometheus"])` instead of `execve("/usr/lib/office6/et", ...)` — because the hardcoded path logic in the binary doesn't match the Arch install layout. The parent process exits cleanly (code 0), silently failing to launch any window.

**Evidence:** `strace -f /usr/lib/office6/et` showed `execve("/et", ["/et", "/prometheus"]) = -1 ENOENT`. The `wps` binary works because it runs directly without the prometheus re-exec codepath.

**Changes:**
1. Added `wpsoffice\Application%20Settings\AppComponentMode=prome_independ` under the `[6.0]` section in `~/.config/Kingsoft/Office.conf`
   - This forces WPS to use "Multi-component/Independent" mode instead of Fusion/Prometheus mode
   - Each app (Writer, Spreadsheets, Presentation) launches as a separate window/process

**To revert:**
1. Remove the `wpsoffice\Application%20Settings\AppComponentMode=prome_independ` line from `~/.config/Kingsoft/Office.conf` under `[6.0]`

---

## 2026-02-25 — Fix npm prefix conflict with nvm / AUR builds

**Problem:** AUR packages using nvm (e.g. tiny-rdm) fail to build because nvm detects `prefix` in `~/.npmrc` and aborts.

**Root Cause:** `~/.npmrc` contained `prefix=~/.npm-global`, which is incompatible with nvm. nvm can unset the `NPM_CONFIG_PREFIX` env var in its subshell, but cannot modify `~/.npmrc`.

**Changes:**
1. Deleted `~/.npmrc` (contained `prefix=~/.npm-global`)
2. Added `export NPM_CONFIG_PREFIX="$HOME/.npm-global"` to `~/.bashrc` (line 385) — functionally equivalent but nvm-compatible
3. Removed duplicate `export PATH=~/.npm-global/bin:$PATH` from `~/.bashrc` (was on line 391)
4. Removed orphaned `~/npm-global/` directory (old prefix, not in PATH)

**To revert:**
1. Create `~/.npmrc` with content: `prefix=~/.npm-global`
2. Remove `export NPM_CONFIG_PREFIX="$HOME/.npm-global"` from `~/.bashrc`

---

## 2026-02-25 — Clean stale pacman download directories

**Problem:** `yay -Scc` / `pacman -Scc` cannot remove 43 stale `download-*` directories from `/var/cache/pacman/pkg/` (pacman only removes files, not directories).

**Root Cause:** Leftover temporary directories from interrupted package downloads, owned by `alpm` user.

**Fix:** `sudo rm -rf /var/cache/pacman/pkg/download-*/`

**To revert:** Not applicable (empty temporary directories, safe to remove).

---

## 2026-02-21 — Always overwrite arch-context_latest.md

**Change:** Modified `arch-context-generator.sh` to write directly to `arch-context_latest.md` instead of creating timestamped files with a symlink.

**File modified:** `arch-context-generator.sh`
- Removed `TIMESTAMP` variable and timestamped output filename
- Removed symlink creation (`ln -sf`)
- Removed cleanup of old context files (no longer needed)

**To revert:** Restore the previous script from git: `git checkout HEAD~1 -- arch-context-generator.sh`

---

## 2026-02-21 — Disable i915 PSR2 Selective Fetch

**Problem:** Laptop display (eDP-1) showing severe color artifacts and restart loop when external monitors connected via USB-C hub.

**Root Cause:** Intel Iris Xe (Alder Lake-P) PSR2 Selective Fetch failing to calculate screen update regions.
- Kernel error: `i915 0000:00:02.0: [drm] Selective fetch area calculation failed in pipe A`
- PSR2 with selective fetch was enabled (default `-1` = auto)

**Change:** Added `i915.enable_psr2_sel_fetch=0` to kernel parameters.

**File modified:** `/etc/default/grub`
```diff
- GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 audit=0 nvme_load=yes"
+ GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 audit=0 nvme_load=yes i915.enable_psr2_sel_fetch=0"
```

**Applied with:** `sudo grub-mkconfig -o /boot/grub/grub.cfg` + reboot

**To revert:**
1. Edit `/etc/default/grub`
2. Remove `i915.enable_psr2_sel_fetch=0` from `GRUB_CMDLINE_LINUX_DEFAULT`
3. Run `sudo grub-mkconfig -o /boot/grub/grub.cfg`
4. Reboot
