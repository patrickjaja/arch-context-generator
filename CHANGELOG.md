# PC System CHANGELOG

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
