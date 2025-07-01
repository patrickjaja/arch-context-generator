#!/bin/bash
# arch-context-generator.sh
# Generates comprehensive system context for Claude projects

set -euo pipefail

# Configuration - Output in the same directory as the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="${SCRIPT_DIR}"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="${OUTPUT_DIR}/arch-context_${TIMESTAMP}.md"
LATEST_LINK="${OUTPUT_DIR}/arch-context_latest.md"

# Options
BASIC_MODE=false
FULL_MODE=true
SELECTED_MODULES=""

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --basic)
            BASIC_MODE=true
            FULL_MODE=false
            shift
            ;;
        --full)
            FULL_MODE=true
            BASIC_MODE=false
            shift
            ;;
        --modules=*)
            SELECTED_MODULES="${1#*=}"
            FULL_MODE=false
            BASIC_MODE=false
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [--basic|--full|--modules=module1,module2,...]"
            exit 1
            ;;
    esac
done

# Logging functions
log() {
    echo -e "${GREEN}[$(date +"%H:%M:%S")]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Filter sensitive data
filter_sensitive() {
    sed -E \
        -e 's/(password|passwd|token|secret|key|auth)[\s]*=[\s]*[^[:space:]]*/\1=<REDACTED>/gi' \
        -e 's/(api_key|api_token|auth_token)[\s]*:[\s]*[^[:space:]]*/\1: <REDACTED>/gi' \
        -e 's/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/<EMAIL_REDACTED>/g' \
        -e 's/([0-9]{1,3}\.){3}[0-9]{1,3}/<IP_REDACTED>/g' \
        -e 's/\/home\/[^\/]+/\/home\/<USER>/g'
}

# Write header
cat > "$OUTPUT_FILE" << EOF
# Arch Linux System Context
Generated: $(date)
Hostname: $(hostname)
Script Version: 2.0
Mode: $(if $BASIC_MODE; then echo "Basic"; elif [ -n "$SELECTED_MODULES" ]; then echo "Modules: $SELECTED_MODULES"; else echo "Full"; fi)

---

EOF

# Function to safely execute commands
safe_exec() {
    local cmd="$1"
    local section="$2"
    local filter_sensitive_data="${3:-false}"

    if command -v ${cmd%% *} &> /dev/null; then
        log "Collecting: $section"
        echo "## $section" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        if [ "$filter_sensitive_data" = true ]; then
            eval "$cmd" 2>&1 | filter_sensitive >> "$OUTPUT_FILE" || echo "Error executing: $cmd" >> "$OUTPUT_FILE"
        else
            eval "$cmd" >> "$OUTPUT_FILE" 2>&1 || echo "Error executing: $cmd" >> "$OUTPUT_FILE"
        fi
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    else
        warning "Skipping $section - Command not found: ${cmd%% *}"
    fi
}

# Function to collect configuration files
collect_config() {
    local file="$1"
    local description="$2"
    local max_lines="${3:-100}"
    local filter_sensitive_data="${4:-true}"

    if [[ -f "$file" ]] && [[ -r "$file" ]]; then
        log "Collecting configuration: $description"
        echo "## $description" >> "$OUTPUT_FILE"
        echo "File: \`$file\`" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        if [ "$filter_sensitive_data" = true ]; then
            head -n "$max_lines" "$file" 2>/dev/null | filter_sensitive >> "$OUTPUT_FILE" || echo "Could not read file" >> "$OUTPUT_FILE"
        else
            head -n "$max_lines" "$file" >> "$OUTPUT_FILE" 2>/dev/null || echo "Could not read file" >> "$OUTPUT_FILE"
        fi
        local lines=$(wc -l < "$file" 2>/dev/null || echo "0")
        if [[ $lines -gt $max_lines ]]; then
            echo "... (${lines} lines total, showing first ${max_lines})" >> "$OUTPUT_FILE"
        fi
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
}

# Check if module was selected
should_run_module() {
    local module="$1"

    if $BASIC_MODE; then
        case $module in
            hardware|os|packages|summary) return 0 ;;
            *) return 1 ;;
        esac
    elif [ -n "$SELECTED_MODULES" ]; then
        echo "$SELECTED_MODULES" | grep -q "$module" && return 0 || return 1
    else
        return 0  # Full mode - run everything
    fi
}

log "Starting system context generation..."
info "Output directory: $OUTPUT_DIR"

# 1. Hardware information
if should_run_module "hardware"; then
    echo "# Hardware & System Information" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "uname -a" "Kernel Information"
    safe_exec "lscpu | grep -E 'Model name:|CPU family:|CPU\(s\):|Thread\(s\):|Core\(s\):|Socket\(s\):|Flags:'" "CPU Information"
    safe_exec "free -h" "Memory Information"
    safe_exec "lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE,MODEL" "Disk Layout"
    safe_exec "df -h -t ext4 -t btrfs -t xfs -t vfat" "Disk Usage"
    safe_exec "lspci -nn | grep -E 'VGA|Audio|Network|NVMe|SATA'" "Key Hardware Components"

    # GPU-specific information
    if lspci | grep -q "NVIDIA"; then
        safe_exec "nvidia-smi --query-gpu=name,driver_version,memory.total,temperature.gpu --format=csv,noheader" "NVIDIA GPU Info"
    elif lspci | grep -q "AMD"; then
        safe_exec "glxinfo | grep -E 'OpenGL renderer|OpenGL version'" "AMD GPU Info"
    fi

    # Hardware sensors
    if command -v sensors &> /dev/null; then
        safe_exec "sensors" "Hardware Sensors"
    fi

    # S.M.A.R.T. Status (only if available)
    if command -v smartctl &> /dev/null && [ -e /dev/nvme0n1 ]; then
        safe_exec "sudo -n smartctl -a /dev/nvme0n1 | grep -E 'Model|Temperature|Percentage|Power_On|Available Spare' 2>/dev/null || echo 'smartctl requires sudo'" "NVMe Health"
    fi
fi

# 2. Operating system details
if should_run_module "os"; then
    echo "# Operating System Details" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "cat /etc/os-release" "OS Release Information"
    safe_exec "systemctl --version | head -n 2" "Systemd Version"
    safe_exec "localectl status" "Locale Settings"
    safe_exec "timedatectl status" "Time & Date Settings"
    safe_exec "hostnamectl status" "Hostname Configuration"
fi

# 3. Boot & Kernel
if should_run_module "boot"; then
    echo "# Boot & Kernel Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "cat /proc/cmdline" "Kernel Command Line"
    safe_exec "ls -la /boot/vmlinuz-* /boot/initramfs-*" "Available Kernels"

    # Bootloader
    collect_config "/boot/loader/loader.conf" "systemd-boot Configuration" 50 false
    collect_config "/etc/default/grub" "GRUB Configuration" 50 false

    # Kernel Modules
    safe_exec "lsmod | head -30" "Loaded Kernel Modules (Top 30)"
    collect_config "/etc/modules-load.d/*.conf" "Module Load Configuration" 20 false
fi

# 4. Package Management
if should_run_module "packages"; then
    echo "# Package Management" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    log "Collecting package information (may take a moment)..."
    safe_exec "pacman -Q | wc -l" "Total Installed Packages Count"

    # Explicitly installed packages (grouped)
    echo "## Explicitly Installed Packages (Grouped)" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    pacman -Qe | awk '{print $1}' | sort | awk '
    BEGIN { print "# Package Overview\n" }
    /^(linux|linux-)/ { linux = linux "\n" $0; next }
    /^(xorg|x11)/ { xorg = xorg "\n" $0; next }
    /^lib/ { libs = libs "\n" $0; next }
    /^python/ { python = python "\n" $0; next }
    /^(plasma|kde)/ { kde = kde "\n" $0; next }
    /^(gnome|gtk)/ { gnome = gnome "\n" $0; next }
    /^(docker|podman|container)/ { container = container "\n" $0; next }
    { other = other "\n" $0 }
    END {
        if (linux) print "\n## Kernel & System" linux
        if (xorg) print "\n## X.org/Display" xorg
        if (kde) print "\n## KDE/Plasma" kde
        if (gnome) print "\n## GNOME/GTK" gnome
        if (python) print "\n## Python" python
        if (container) print "\n## Container & Virtualization" container
        if (libs) print "\n## Libraries" libs
        if (other) print "\n## Other Packages" other
    }' >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # AUR Packages
    if command -v yay &> /dev/null; then
        safe_exec "yay -Qm" "AUR Packages"
    elif command -v paru &> /dev/null; then
        safe_exec "paru -Qm" "AUR Packages"
    fi

    # Orphan Packages
    safe_exec "pacman -Qdt | head -20" "Orphan Packages (Top 20)"
fi

# 5. System Configuration
if should_run_module "config"; then
    echo "# System Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Pacman configuration
    collect_config "/etc/pacman.conf" "Pacman Configuration"
    safe_exec "grep -E '^\[.*\]|^Server' /etc/pacman.d/mirrorlist | head -20" "Pacman Mirrors (Top 20)"

    # Filesystem
    collect_config "/etc/fstab" "Filesystem Mounts" 50 false
    safe_exec "findmnt -D -t ext4,btrfs,xfs,vfat" "Active Mounts with Options"

    # BTRFS details (if present)
    if mount | grep -q btrfs; then
        safe_exec "sudo -n btrfs subvolume list / 2>/dev/null || echo 'btrfs subvolume list requires sudo'" "BTRFS Subvolumes"
    fi
fi

# 6. Audio System
if should_run_module "audio"; then
    echo "# Audio Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    if command -v pactl &> /dev/null; then
        safe_exec "pactl info | grep -E 'Server Name:|Default S|Server Version:'" "PulseAudio/PipeWire Info"
        safe_exec "pactl list sinks short" "Audio Sinks"
        safe_exec "pactl list sources short" "Audio Sources"
    fi

    if command -v wpctl &> /dev/null; then
        safe_exec "wpctl status" "WirePlumber Status"
    fi

    # Audio Codecs
    safe_exec "cat /proc/asound/cards" "Sound Cards"

    collect_config "$HOME/.config/pipewire/pipewire.conf" "PipeWire Configuration" 50
    collect_config "/etc/asound.conf" "ALSA Configuration" 50
fi

# 7. Display Server & Desktop
if should_run_module "display"; then
    echo "# Display Server & Desktop Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
        echo "**Display Server**: Wayland (${WAYLAND_DISPLAY})" >> "$OUTPUT_FILE"
        safe_exec "echo \$XDG_SESSION_TYPE" "Session Type"
        safe_exec "echo \$XDG_CURRENT_DESKTOP" "Desktop Environment"

        # Wayland compositors
        for comp in sway hyprland wayfire; do
            if command -v $comp &> /dev/null; then
                safe_exec "$comp --version" "$comp Version"
            fi
        done
    elif [[ -n "${DISPLAY:-}" ]]; then
        echo "**Display Server**: X11 (${DISPLAY})" >> "$OUTPUT_FILE"
        safe_exec "xrandr --current | grep -E 'connected|\\*'" "Display Configuration"
        safe_exec "xset q | grep -A1 'DPMS'" "Display Power Management"
    fi

    # Desktop-specific configs
    if [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]]; then
        safe_exec "plasmashell --version" "Plasma Version"
        safe_exec "kreadconfig5 --file kdeglobals --group General --key ColorScheme" "KDE Color Scheme"
    elif [[ "$XDG_CURRENT_DESKTOP" == "GNOME" ]]; then
        safe_exec "gnome-shell --version" "GNOME Version"
        safe_exec "gsettings get org.gnome.desktop.interface gtk-theme" "GTK Theme"
    fi

    # Window Manager Configs
    collect_config "$HOME/.config/i3/config" "i3 Configuration" 50
    collect_config "$HOME/.config/sway/config" "Sway Configuration" 50
    collect_config "$HOME/.config/hypr/hyprland.conf" "Hyprland Configuration" 50
fi

# 8. Network Configuration
if should_run_module "network"; then
    echo "# Network Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "ip -brief addr show" "Network Interfaces" true
    safe_exec "ip route show default" "Default Routes" true
    safe_exec "systemctl is-active NetworkManager systemd-networkd systemd-resolved" "Network Services Status"
    safe_exec "resolvectl status | head -20" "DNS Configuration" true

    # Firewall
    if command -v ufw &> /dev/null; then
        safe_exec "sudo -n ufw status 2>/dev/null || echo 'ufw status requires sudo'" "UFW Firewall Status"
    fi
    if command -v firewall-cmd &> /dev/null; then
        safe_exec "sudo -n firewall-cmd --list-all 2>/dev/null || echo 'firewalld status requires sudo'" "Firewalld Status"
    fi
fi

# 9. Container & Virtualization
if should_run_module "containers"; then
    echo "# Container & Virtualization" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Docker
    if command -v docker &> /dev/null; then
        safe_exec "docker --version" "Docker Version"
        safe_exec "docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | head -20" "Docker Containers"
        safe_exec "docker images --format 'table {{.Repository}}\t{{.Tag}}\t{{.Size}}' | head -20" "Docker Images"
    fi

    # Podman
    if command -v podman &> /dev/null; then
        safe_exec "podman --version" "Podman Version"
        safe_exec "podman ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | head -20" "Podman Containers"
    fi

    # Systemd-nspawn
    if command -v machinectl &> /dev/null; then
        safe_exec "machinectl list" "Systemd Containers"
    fi

    # VirtualBox
    if command -v VBoxManage &> /dev/null; then
        safe_exec "VBoxManage list vms" "VirtualBox VMs"
    fi

    # libvirt/KVM
    if command -v virsh &> /dev/null; then
        safe_exec "virsh list --all" "libvirt/KVM VMs"
    fi
fi

# 10. Systemd Services
if should_run_module "services"; then
    echo "# Systemd Services" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "systemctl list-unit-files --state=enabled --type=service | grep -v '@' | head -30" "Enabled Services (Top 30)"
    safe_exec "systemctl --user list-unit-files --state=enabled --type=service | grep -v '@' | head -20" "Enabled User Services"
    safe_exec "systemctl list-timers --all" "Systemd Timers"
    safe_exec "systemd-analyze blame | head -20" "Slowest Starting Services"
    safe_exec "systemd-analyze critical-chain" "Boot Critical Chain"
fi

# 11. Development Environment
if should_run_module "development"; then
    echo "# Development Environment" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Programming languages and tools
    echo "## Installed Programming Languages & Tools" >> "$OUTPUT_FILE"
    for cmd in gcc g++ clang python python3 node npm yarn cargo rustc go java javac php ruby perl lua; do
        if command -v $cmd &> /dev/null; then
            version=$($cmd --version 2>&1 | head -n 1)
            echo "- **$cmd**: $version" >> "$OUTPUT_FILE"
        fi
    done
    echo "" >> "$OUTPUT_FILE"

    # Package Managers
    if command -v pip &> /dev/null; then
        safe_exec "pip list | grep -E 'django|flask|fastapi|numpy|pandas' | head -10" "Python Key Packages"
    fi

    if command -v npm &> /dev/null; then
        safe_exec "npm list -g --depth=0 | head -20" "Global NPM Packages"
    fi

    if command -v cargo &> /dev/null; then
        safe_exec "cargo install --list | head -20" "Cargo Installed Packages"
    fi

    # Git Configuration
    safe_exec "git config --global --list" "Git Global Configuration" true

    # Databases
    echo "## Database Services" >> "$OUTPUT_FILE"
    for service in postgresql mariadb mysql mongodb redis elasticsearch; do
        if systemctl list-unit-files | grep -q "^$service"; then
            status=$(systemctl is-active $service 2>/dev/null || echo "not installed")
            echo "- **$service**: $status" >> "$OUTPUT_FILE"
        fi
    done
    echo "" >> "$OUTPUT_FILE"

    # Web servers
    echo "## Web Servers" >> "$OUTPUT_FILE"
    for service in nginx apache2 httpd caddy; do
        if systemctl list-unit-files | grep -q "^$service"; then
            status=$(systemctl is-active $service 2>/dev/null || echo "not installed")
            echo "- **$service**: $status" >> "$OUTPUT_FILE"
        fi
    done
    echo "" >> "$OUTPUT_FILE"
fi

# 12. Shell Environment
if should_run_module "shell"; then
    echo "# Shell Environment" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    safe_exec "echo \$SHELL" "Default Shell"
    safe_exec "echo \$PATH | tr ':' '\n'" "PATH Environment"
    safe_exec "alias | head -20" "Shell Aliases (Top 20)"

    # Shell Configurations
    for file in ~/.bashrc ~/.zshrc ~/.config/fish/config.fish; do
        if [[ -f "$file" ]]; then
            collect_config "$file" "$(basename $file)" 50 true
        fi
    done

    # Environment variables (filtered)
    echo "## Key Environment Variables" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    env | grep -E '^(EDITOR|BROWSER|TERM|LANG|LC_|XDG_|DESKTOP)' | sort | filter_sensitive >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
fi

# 13. Security Configuration
if should_run_module "security"; then
    echo "# Security Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # AppArmor
    if command -v aa-status &> /dev/null; then
        safe_exec "sudo -n aa-status --complaining 2>/dev/null || echo 'AppArmor status requires sudo'" "AppArmor Status"
    fi

    # Encryption
    safe_exec "lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,UUID | grep -i crypt" "Encrypted Devices"

    # SSH
    collect_config "/etc/ssh/sshd_config" "SSH Server Configuration" 30 true
    safe_exec "ls -la ~/.ssh/ | grep -v 'known_hosts'" "SSH Directory Contents" true

    # sudo Configuration
    safe_exec "sudo -n grep -E '^[^#]' /etc/sudoers 2>/dev/null | head -10 || echo 'Sudoers file requires sudo'" "Sudoers Configuration (Top 10 lines)"
fi

# 14. Backup & Sync Tools
if should_run_module "backup"; then
    echo "# Backup & Synchronization" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Borg
    if command -v borg &> /dev/null; then
        safe_exec "borg --version" "Borg Version"
        safe_exec "ls -la ~/.config/borg/ 2>/dev/null || echo 'No borg config found'" "Borg Configuration"
    fi

    # Restic
    if command -v restic &> /dev/null; then
        safe_exec "restic version" "Restic Version"
    fi

    # rclone
    if command -v rclone &> /dev/null; then
        safe_exec "rclone version | head -3" "rclone Version"
        safe_exec "rclone listremotes" "rclone Remotes"
    fi

    # Syncthing
    if systemctl is-active syncthing@$USER &> /dev/null; then
        safe_exec "curl -s http://localhost:8384/rest/system/version 2>/dev/null | jq -r .version || echo 'Syncthing API not accessible'" "Syncthing Version"
    fi
fi

# 15. Performance Tuning
if should_run_module "performance"; then
    echo "# Performance & Resource Management" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # CPU Governor
    safe_exec "cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor | sort -u" "CPU Governors"

    # I/O Schedulers
    echo "## I/O Schedulers" >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    for disk in /sys/block/sd* /sys/block/nvme*; do
        if [[ -e "$disk/queue/scheduler" ]]; then
            echo "$(basename $disk): $(cat $disk/queue/scheduler)" >> "$OUTPUT_FILE"
        fi
    done
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Swappiness
    safe_exec "cat /proc/sys/vm/swappiness" "Swappiness Value"

    # Journal Size
    safe_exec "journalctl --disk-usage" "Journal Disk Usage"
fi

# 16. Multimedia Codecs
if should_run_module "multimedia"; then
    echo "# Multimedia Configuration" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Video Acceleration
    if command -v vainfo &> /dev/null; then
        safe_exec "vainfo 2>&1 | grep -E 'Driver|Profile' | head -20" "VA-API Info"
    fi

    if command -v vdpauinfo &> /dev/null; then
        safe_exec "vdpauinfo 2>&1 | grep -E 'Information|Decoder' | head -20" "VDPAU Info"
    fi

    # Installed Codecs
    safe_exec "pacman -Q | grep -E 'codec|ffmpeg|gstreamer' | sort" "Installed Codecs"
fi

# 17. Summary
if should_run_module "summary"; then
    echo "# System Summary" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    # Generate a summary
    KERNEL=$(uname -r)
    UPTIME=$(uptime -p)
    PACKAGES_TOTAL=$(pacman -Q | wc -l)
    PACKAGES_EXPLICIT=$(pacman -Qe | wc -l)
    SHELL_NAME=${SHELL##*/}
    DESKTOP=${XDG_CURRENT_DESKTOP:-Not set}
    SESSION=${XDG_SESSION_TYPE:-Not set}

    # CPU and RAM info
    CPU_MODEL=$(lscpu | grep "Model name" | cut -d: -f2 | xargs)
    RAM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')

    # Disk Usage
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

    cat >> "$OUTPUT_FILE" << EOF
## Quick Facts
- **Kernel**: $KERNEL
- **Uptime**: $UPTIME
- **CPU**: $CPU_MODEL
- **RAM**: $RAM_TOTAL
- **Root Disk Usage**: $DISK_USAGE
- **Package Count**: $PACKAGES_TOTAL total, $PACKAGES_EXPLICIT explicit
- **Shell**: $SHELL_NAME
- **Desktop**: $DESKTOP
- **Session**: $SESSION

## Enabled Key Services
EOF

    # List important active services
    for service in NetworkManager systemd-resolved sshd docker nginx postgresql; do
        if systemctl is-active $service &> /dev/null; then
            echo "- ✓ $service" >> "$OUTPUT_FILE"
        fi
    done

    cat >> "$OUTPUT_FILE" << EOF

## Context File Info
- **Generated**: $(date)
- **File Size**: $(du -h "$OUTPUT_FILE" | cut -f1)
- **Script Location**: $SCRIPT_DIR
- **Output Location**: $OUTPUT_FILE
- **Lines**: $(wc -l < "$OUTPUT_FILE")
EOF
fi

# Create symbolic link to latest version
ln -sf "$OUTPUT_FILE" "$LATEST_LINK"

# Cleanup: Keep only the last 5 context files
log "Cleaning up old context files..."
ls -t "$OUTPUT_DIR"/arch-context_*.md 2>/dev/null | tail -n +6 | xargs -r rm

# Completion
echo ""
log "${GREEN}✓ System context generated successfully!${NC}"
echo ""
echo "File saved to:"
echo "  ${BLUE}$OUTPUT_FILE${NC}"
echo ""
echo "Symbolic link (always current):"
echo "  ${BLUE}$LATEST_LINK${NC}"
echo ""
echo "Size: $(du -h "$OUTPUT_FILE" | cut -f1) | Lines: $(wc -l < "$OUTPUT_FILE")"
echo ""
echo "${YELLOW}Tip:${NC} Copy the contents of ${BLUE}$LATEST_LINK${NC} to your Claude project!"
echo ""

# Show available modules
if $BASIC_MODE || [ -n "$SELECTED_MODULES" ]; then
    echo "${INFO}Available modules for --modules option:${NC}"
    echo "  hardware, os, boot, packages, config, audio, display, network,"
    echo "  containers, services, development, shell, security, backup,"
    echo "  performance, multimedia, summary"
    echo ""
fi
