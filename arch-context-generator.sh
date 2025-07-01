#!/bin/bash
# arch-context-generator.sh
# Generiert umfassenden System-Kontext für Claude Projekte

set -euo pipefail

# Konfiguration
OUTPUT_DIR="."
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="${OUTPUT_DIR}/arch-context_${TIMESTAMP}.md"
LATEST_LINK="${OUTPUT_DIR}/arch-context_latest.md"

# Farben für Terminal-Output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Erstelle Output-Verzeichnis
mkdir -p "$OUTPUT_DIR"

# Logging-Funktion
log() {
    echo -e "${GREEN}[$(date +"%H:%M:%S")]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Header schreiben
cat > "$OUTPUT_FILE" << EOF
# Arch Linux System Context
Generated: $(date)
Hostname: $(hostname)

---

EOF

# Funktion zum sicheren Ausführen von Befehlen
safe_exec() {
    local cmd="$1"
    local section="$2"
    
    if command -v ${cmd%% *} &> /dev/null; then
        log "Sammle: $section"
        echo "## $section" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        eval "$cmd" >> "$OUTPUT_FILE" 2>&1 || echo "Fehler beim Ausführen: $cmd" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    else
        warning "Überspringe $section - Befehl nicht gefunden: ${cmd%% *}"
    fi
}

# Funktion zum Sammeln von Konfigurationsdateien
collect_config() {
    local file="$1"
    local description="$2"
    
    if [[ -f "$file" ]]; then
        log "Sammle Konfiguration: $description"
        echo "## $description" >> "$OUTPUT_FILE"
        echo "Datei: \`$file\`" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        # Limitiere auf 100 Zeilen pro Datei
        head -n 100 "$file" >> "$OUTPUT_FILE" 2>/dev/null || echo "Konnte Datei nicht lesen" >> "$OUTPUT_FILE"
        local lines=$(wc -l < "$file" 2>/dev/null || echo "0")
        if [[ $lines -gt 100 ]]; then
            echo "... (${lines} Zeilen insgesamt, zeige erste 100)" >> "$OUTPUT_FILE"
        fi
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
}

log "Starte System-Kontext-Generierung..."

# 1. Hardware-Informationen
echo "# Hardware & System Information" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "uname -a" "Kernel Information"
safe_exec "lscpu | grep -E 'Model name:|CPU family:|CPU\(s\):|Thread\(s\):|Core\(s\):|Socket\(s\):'" "CPU Information"
safe_exec "free -h" "Memory Information"
safe_exec "lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE" "Disk Layout"
safe_exec "df -h -t ext4 -t btrfs -t xfs -t vfat" "Disk Usage"
safe_exec "lspci | grep -E 'VGA|Audio|Network'" "Key Hardware Components"

# GPU-spezifische Informationen
if lspci | grep -q "NVIDIA"; then
    safe_exec "nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader" "NVIDIA GPU Info"
elif lspci | grep -q "AMD"; then
    safe_exec "glxinfo | grep -E 'OpenGL renderer|OpenGL version'" "AMD GPU Info"
fi

# 2. Betriebssystem-Details
echo "# Operating System Details" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "cat /etc/os-release" "OS Release Information"
safe_exec "systemctl --version | head -n 2" "Systemd Version"
safe_exec "localectl status" "Locale Settings"
safe_exec "timedatectl status" "Time & Date Settings"

# 3. Package Management
echo "# Package Management" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

log "Sammle Package-Informationen (kann etwas dauern)..."
safe_exec "pacman -Q | wc -l" "Total Installed Packages Count"

# Explizit installierte Packages (gruppiert)
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
{ other = other "\n" $0 }
END {
    if (linux) print "\n## Kernel & System" linux
    if (xorg) print "\n## X.org/Display" xorg
    if (kde) print "\n## KDE/Plasma" kde
    if (gnome) print "\n## GNOME/GTK" gnome
    if (python) print "\n## Python" python
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

# 4. Wichtige Konfigurationen
echo "# System Configuration" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Pacman Konfiguration
collect_config "/etc/pacman.conf" "Pacman Configuration"
safe_exec "grep -E '^\[.*\]|^Server' /etc/pacman.d/mirrorlist | head -20" "Pacman Mirrors (Top 20)"

# 5. Audio System
echo "# Audio Configuration" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

if command -v pactl &> /dev/null; then
    safe_exec "pactl info | grep -E 'Server Name:|Default S'" "PulseAudio/PipeWire Info"
    safe_exec "pactl list sinks short" "Audio Sinks"
    safe_exec "pactl list sources short" "Audio Sources"
fi

if command -v wpctl &> /dev/null; then
    safe_exec "wpctl status" "WirePlumber Status"
fi

collect_config "$HOME/.config/pipewire/pipewire.conf" "PipeWire Configuration"
collect_config "/etc/asound.conf" "ALSA Configuration"

# 6. Display Server
echo "# Display Server Configuration" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    echo "**Display Server**: Wayland (${WAYLAND_DISPLAY})" >> "$OUTPUT_FILE"
    safe_exec "echo \$XDG_SESSION_TYPE" "Session Type"
elif [[ -n "${DISPLAY:-}" ]]; then
    echo "**Display Server**: X11 (${DISPLAY})" >> "$OUTPUT_FILE"
    safe_exec "xrandr --current | grep -E 'connected|\\*'" "Display Configuration"
fi

# 7. Network Configuration
echo "# Network Configuration" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "ip -brief addr show" "Network Interfaces"
safe_exec "systemctl is-active NetworkManager systemd-networkd systemd-resolved" "Network Services Status"
safe_exec "resolvectl status | head -20" "DNS Configuration"

# 8. Systemd Services
echo "# Systemd Services" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "systemctl list-unit-files --state=enabled --type=service | grep -v '@'" "Enabled Services"
safe_exec "systemctl --user list-unit-files --state=enabled --type=service | grep -v '@'" "Enabled User Services"

# 9. Entwicklungsumgebung
echo "# Development Environment" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Programmiersprachen und Tools
for cmd in gcc g++ python python3 node npm cargo rustc go java javac php ruby perl; do
    if command -v $cmd &> /dev/null; then
        version=$($cmd --version 2>&1 | head -n 1)
        echo "- **$cmd**: $version" >> "$OUTPUT_FILE"
    fi
done
echo "" >> "$OUTPUT_FILE"

# 10. Shell-Umgebung
echo "# Shell Environment" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "echo \$SHELL" "Default Shell"
safe_exec "echo \$PATH | tr ':' '\n'" "PATH Environment"

# Wichtige dotfiles
for file in ~/.bashrc ~/.zshrc ~/.config/fish/config.fish; do
    if [[ -f "$file" ]]; then
        echo "## $(basename $file) (erste 50 Zeilen)" >> "$OUTPUT_FILE"
        echo '```bash' >> "$OUTPUT_FILE"
        head -n 50 "$file" >> "$OUTPUT_FILE"
        echo '```' >> "$OUTPUT_FILE"
        echo "" >> "$OUTPUT_FILE"
    fi
done

# 11. Sicherheit
echo "# Security Configuration" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

safe_exec "sudo -n grep -E '^[^#]' /etc/sudoers 2>/dev/null || echo 'Sudoers nicht lesbar ohne Passwort'" "Sudoers Configuration"
safe_exec "systemctl is-active ufw firewalld iptables" "Firewall Status"

# 12. Zusammenfassung
echo "# System Summary" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

cat >> "$OUTPUT_FILE" << EOF
## Quick Facts
- **Kernel**: $(uname -r)
- **Uptime**: $(uptime -p)
- **Package Count**: $(pacman -Q | wc -l) total, $(pacman -Qe | wc -l) explicit
- **Shell**: ${SHELL##*/}
- **Desktop**: ${XDG_CURRENT_DESKTOP:-Not set}
- **Session**: ${XDG_SESSION_TYPE:-Not set}

## Context File Info
- **Generated**: $(date)
- **File Size**: $(du -h "$OUTPUT_FILE" | cut -f1)
- **Location**: $OUTPUT_FILE
EOF

# Erstelle symbolischen Link zur neuesten Version
ln -sf "$OUTPUT_FILE" "$LATEST_LINK"

# Aufräumen: Behalte nur die letzten 5 Context-Dateien
log "Räume alte Context-Dateien auf..."
ls -t "$OUTPUT_DIR"/arch-context_*.md | tail -n +6 | xargs -r rm

# Abschluss
echo ""
log "${GREEN}✓ System-Kontext erfolgreich generiert!${NC}"
echo ""
echo "Datei gespeichert unter:"
echo "  $OUTPUT_FILE"
echo ""
echo "Symbolischer Link (immer aktuell):"
echo "  $LATEST_LINK"
echo ""
echo "Größe: $(du -h "$OUTPUT_FILE" | cut -f1)"
echo ""
echo "Tipp: Kopieren Sie den Inhalt von $LATEST_LINK in Ihr Claude-Projekt!"
