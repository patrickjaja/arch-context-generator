# PC System CHANGELOG

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
