#!/bin/bash

# Create output file with timestamp
OUTPUT_FILE="$HOME/gtk-theme-debug-$(date +%Y%m%d-%H%M%S).txt"

echo "GTK Theme Diagnostic Report" > "$OUTPUT_FILE"
echo "=========================" >> "$OUTPUT_FILE"
echo "Generated: $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# System Information
echo "=== SYSTEM INFO ===" >> "$OUTPUT_FILE"
echo "OS: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)" >> "$OUTPUT_FILE"
echo "Kernel: $(uname -r)" >> "$OUTPUT_FILE"
echo "Desktop: $XDG_CURRENT_DESKTOP" >> "$OUTPUT_FILE"
echo "Session: $XDG_SESSION_TYPE" >> "$OUTPUT_FILE"
echo "Display: $DISPLAY" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Environment Variables
echo "=== ENVIRONMENT VARIABLES ===" >> "$OUTPUT_FILE"
echo "GTK_THEME=$GTK_THEME" >> "$OUTPUT_FILE"
echo "GTK2_RC_FILES=$GTK2_RC_FILES" >> "$OUTPUT_FILE"
echo "QT_STYLE_OVERRIDE=$QT_STYLE_OVERRIDE" >> "$OUTPUT_FILE"
echo "QT_QPA_PLATFORMTHEME=$QT_QPA_PLATFORMTHEME" >> "$OUTPUT_FILE"
echo "XDG_CONFIG_HOME=$XDG_CONFIG_HOME" >> "$OUTPUT_FILE"
echo "HOME=$HOME" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Check which startup files exist
echo "=== STARTUP FILES ===" >> "$OUTPUT_FILE"
for file in ~/.profile ~/.xprofile ~/.xsession ~/.xsessionrc ~/.xinitrc ~/.bashrc ~/.zshrc; do
    if [ -f "$file" ]; then
        echo "$file exists:" >> "$OUTPUT_FILE"
        grep -E "GTK_THEME|GTK2_RC|QT_" "$file" 2>/dev/null | sed 's/^/  /' >> "$OUTPUT_FILE"
    else
        echo "$file does not exist" >> "$OUTPUT_FILE"
    fi
done
echo "" >> "$OUTPUT_FILE"

# GTK Settings Files
echo "=== GTK CONFIGURATION FILES ===" >> "$OUTPUT_FILE"
echo "--- ~/.config/gtk-3.0/settings.ini ---" >> "$OUTPUT_FILE"
if [ -f ~/.config/gtk-3.0/settings.ini ]; then
    cat ~/.config/gtk-3.0/settings.ini >> "$OUTPUT_FILE"
else
    echo "File not found" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

echo "--- ~/.config/gtk-4.0/settings.ini ---" >> "$OUTPUT_FILE"
if [ -f ~/.config/gtk-4.0/settings.ini ]; then
    cat ~/.config/gtk-4.0/settings.ini >> "$OUTPUT_FILE"
else
    echo "File not found" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

echo "--- ~/.gtkrc-2.0 ---" >> "$OUTPUT_FILE"
if [ -f ~/.gtkrc-2.0 ]; then
    cat ~/.gtkrc-2.0 >> "$OUTPUT_FILE"
else
    echo "File not found" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

echo "--- ~/.gtkrc-2.0.mine ---" >> "$OUTPUT_FILE"
if [ -f ~/.gtkrc-2.0.mine ]; then
    cat ~/.gtkrc-2.0.mine >> "$OUTPUT_FILE"
else
    echo "File not found" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

# XFCE Settings
echo "=== XFCE SETTINGS ===" >> "$OUTPUT_FILE"
echo "xfconf-query -c xsettings -lv:" >> "$OUTPUT_FILE"
xfconf-query -c xsettings -lv 2>/dev/null | grep -E "Theme|Dark|Color" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "xfconf-query -c xfwm4 -p /general/theme:" >> "$OUTPUT_FILE"
xfconf-query -c xfwm4 -p /general/theme 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# GSettings/dconf
echo "=== GSETTINGS/DCONF ===" >> "$OUTPUT_FILE"
echo "GTK Theme:" >> "$OUTPUT_FILE"
gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null >> "$OUTPUT_FILE"
echo "Color Scheme:" >> "$OUTPUT_FILE"
gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null || echo "Key not found" >> "$OUTPUT_FILE"
echo "Prefer Dark Theme:" >> "$OUTPUT_FILE"
gsettings get org.gnome.desktop.interface gtk-application-prefer-dark-theme 2>/dev/null || echo "Key not found" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Check dconf directly
echo "=== DCONF DIRECT ===" >> "$OUTPUT_FILE"
if command -v dconf &> /dev/null; then
    echo "dconf dump /org/gnome/desktop/interface/ (theme related):" >> "$OUTPUT_FILE"
    dconf dump /org/gnome/desktop/interface/ 2>/dev/null | grep -E "theme|dark|color" >> "$OUTPUT_FILE"
else
    echo "dconf not installed" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

# Portal Services
echo "=== XDG DESKTOP PORTAL ===" >> "$OUTPUT_FILE"
echo "Portal services status:" >> "$OUTPUT_FILE"
systemctl --user status xdg-desktop-portal-gtk 2>/dev/null | head -3 >> "$OUTPUT_FILE"
systemctl --user status xdg-desktop-portal 2>/dev/null | head -3 >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Check portal theme via D-Bus
echo "Portal reported theme:" >> "$OUTPUT_FILE"
dbus-send --session --print-reply --dest=org.freedesktop.portal.Desktop \
  /org/freedesktop/portal/desktop \
  org.freedesktop.portal.Settings.Read \
  string:"org.gnome.desktop.interface" \
  string:"gtk-theme" 2>/dev/null | grep -A1 variant >> "$OUTPUT_FILE" || echo "Could not query portal" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Settings Daemons
echo "=== SETTINGS DAEMONS ===" >> "$OUTPUT_FILE"
echo "Running daemons:" >> "$OUTPUT_FILE"
ps aux | grep -E "xfsettingsd|xsettingsd|gsd-xsettings" | grep -v grep >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Systemd User Environment
echo "=== SYSTEMD USER ENVIRONMENT ===" >> "$OUTPUT_FILE"
echo "~/.config/environment.d/:" >> "$OUTPUT_FILE"
if [ -d ~/.config/environment.d/ ]; then
    ls -la ~/.config/environment.d/ >> "$OUTPUT_FILE"
    for file in ~/.config/environment.d/*.conf; do
        if [ -f "$file" ]; then
            echo "Content of $(basename $file):" >> "$OUTPUT_FILE"
            cat "$file" >> "$OUTPUT_FILE"
        fi
    done
else
    echo "Directory does not exist" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

# System-wide environment
echo "=== SYSTEM-WIDE ENVIRONMENT ===" >> "$OUTPUT_FILE"
echo "/etc/environment:" >> "$OUTPUT_FILE"
grep -E "GTK|QT" /etc/environment 2>/dev/null || echo "No GTK/QT variables found" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "/etc/profile.d/ (GTK related):" >> "$OUTPUT_FILE"
ls -la /etc/profile.d/*gtk* /etc/profile.d/*theme* 2>/dev/null || echo "No theme-related files" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Claude Desktop specific
echo "=== CLAUDE DESKTOP ===" >> "$OUTPUT_FILE"
echo "Installation location:" >> "$OUTPUT_FILE"
which claude-desktop >> "$OUTPUT_FILE"
ls -la $(which claude-desktop) 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Desktop file locations:" >> "$OUTPUT_FILE"
ls -la /usr/share/applications/claude-desktop.desktop 2>/dev/null >> "$OUTPUT_FILE"
ls -la ~/.local/share/applications/claude-desktop.desktop 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Claude config (theme related):" >> "$OUTPUT_FILE"
if [ -f ~/.config/Claude/Preferences ]; then
    grep -E -i "theme|dark|color|scheme" ~/.config/Claude/Preferences | head -10 >> "$OUTPUT_FILE"
else
    echo "No Preferences file found" >> "$OUTPUT_FILE"
fi
echo "" >> "$OUTPUT_FILE"

# Package Info
echo "=== INSTALLED PACKAGES ===" >> "$OUTPUT_FILE"
echo "Theme packages:" >> "$OUTPUT_FILE"
pacman -Q | grep -E "arc|theme|gtk|qt5ct|kvantum" | grep -v lib >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Claude Desktop version:" >> "$OUTPUT_FILE"
pacman -Q claude-desktop 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Arc-Dark theme files
echo "=== ARC-DARK THEME FILES ===" >> "$OUTPUT_FILE"
echo "Theme directory exists:" >> "$OUTPUT_FILE"
ls -ld /usr/share/themes/Arc-Dark 2>/dev/null >> "$OUTPUT_FILE"
ls -ld /usr/share/themes/Arc-Dark/gtk-3.0 2>/dev/null >> "$OUTPUT_FILE"
ls -ld /usr/share/themes/Arc-Dark/gtk-3.20 2>/dev/null >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Current process environment (for debugging)
echo "=== CURRENT SHELL ENVIRONMENT ===" >> "$OUTPUT_FILE"
echo "Shell: $SHELL" >> "$OUTPUT_FILE"
echo "Terminal: $TERM" >> "$OUTPUT_FILE"
env | grep -E "GTK|QT|XDG|THEME" | sort >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Test theme detection
echo "=== THEME DETECTION TEST ===" >> "$OUTPUT_FILE"
echo "Testing what theme would be used for a new GTK app:" >> "$OUTPUT_FILE"
echo "GTK_DEBUG=interactive gtk3-demo 2>&1 | head -1" >> "$OUTPUT_FILE"
echo "(Would show theme loading - not running to avoid GUI popup)" >> "$OUTPUT_FILE"

echo "" >> "$OUTPUT_FILE"
echo "=== END OF REPORT ===" >> "$OUTPUT_FILE"

# Summary
echo ""
echo "Diagnostic report saved to: $OUTPUT_FILE"
echo ""
echo "Quick Summary:"
echo "-------------"
echo "GTK_THEME env var: ${GTK_THEME:-NOT SET}"
echo -n "XFCE theme: "
xfconf-query -c xsettings -p /Net/ThemeName 2>/dev/null || echo "NOT SET"
echo -n "GSettings theme: "
gsettings get org.gnome.desktop.interface gtk-theme 2>/dev/null || echo "NOT SET"
echo -n "Dark preference: "
gsettings get org.gnome.desktop.interface gtk-application-prefer-dark-theme 2>/dev/null || echo "NOT SET"

echo ""
echo "You can view the full report with:"
echo "cat $OUTPUT_FILE | less"
