# Arch Linux System Context
Generated: Mo 27. Apr 13:07:06 CEST 2026
Hostname: 
Script Version: 2.0
Mode: Full

---

# Hardware & System Information

## Kernel Information
```
Linux jajapc 6.19.12-arch1-1 #1 SMP PREEMPT_DYNAMIC Sat, 11 Apr 2026 22:36:29 +0000 x86_64 GNU/Linux
```

## CPU Information
```
CPU(s):                                  16
Model name:                              12th Gen Intel(R) Core(TM) i7-1260P
CPU family:                              6
Socket(s):                               1
Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr ibt flush_l1d arch_capabilities
NUMA node0 CPU(s):                       0-15
```

## Memory Information
```
               total        used        free      shared  buff/cache   available
Mem:            30Gi        14Gi       4,8Gi       1,4Gi        13Gi        16Gi
Swap:           29Gi        11Mi        29Gi
```

## Disk Layout
```
NAME          SIZE TYPE MOUNTPOINT FSTYPE    MODEL
nvme0n1     953,9G disk                      PM9A1 NVMe Samsung 1024GB
├─nvme0n1p1   100M part /boot/efi  vfat      
├─nvme0n1p2    16M part                      
├─nvme0n1p3 210,8G part            BitLocker 
├─nvme0n1p4   2,5G part            vfat      
├─nvme0n1p5 739,6G part /          ext4      
└─nvme0n1p6   828M part            ntfs      
```

## Disk Usage
```
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p5  727G  665G   26G  97% /
/dev/nvme0n1p1   96M   65M   32M  68% /boot/efi
```

## Key Hardware Components
```
00:02.0 VGA compatible controller [0300]: Intel Corporation Alder Lake-P GT2 [Iris Xe Graphics] [8086:46a6] (rev 0c)
00:14.3 Network controller [0280]: Intel Corporation Alder Lake-P PCH CNVi WiFi [8086:51f0] (rev 01)
00:1f.3 Multimedia audio controller [0401]: Intel Corporation Alder Lake PCH-P High Definition Audio Controller [8086:51c8] (rev 01)
01:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd NVMe SSD Controller PM9A1/PM9A3/980PRO [144d:a80a]
```

## Hardware Sensors
```
ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:          20.00 V  (min =  +5.00 V, max = +20.00 V)
curr1:         2.70 A  (max =  +2.70 A)

iwlwifi_1-virtual-0
Adapter: Virtual device
temp1:        +46.0°C  

dell_smm-virtual-0
Adapter: Virtual device
fan1:        2794 RPM  (min =    0 RPM, max = 6800 RPM)
fan2:        2685 RPM  (min =    0 RPM, max = 6500 RPM)
temp1:        +35.0°C  
temp2:        +44.0°C  
temp3:        +45.0°C  
temp4:        +45.0°C  
temp5:        +47.0°C  
temp6:        +36.0°C  
temp7:        +29.0°C  
pwm1:             64%  MANUAL CONTROL
pwm2:             64%  MANUAL CONTROL

nvme-pci-0100
Adapter: PCI adapter
Composite:    +45.9°C  (low  = -273.1°C, high = +82.8°C)
                       (crit = +84.8°C)
Sensor 1:     +45.9°C  (low  = -273.1°C, high = +65261.8°C)
Sensor 2:     +47.9°C  (low  = -273.1°C, high = +65261.8°C)

mt7921_phy1-virtual-0
Adapter: Virtual device
temp1:        +34.0°C  

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =  +5.00 V, max =  +5.00 V)
curr1:       1000.00 mA (max =  +1.00 A)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +56.0°C  (high = +100.0°C, crit = +100.0°C)
Core 0:        +50.0°C  (high = +100.0°C, crit = +100.0°C)
Core 4:        +52.0°C  (high = +100.0°C, crit = +100.0°C)
Core 8:        +56.0°C  (high = +100.0°C, crit = +100.0°C)
Core 12:       +54.0°C  (high = +100.0°C, crit = +100.0°C)
Core 16:       +52.0°C  (high = +100.0°C, crit = +100.0°C)
Core 17:       +52.0°C  (high = +100.0°C, crit = +100.0°C)
Core 18:       +52.0°C  (high = +100.0°C, crit = +100.0°C)
Core 19:       +51.0°C  (high = +100.0°C, crit = +100.0°C)
Core 20:       +49.0°C  (high = +100.0°C, crit = +100.0°C)
Core 21:       +49.0°C  (high = +100.0°C, crit = +100.0°C)
Core 22:       +49.0°C  (high = +100.0°C, crit = +100.0°C)
Core 23:       +49.0°C  (high = +100.0°C, crit = +100.0°C)

dell_ddv-virtual-0
Adapter: Virtual device
CPU Fan:     2794 RPM
CPU Fan:     2685 RPM
CPU:          +35.0°C  (low  =  +0.0°C, high =  +0.0°C)
Ambient:      +44.0°C  (low  =  +0.0°C, high =  +0.0°C)
SODIMM:       +45.0°C  (low  =  +0.0°C, high =  +0.0°C)
Ambient:      +45.0°C  (low  =  +0.0°C, high =  +0.0°C)
Ambient:      +47.0°C  (low  =  +0.0°C, high =  +0.0°C)
Ambient:      +36.0°C  (low  =  +0.0°C, high =  +0.0°C)
Unknown:      +29.0°C  (low  =  +0.0°C, high =  +0.0°C)

BAT0-acpi-0
Adapter: ACPI interface
in0:          12.51 V  
temp:         +29.4°C  
curr1:       1000.00 uA 

```

## NVMe Health
```
sudo: a password is required
smartctl requires sudo
```

# Operating System Details

## OS Release Information
```
NAME="Arch Linux"
PRETTY_NAME="Arch Linux"
ID=arch
BUILD_ID=rolling
ANSI_COLOR="38;2;23;147;209"
HOME_URL="https://archlinux.org/"
DOCUMENTATION_URL="https://wiki.archlinux.org/"
SUPPORT_URL="https://bbs.archlinux.org/"
BUG_REPORT_URL="https://gitlab.archlinux.org/groups/archlinux/-/issues"
PRIVACY_POLICY_URL="https://terms.archlinux.org/docs/privacy-policy/"
LOGO=archlinux-logo
```

## Systemd Version
```
systemd 260 (260.1-1-arch)
+PAM +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 +KMOD +LIBCRYPTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP +LIBARCHIVE
```

## Locale Settings
```
System Locale: LANG=en_US.UTF-8
               LC_NUMERIC=de_DE.UTF-8
               LC_TIME=de_DE.UTF-8
               LC_MONETARY=de_DE.UTF-8
               LC_PAPER=de_DE.UTF-8
               LC_NAME=de_DE.UTF-8
               LC_ADDRESS=de_DE.UTF-8
               LC_TELEPHONE=de_DE.UTF-8
               LC_MEASUREMENT=de_DE.UTF-8
               LC_IDENTIFICATION=de_DE.UTF-8
    VC Keymap: de
   X11 Layout: de
    X11 Model: dell101
  X11 Variant: nodeadkeys
```

## Time & Date Settings
```
               Local time: Mo 2026-04-27 13:07:07 CEST
           Universal time: Mo 2026-04-27 11:07:07 UTC
                 RTC time: Mo 2026-04-27 11:07:07
                Time zone: Europe/Berlin (CEST, +0200)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no
```

## Hostname Configuration
```
 Static hostname: jajapc
       Icon name: computer-laptop
         Chassis: laptop 💻
      Machine ID: fa40f04e442940fa844c0b613295a734
         Boot ID: 7ed7a87b35974e7ca51b1998a793aa74
Operating System: Arch Linux
          Kernel: Linux 6.19.12-arch1-1
    Architecture: x86-64
 Hardware Vendor: Dell Inc.
  Hardware Model: XPS 9320
    Hardware SKU: 0AF3
Hardware Version: A00
Firmware Version: 2.0.0
   Firmware Date: Mon 2023-02-06
    Firmware Age: 3y 2month 2w 5d
```

# Boot & Kernel Configuration

## Kernel Command Line
```
BOOT_IMAGE=/boot/vmlinuz-linux root=UUID=5c148df8-cbd4-4e4f-aba0-4bb6d63778c8 rw loglevel=3 audit=0 nvme_load=yes i915.enable_psr2_sel_fetch=0
```

## Available Kernels
```
-rw------- 1 root root 201253853 20. Apr 22:44 /boot/initramfs-linux-fallback.img
-rw------- 1 root root  21585920 20. Apr 22:44 /boot/initramfs-linux.img
-rw-r--r-- 1 root root  16478720 20. Apr 22:43 /boot/vmlinuz-linux
```

## GRUB Configuration
File: `/etc/default/grub`
```
# GRUB boot loader configuration

GRUB_DEFAULT="0"
GRUB_TIMEOUT="1"
GRUB_DISTRIBUTOR="ArcoLinux"
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 audit=0 nvme_load=yes i915.enable_psr2_sel_fetch=0"
GRUB_CMDLINE_LINUX=""

# Preload both GPT and MBR modules so that they are not missed
GRUB_PRELOAD_MODULES="part_gpt part_msdos"

# Uncomment to enable booting from LUKS encrypted devices
#GRUB_ENABLE_CRYPTODISK="y"

# Set to 'countdown' or 'hidden' to change timeout behavior,
# press ESC key to display menu.
GRUB_TIMEOUT_STYLE="menu"

# Uncomment to use basic console
GRUB_TERMINAL_INPUT="console"

# Uncomment to disable graphical terminal
#GRUB_TERMINAL_OUTPUT="console"

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command `videoinfo'
GRUB_GFXMODE="auto"

# Uncomment to allow the kernel use the same resolution used by grub
GRUB_GFXPAYLOAD_LINUX="keep"

# Uncomment if you want GRUB to pass to the Linux kernel the old parameter
# format "root=/dev/xxx" instead of "root=/dev/disk/by-uuid/xxx"
#GRUB_DISABLE_LINUX_UUID="true"

# Uncomment to disable generation of recovery mode menu entries
GRUB_DISABLE_RECOVERY="true"

# Uncomment and set to the desired menu colors.  Used by normal and wallpaper
# modes only.  Entries specified as foreground/background.
#GRUB_COLOR_NORMAL="light-blue/black"
#GRUB_COLOR_HIGHLIGHT="light-cyan/blue"

# Uncomment one of them for the gfx desired, a image background or a gfxtheme
#GRUB_BACKGROUND="/path/to/wallpaper"
#GRUB_THEME="/boot/grub/themes/Vimix/theme.txt"

# Uncomment to get a beep at GRUB start
#GRUB_INIT_TUNE="480 440 1"
... (64 lines total, showing first 50)
```

## Loaded Kernel Modules (Top 30)
```
Module                  Size  Used by
tun                    73728  2
uinput                 24576  0
rfcomm                110592  4
snd_seq_dummy          12288  0
snd_hrtimer            12288  1
snd_seq               135168  7 snd_seq_dummy
xt_conntrack           12288  4
xt_MASQUERADE          16384  4
bridge                462848  0
stp                    12288  1 bridge
llc                    16384  2 bridge,stp
xfrm_user              77824  1
xfrm_algo              16384  1 xfrm_user
xt_set                 24576  0
ip_set                 69632  1 xt_set
nft_chain_nat          12288  5
nf_nat                 65536  2 nft_chain_nat,xt_MASQUERADE
nf_conntrack          196608  3 xt_conntrack,nf_nat,xt_MASQUERADE
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         12288  1 nf_conntrack
xt_addrtype            12288  4
nft_compat             24576  12
x_tables               65536  5 xt_conntrack,nft_compat,xt_addrtype,xt_set,xt_MASQUERADE
nf_tables             397312  126 nft_compat,nft_chain_nat
intel_ipu6_isys       143360  0
videobuf2_dma_sg       24576  1 intel_ipu6_isys
ivsc_ace               16384  0
ivsc_csi               20480  1
uhid                   28672  3
Error executing: lsmod | head -30
```

# Package Management

## Total Installed Packages Count
```
2058
```

## Explicitly Installed Packages (Grouped)
```
# Package Overview


## Kernel & System
linux
linux-atm
linux-firmware
linux-firmware-marvell
linux-firmware-qlogic
linux-headers

## X.org/Display
xorg-bdftopcf
xorg-iceauth
xorg-mkfontscale
xorg-server
xorg-sessreg
xorg-setxkbmap
xorg-smproxy
xorg-x11perf
xorg-xauth
xorg-xbacklight
xorg-xcmsdb
xorg-xcursorgen
xorg-xdpyinfo
xorg-xdriinfo
xorg-xev
xorg-xgamma
xorg-xhost
xorg-xinit
xorg-xinput
xorg-xkbcomp
xorg-xkbevd
xorg-xkbprint
xorg-xkbutils
xorg-xkill
xorg-xlsatoms
xorg-xlsclients
xorg-xmodmap
xorg-xpr
xorg-xprop
xorg-xrandr
xorg-xrdb
xorg-xrefresh
xorg-xset
xorg-xsetroot
xorg-xvinfo
xorg-xwd
xorg-xwininfo
xorg-xwud

## GNOME/GTK
gnome-disk-utility
gnome-keyring
gnome-screenshot
gnome-shell-extensions
gnome-software
gnome-system-monitor
gnome-terminal

## Python
python-openpyxl
python-pandas
python-pip
python-pipx
python-poetry
python-pylint
python-pyparted
python-pywal
python-virtualenv
python-weasyprint

## Container & Virtualization
docker
docker-buildx
docker-compose

## Libraries
lib32-giflib
lib32-gnutls
lib32-gst-plugins-base-libs
lib32-gtk3
lib32-libpng
lib32-libva
lib32-libxcomposite
lib32-libxinerama
lib32-libxslt
lib32-ocl-icd
lib32-openal
lib32-v4l-utils
libdvdcss
libfido2
libgsf
libmtp
libopenraw
libpwquality
libreoffice-fresh
libusb-compat

## Other Packages
7zip
accountsservice
adobe-source-sans-fonts
aic94xx-firmware
alacritty
alacritty-themes
alsa-firmware
alsa-lib
alsa-plugins
alsa-utils
ananicy-cpp
android-sdk
android-sdk-build-tools
android-sdk-platform-tools
android-studio
android-tools
appstream
arandr
arc-gtk-theme
arch-audit
arch-install-scripts
archiso
archlinux-logout-git
archlinux-tweak-tool-git
arch-rebuild-order
arch-repro-status
arch-signoff
asar
asciinema
atril
ausweisapp2
autorandr
avahi
awesome-terminal-fonts
baobab
base
base-devel
bash-completion
bat
bfg
bibata-cursor-theme
bind
blueberry
bluez
bluez-libs
bluez-utils
boost-libs
brave-bin
broadcom-wl-dkms
btop
btrfs-progs
cachyos-ananicy-rules-git
candy-icons-git
catfish
chromium
cinnamon
cinnamon-translations
claude-cowork-service
claude-desktop-bin
clonezilla
code-insiders-bin
composer
cronie
cryptsetup
cups
cups-filters
cups-pdf
dconf-editor
ddrescue
devtools
devtoys-bin
dex
dhclient
dialog
diffutils
dmenu
dmidecode
dmraid
dnsmasq
dosfstools
downgrade
drawio-desktop
duf
dxvk-mingw-git
e2fsprogs
easyeffects
edk2-shell
edu-arc-kde
edu-chadwm-git
edu-dot-files-git
edu-hblock-git
edu-rofi-git
edu-rofi-themes-git
edu-sddm-simplicity-git
edu-shells-git
edu-variety-config-git
edu-xfce-git
efibootmgr
electron-nightly-bin
encfs
epiphany
espeak-ng
etcher-bin
ethtool
evince
exfatprogs
exo
expac
f2fs-tools
fastfetch-git
fatresize
fd
feh
ffmpegthumbnailer
figma-linux-bin
file-roller
firefox
fish
flameshot
fluent-icon-theme-git
font-manager
freetype2
fsarchiver
galculator
garcon
geany
geany-plugins
ghostscript
ghostty
gimp
git
github-cli
glab
go
google-chrome
google-cloud-cli
gopls
gpart
gparted
gpick
gpm
gptfdisk
gradle
grsync
grub
grub-customizer
gsfonts
gst-libav
gst-plugin-pipewire
gst-plugins-bad
gst-plugins-base
gst-plugins-good
gst-plugins-ugly
gstreamer
gtop
gufw
gutenprint
guvcview
gvfs
gvfs-afc
gvfs-gphoto2
gvfs-mtp
gvfs-nfs
gvfs-smb
gvim
handbrake
hardcode-fixer-git
hddtemp
hdparm
htop
hunspell
hunspell-en_us
hwinfo
hw-probe
hyperv
hyphen
hyphen-en
icoutils
imagemagick
imagewriter
inkscape
insync
intltool
inxi
irssi
iso-flag-png
iw
jetbrains-toolbox
jfsutils
jq
jre17-openjdk
jre-openjdk
jsoncpp
k6
kcachegrind
keepassxc
kitty
kvantum-qt5
la-capitaine-icon-theme
laptop-detect
lastpass
layan-gtk-theme-git
less
lm_sensors
logrotate
lohit-fonts
lsb-release
lshw
lsp-plugins
lsscsi
lutris
lvm2
lxappearance
lyrebird
man-db
man-pages
mc
mdadm
meld
memtest86+
memtest86+-efi
menulibre
mesa
mesa-utils
mintlocale
mintstick
mkinitcpio
mkinitcpio-firmware
mkinitcpio-nfs-utils
mkinitcpio-openswap
mobile-broadband-provider-info
modemmanager
moreutils
most
mousepad
mtools
mtpfs
mugshot
namcap
nano
nbd
ndisc6
nemo-fileroller
neovim
networkmanager
network-manager-applet
networkmanager-openconnect
networkmanager-openvpn
networkmanager-pptp
networkmanager-vpnc
nfs-utils
nilfs-utils
nim
nomacs
noto-fonts
noto-fonts-emoji
nph-bin
npm
nss-mdns
ntfs-3g
ntp
numlockx
nvm
nvme-cli
obs-studio
oh-my-zsh-git
okular
openconnect
open-iscsi
openoffice-bin
openresolv
openssh
openvpn
os-prober
otf-libertinus
pace
pacmanlogviewer
pacquery
pandoc-bin
parole
partclone
parted
partimage
pavucontrol
pcsclite
pdfarranger
peek
php
phpactor
php-amqp
picom-git
pipewire-alsa
pipewire-jack
pipewire-pulse
pkgfile
plank
playerctl
plocate
pnpm
polkit
polkit-gnome
poppler-glib
poppler-qt5
postman-bin
powerline-fonts
ppp
pptpclient
pragha
pv
qbittorrent
qemu-base
qemu-img
qt5ct
rate-mirrors
refind
reflector
reiserfsprogs
resonance-bin
ripgrep
ripgrep-all
ristretto
rofi
rp-pppoe
rsync
rxvt-unicode
rxvt-unicode-terminfo
scour
screen
scrot
sddm-git
sdparm
sg3_utils
simple-scan
simplescreenrecorder-qt6-git
smartmontools
sniffnet
socat
sof-firmware
sparklines-git
speedtest-cli
squashfs-tools
sshpass
strace
sublime-text-4
sudo
sweet-theme-git
sxhkd
syslinux
system-config-printer
tcpdump
terminus-font
testdisk
the_platinum_searcher-bin
the_silver_searcher
thunar-archive-plugin
thunar-extended
thunar-media-tags-plugin
thunar-shares-plugin
thunar-volman
time
tinty-git
tk
tlp
tmux
tpm2-tss
traceroute
ttf-anonymous-pro
ttf-bitstream-vera
ttf-caladea
ttf-carlito
ttf-cascadia-code
ttf-cormorant
ttf-croscore
ttf-dejavu
ttf-droid
ttf-eurof
ttf-fantasque-sans-mono
ttf-fira-code
ttf-fira-mono
ttf-fira-sans
ttf-hack
ttf-ibm-plex
ttf-inconsolata
ttf-jetbrains-mono
ttf-joypixels
ttf-lato
ttf-liberation
ttf-linux-libertine
ttf-linux-libertine-g
ttf-mac-fonts
ttf-meslo-nerd-font-powerlevel10k
ttf-monofur
ttf-ms-win10-auto
ttf-nerd-fonts-symbols
ttf-nerd-fonts-symbols-mono
ttf-proggy-clean
ttf-roboto
ttf-roboto-mono
ttf-sourcecodepro-nerd
ttf-ubuntu-font-family
ttf-wps-fonts
tumbler
udftools
udiskie
udisks2
ufw
unace
unrar
unzip
upd72020x-fw
upower
urxvt-fullscreen
urxvt-perls
urxvt-resize-font-git
usb_modeswitch
usbmuxd
usbutils
uv
variety
ventoy-bin
vimix-icon-theme-git
virtualbox
visual-studio-code-bin
vivaldi
vivaldi-ffmpeg-codecs
vkd3d
vlc
vlc-plugins-all
volumeicon
vpnc
vtsls
w3m
wd719x-firmware
webkit2gtk
wget
wine-staging
winetricks
wireless-regdb
wireless_tools
wmctrl
woeusb
woff2-font-awesome
wpa_supplicant
wps-office-cn
wps-office-mime
wrk
wttr
wvdial
xapp
xcolor
xdebug
xdg-desktop-portal-gtk
xdg-user-dirs
xdo
xdotool
xf86-input-elographics
xf86-input-evdev
xf86-input-libinput
xf86-input-vmmouse
xf86-input-void
xf86-video-amdgpu
xf86-video-ati
xf86-video-fbdev
xf86-video-vesa
xfburn
xfce4-appfinder
xfce4-battery-plugin
xfce4-clipman-plugin
xfce4-cpufreq-plugin
xfce4-cpugraph-plugin
xfce4-datetime-plugin
xfce4-dict
xfce4-diskperf-plugin
xfce4-eyes-plugin
xfce4-fsguard-plugin
xfce4-genmon-plugin
xfce4-mailwatch-plugin
xfce4-mount-plugin
xfce4-mpc-plugin
xfce4-netload-plugin
xfce4-notes-plugin
xfce4-notifyd
xfce4-panel
xfce4-panel-profiles
xfce4-power-manager
xfce4-screensaver
xfce4-screenshooter
xfce4-sensors-plugin
xfce4-session
xfce4-settings
xfce4-smartbookmark-plugin
xfce4-systemload-plugin
xfce4-taskmanager
xfce4-terminal
xfce4-time-out-plugin
xfce4-timer-plugin
xfce4-verve-plugin
xfce4-wavelan-plugin
xfce4-weather-plugin
xfce4-whiskermenu-plugin
xfce4-xkb-plugin
xfconf
xfdesktop
xfsprogs
xfwm4
xfwm4-themes
xkeyboard-config
xl2tpd
xpdf
xreader
xsettingsd
yad
yamllint
yay-git
yt-dlp
zenity
zoom
zsh
zsh-completions
zsh-syntax-highlighting
zsync
```

## AUR Packages
```
aic94xx-firmware 30-10.1
alacritty-themes 6.0.2-1
android-sdk 26.1.1-2.3
android-sdk-build-tools r37.0.0-1
android-sdk-platform-tools 37.0.0-1
android-sdk-platform-tools-debug 37.0.0-1
android-studio 2025.3.3.7-1
arc-gtk-theme 20221218-2
archlinux-logout-git 25.10-01
archlinux-tweak-tool-git 25.11-01
ast-firmware 501-1.1
ausweisapp2 2.4.0-1
betterlockscreen 4.4.0-1.3
bfg 1.15.0-1
bibata-cursor-theme 2.0.7-1.1
blueberry 1.4.8-2
brave-bin 1:1.89.137-1
cachyos-ananicy-rules-git 20260403.r2052.g680d3ac-1
candy-icons-git r1346.1be42f2-1
chaotic-keyring 20251028-1
chaotic-mirrorlist 20251025-1
claude-cowork-service 1.0.50-1
claude-cowork-service-debug 1.0.50-1
claude-desktop-bin 1.4758.0-1
clutter-debug 1.26.4-4
code-insiders-bin 1.102.0_1750742647-1
cogl-debug 1.22.8-5
devtoys-bin 2.0.9.0-2
devtoys-bin-debug 2.0.9.0-2
dma 0.14-1
downgrade 12.0.1-1
dxvk-mingw-git 2.7.1.r227.gb128f9f44-1
edu-arc-kde 25.10-01
edu-chadwm-git 25.10-01
edu-dot-files-git 25.10-01
edu-hblock-git 3.5.1-2
edu-rofi-git 25.10-01
edu-rofi-themes-git 25.10-01
edu-sddm-simplicity-git 25.10-02
edu-shells-git 25.10-02
edu-variety-config-git 25.10-02
edu-xfce-git 25.10-02
electron-nightly-bin 43.0.0nightly.20260327-1
electron-nightly-bin-debug 43.0.0nightly.20260327-1
etcher-bin 2.1.4-1
fastfetch-git 2.55.1.r2.gcd8ab8e5-1
figma-linux-bin 0.11.5-0
fluent-icon-theme-git 2025.08.21.r6.g8a99a6d-1
gnome-bluetooth 3.34.5+r16+g61cfff1c-3
gnome-bluetooth-debug 3.34.5+r16+g61cfff1c-3
google-chrome 147.0.7727.101-1
google-cloud-cli 565.0.0-1
grub-customizer 5.2.5-2
gtk2 2.24.33-5
gtkmm 1:2.24.5-5
hardcode-fixer-git 2.0-1
hw-probe 1.6.6-3
i3lock-color 2.13.c.5-3.3
imagewriter 1.10.1432200249.1d253d9.2.24-1
imagewriter-debug 1.10.1432200249.1d253d9.2.24-1
insync 3.9.8.60034-2
iso-flag-png 1.0.4-1
jetbrains-toolbox 3.4.3.81140-1
k6 1.7.1-1
k6-debug 1.7.1-1
la-capitaine-icon-theme 0.6.2-1.2
lastpass 4.147.2-1
layan-gtk-theme-git 2023052342g6390f8e-1
lib32-gst-plugins-base-libs 1.28.1-3
lib32-gstreamer 1.28.1-3
lohit-fonts 2.95.5.1-2
lyrebird 1.2.0-1
menulibre 1:2.4.0-1.2
mintlocale 1.6.6-1
mintstick 1.6.6-1
mkinitcpio-firmware 1.6.0-1
mkinitcpio-openswap 0.1.1-1
nitrogen 1.6.1-6
nomacs 1:3.22.0-1
nomacs-debug 1:3.22.0-1
nph-bin 0.6.1-1
nph-bin-debug 0.6.1-1
oh-my-zsh-git r7640.8a4d6fc0a-1
openoffice-bin 4.1.16-1
pace 1.4.2-1.4
pandoc-bin 3.9.0.2-1
pandoc-bin-debug 3.9.0.2-1
php-amqp 2.1.2-2
php-amqp-debug 2.1.2-2
phpactor 2025.12.21.1-1
picom-git 2805_12.147.gbe577470_2025.11.01-1
postman-bin 12.6.8-1
qt5-remoteobjects 5.15.18-1
rate-mirrors-debug 0.25.0-1
reiserfsprogs 3.6.27-7
reiserfsprogs-debug 3.6.27-7
resonance-bin 2.8.2-1
sddm-git 0.21.0.51.gdfa5315-1
simplescreenrecorder-qt6-git 0.4.4.r73.g232eac7-1.1
sparklines-git v1.0.1.33.gab88ac6-1
sublime-text-4 4.4200-1
sweet-theme-git 6.0.r11.g9d09ed5-1
the_platinum_searcher-bin 2.2.0-2
thunar-extended 4.18.11-1
tinty-git r244.639472c-1
ttf-joypixels 10.0.0-2
ttf-mac-fonts 20100901.134-1.1
ttf-meslo-nerd-font-powerlevel10k 2.3.3-1.1
ttf-ms-win10-auto 10.0.19042.789-6
ttf-proggy-clean 1.1.7-1
ttf-wps-fonts 2.0-1.1
upd72020x-fw 1:1.1.0-2
urxvt-fullscreen 1-1
urxvt-resize-font-git 27.b593580-1
v4l-utils-git 1.32.0.r39.gbd0aabb9-1
v4l-utils-git-debug 1.32.0.r39.gbd0aabb9-1
ventoy-bin 1.1.11-4
ventoy-bin-debug 1.1.11-4
vimix-icon-theme-git 2025.08.26.r6.g8c877b9-1
visual-studio-code-bin 1.116.0-1
vtsls 0.3.0-1
wails 2.12.0-2
wails-debug 2.12.0-2
wd719x-firmware 1-9
webkit2gtk 2.50.6-1
woeusb 5.2.4-1.1
wps-office-cn 12.1.2.25882-1
wps-office-cn-debug 12.1.2.25882-1
wps-office-mime 11.1.0.11723-2
wrk 4.2.0-3
wttr 1.55.r0.g36893b1-1
xfce4-datetime-plugin 0.8.3-2
xfwm4-themes 4.10.0-6
yay-git 12.5.7.r0.g44dfda05-1
yay-git-debug 12.5.7.r0.g44dfda05-1
zoom 7.0.0-1
```

## Orphan Packages (Top 20)
```
android-sdk-platform-tools-debug 37.0.0-1
appstream-glib 0.8.3-4
archlinux-appstream-data 20260326-1
claude-cowork-service-debug 1.0.50-1
clutter-debug 1.26.4-4
cmake 4.3.1-1
cogl-debug 1.22.8-5
devtoys-bin-debug 2.0.9.0-2
doxygen 1.16.1-3
electron-nightly-bin-debug 43.0.0nightly.20260327-1
git-lfs 3.7.1-1
gnome-bluetooth-debug 3.34.5+r16+g61cfff1c-3
gnome-online-accounts 3.58.1-1
gobject-introspection 1.86.0-2
gtk-doc 1.36.1-1
imagewriter-debug 1.10.1432200249.1d253d9.2.24-1
k6-debug 1.7.1-1
kauth 6.25.0-1
kpty 6.25.0-1
lua-lpeg 1.1.0-5
```

# System Configuration

## Pacman Configuration
File: `/etc/pacman.conf`
```
#
# /etc/pacman.conf
#
# See the pacman.conf(5) manpage for option and repository directives

#
# GENERAL OPTIONS
#
[options]
IgnorePkg = flameshot
# The following paths are commented out with their default values listed.
# If you wish to use different paths, uncomment and update the paths.
#RootDir     = /
#DBPath      = /var/lib/pacman/
#CacheDir    = /var/cache/pacman/pkg/
#LogFile     = /var/log/pacman.log
#GPGDir      = /etc/pacman.d/gnupg/
#HookDir     = /etc/pacman.d/hooks/
HoldPkg     = pacman glibc
#XferCommand = /usr/bin/curl -L -C - -f -o %o %u
#XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u
#CleanMethod = KeepInstalled
Architecture = auto

# Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
#IgnorePkg   =
#IgnoreGroup =

#NoUpgrade   =
#NoExtract   =

# Misc options
#UseSyslog
#Color
#NoProgressBar
CheckSpace
#VerbosePkgLists
ParallelDownloads = 5
DownloadUser = alpm
#DisableSandboxFilesystem
#DisableSandboxSyscalls

# By default, pacman accepts packages signed by keys that its local keyring
# trusts (see pacman-key and its man page), as well as unsigned packages.
SigLevel    = Required DatabaseOptional
LocalFileSigLevel = Optional
#RemoteFileSigLevel = Required

# NOTE: You must run `pacman-key --init` before first using pacman; the local
# keyring can then be populated with the keys of all official Arch Linux
# packagers with `pacman-key --populate archlinux`.

#
# REPOSITORIES
#   - can be defined here or included from another file
#   - pacman will search repositories in the order defined here
#   - local/custom mirrors can be added here or in separate files
#   - repositories listed first will take precedence when packages
#     have identical names, regardless of version number
#   - URLs will have $repo replaced by the name of the current repo
#   - URLs will have $arch replaced by the name of the architecture
#
# Repository entries are of the format:
#       [repo-name]
#       Server = ServerName
#       Include = IncludePath
#
# The header [repo-name] is crucial - it must be present and
# uncommented to enable the repo.
#

# The testing repositories are disabled by default. To enable, uncomment the
# repo name header and Include lines. You can add preferred servers immediately
# after the header, and they will be used before the default mirrors.

#[core-testing]
#Include = /etc/pacman.d/mirrorlist

[core]
Include = /etc/pacman.d/mirrorlist

#[extra-testing]
#Include = /etc/pacman.d/mirrorlist

[extra]
Include = /etc/pacman.d/mirrorlist

# If you want to run 32 bit applications on your x86_64 system,
# enable the multilib repositories as required here.

#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist

# An example of a custom package repository.  See the pacman manpage for
# tips on creating your own repositories.
#[custom]
#SigLevel = Optional TrustAll
... (101 lines total, showing first 100)
```

## Pacman Mirrors (Top 20)
```
Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch
Server = https://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://geo.mirror.pkgbuild.com/$repo/os/$arch
Server = http://mirror.osbeck.com/archlinux/$repo/os/$arch
Server = http://mirror.rackspace.com/archlinux/$repo/os/$arch
Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch
```

## Filesystem Mounts
File: `/etc/fstab`
```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a device; this may
# be used with UUID= as a more robust way to name devices that works even if
# disks are added and removed. See fstab(5).
#
# <file system>             <mount point>  <type>  <options>  <dump>  <pass>
UUID=A80A-33AD                            /boot/efi      vfat    defaults,noatime 0 2
UUID=5c148df8-cbd4-4e4f-aba0-4bb6d63778c8 /              ext4    defaults,noatime 0 1
tmpfs                                     /tmp           tmpfs   defaults,noatime,mode=1777 0 0
/swapfile none swap defaults 0 0
```

## Active Mounts with Options
```
SOURCE         FSTYPE SIZE   USED AVAIL USE% TARGET
/dev/nvme0n1p5 ext4   727G 664,1G 25,9G  91% /
/dev/nvme0n1p1 vfat    96M  64,4M 31,6M  67% /boot/efi
```

# Audio Configuration

## PulseAudio/PipeWire Info
```
Server Name: PulseAudio (on PipeWire 1.6.3)
Server Version: 15.0.0
Default Sample Specification: float32le 2ch 48000Hz
Default Sink: alsa_output.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo
Default Source: alsa_input.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo
```

## Audio Sinks
```
91	alsa_output.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo	PipeWire	s24le 2ch 48000Hz	SUSPENDED
93	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI3__sink	PipeWire	s32le 2ch 48000Hz	SUSPENDED
94	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI2__sink	PipeWire	s32le 2ch 48000Hz	SUSPENDED
95	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI1__sink	PipeWire	s32le 2ch 48000Hz	SUSPENDED
96	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__Speaker__sink	PipeWire	s32le 2ch 48000Hz	SUSPENDED
193	easyeffects_sink	PipeWire	float32le 2ch 48000Hz	SUSPENDED
```

## Audio Sources
```
90	alsa_input.usb-046d_Logitech_StreamCam_F8EB8E25-02.analog-stereo	PipeWire	s16le 2ch 48000Hz	SUSPENDED
91	alsa_output.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo.monitor	PipeWire	s24le 2ch 48000Hz	SUSPENDED
92	alsa_input.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo	PipeWire	s24le 2ch 48000Hz	SUSPENDED
93	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI3__sink.monitor	PipeWire	s32le 2ch 48000Hz	SUSPENDED
94	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI2__sink.monitor	PipeWire	s32le 2ch 48000Hz	SUSPENDED
95	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__HDMI1__sink.monitor	PipeWire	s32le 2ch 48000Hz	SUSPENDED
96	alsa_output.pci-0000_00_1f.3-platform-sof_sdw.HiFi__Speaker__sink.monitor	PipeWire	s32le 2ch 48000Hz	SUSPENDED
97	alsa_input.pci-0000_00_1f.3-platform-sof_sdw.HiFi__Mic__source	PipeWire	s32le 2ch 48000Hz	SUSPENDED
193	easyeffects_sink.monitor	PipeWire	float32le 2ch 48000Hz	SUSPENDED
194	easyeffects_source	PipeWire	float32le 2ch 48000Hz	SUSPENDED
```

## WirePlumber Status
```
PipeWire 'pipewire-0' [1.6.3, patrickjaja@jajapc, cookie:3282076850]
 └─ Clients:
        32. WirePlumber                         [1.6.3, patrickjaja@jajapc, pid:2652]
        33. pipewire                            [1.6.3, patrickjaja@jajapc, pid:2654]
        46. WirePlumber [export]                [1.6.3, patrickjaja@jajapc, pid:2652]
       185. xdg-desktop-portal                  [1.6.3, patrickjaja@jajapc, pid:2828]
       186. PipeWire ALSA [volumeicon]          [1.6.3, patrickjaja@jajapc, pid:3291]
       187. easyeffects                         [1.6.3, patrickjaja@jajapc, pid:3304]
       235. wpctl                               [1.6.3, patrickjaja@jajapc, pid:63552]
       236. Google Chrome input                 [1.6.3, patrickjaja@jajapc, pid:8790]
       240. Chromium input                      [1.6.3, patrickjaja@jajapc, pid:4931]

Audio
 ├─ Devices:
 │      47. StreamCam                           [alsa]
 │      48. ATR2100x-USB Microphone             [alsa]
 │      49. Alder Lake PCH-P High Definition Audio Controller [alsa]
 │  
 ├─ Sinks:
 │      34. Alder Lake PCH-P High Definition Audio Controller HDMI / DisplayPort 3 Output [vol: 1.00]
 │      43. Alder Lake PCH-P High Definition Audio Controller Speaker [vol: 1.00 MUTED]
 │      44. Alder Lake PCH-P High Definition Audio Controller HDMI / DisplayPort 1 Output [vol: 1.00]
 │      45. Alder Lake PCH-P High Definition Audio Controller HDMI / DisplayPort 2 Output [vol: 1.00]
 │  *   91. ATR2100x-USB Microphone Analog Stereo [vol: 0.40 MUTED]
 │     188. Easy Effects Sink                   [vol: 1.00]
 │  
 ├─ Sources:
 │      42. Alder Lake PCH-P High Definition Audio Controller SoundWire microphones [vol: 1.00]
 │      90. StreamCam Analog Stereo             [vol: 0.44]
 │  *   92. ATR2100x-USB Microphone Analog Stereo [vol: 1.00]
 │     189. Easy Effects Source                 [vol: 0.96]
 │  
 ├─ Filters:
 │  
 └─ Streams:

Video
 ├─ Devices:
 │      56. ipu6                                [v4l2]
 │      57. ipu6                                [v4l2]
 │      58. ipu6                                [v4l2]
 │      59. ipu6                                [v4l2]
 │      60. ipu6                                [v4l2]
 │      61. ipu6                                [v4l2]
 │      62. ipu6                                [v4l2]
 │      63. ipu6                                [v4l2]
 │      64. ipu6                                [v4l2]
 │      65. ipu6                                [v4l2]
 │      66. ipu6                                [v4l2]
 │      67. ipu6                                [v4l2]
 │      68. ipu6                                [v4l2]
 │      69. ipu6                                [v4l2]
 │      70. ipu6                                [v4l2]
 │      71. ipu6                                [v4l2]
 │      72. ipu6                                [v4l2]
 │      73. ipu6                                [v4l2]
 │      74. ipu6                                [v4l2]
 │      75. ipu6                                [v4l2]
 │      76. ipu6                                [v4l2]
 │      77. ipu6                                [v4l2]
 │      78. ipu6                                [v4l2]
 │      79. ipu6                                [v4l2]
 │      80. ipu6                                [v4l2]
 │      81. ipu6                                [v4l2]
 │      82. ipu6                                [v4l2]
 │      83. ipu6                                [v4l2]
 │      84. ipu6                                [v4l2]
 │      85. ipu6                                [v4l2]
 │      86. ipu6                                [v4l2]
 │      87. ipu6                                [v4l2]
 │      88. Logitech StreamCam                  [v4l2]
 │      89. Logitech StreamCam                  [v4l2]
 │  
 ├─ Sinks:
 │  
 ├─ Sources:
 │  *  119. Logitech StreamCam (V4L2)          
 │     121. ipu6 (V4L2)                        
 │     123. ipu6 (V4L2)                        
 │     125. ipu6 (V4L2)                        
 │     127. ipu6 (V4L2)                        
 │     129. ipu6 (V4L2)                        
 │     131. ipu6 (V4L2)                        
 │     133. ipu6 (V4L2)                        
 │     135. ipu6 (V4L2)                        
 │     137. ipu6 (V4L2)                        
 │     139. ipu6 (V4L2)                        
 │     141. ipu6 (V4L2)                        
 │     143. ipu6 (V4L2)                        
 │     145. ipu6 (V4L2)                        
 │     147. ipu6 (V4L2)                        
 │     149. ipu6 (V4L2)                        
 │     151. ipu6 (V4L2)                        
 │     153. ipu6 (V4L2)                        
 │     155. ipu6 (V4L2)                        
 │     157. ipu6 (V4L2)                        
 │     159. ipu6 (V4L2)                        
 │     161. ipu6 (V4L2)                        
 │     163. ipu6 (V4L2)                        
 │     165. ipu6 (V4L2)                        
 │     167. ipu6 (V4L2)                        
 │     169. ipu6 (V4L2)                        
 │     171. ipu6 (V4L2)                        
 │     173. ipu6 (V4L2)                        
 │     175. ipu6 (V4L2)                        
 │     177. ipu6 (V4L2)                        
 │     179. ipu6 (V4L2)                        
 │     181. ipu6 (V4L2)                        
 │     183. ipu6 (V4L2)                        
 │  
 ├─ Filters:
 │  
 └─ Streams:

Settings
 └─ Default Configured Devices:
         0. Audio/Sink    alsa_output.pci-0000_00_1f.3-platform-sof_sdw.pro-output-2
         1. Audio/Source  alsa_input.usb-Audio_Technica_Corp_ATR2100x-USB_Microphone-00.analog-stereo
```

## Sound Cards
```
 0 [sofsoundwire   ]: sof-soundwire - sof-soundwire
                      DellInc.-XPS9320-0CW9KM
 1 [StreamCam      ]: USB-Audio - Logitech StreamCam
                      Logitech StreamCam at usb-0000:00:0d.0-1.2, super speed
 2 [Microphone     ]: USB-Audio - ATR2100x-USB Microphone
                      Audio Technica Corp ATR2100x-USB Microphone at usb-0000:00:14.0-1.1, high speed
```

# Display Server & Desktop Configuration

**Display Server**: X11 (:0.0)
## Display Configuration
```
eDP-1 connected 1920x1200+7040+0 (normal left inverted right x axis y axis) 288mm x 180mm
   1920x1200     59.95*+
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
DP-4 disconnected (normal left inverted right x axis y axis)
DP-3-1 connected 1920x1080+5120+120 (normal left inverted right x axis y axis) 598mm x 336mm
   1920x1080     60.00*+ 143.98   119.98    99.93    84.90    59.94  
DP-3-2 connected 5120x1440+0+120 (normal left inverted right x axis y axis) 1190mm x 340mm
   5120x1440    100.00    59.98* 
```

## Display Power Management
```
DPMS (Display Power Management Signaling):
  Standby: 600    Suspend: 600    Off: 600
  DPMS is Disabled
```

## XFCE Version
```
xfce4-session 4.20.4 (Xfce 4.20)
```

## XFCE Panel Configuration
### Panel Properties
```
/panels                            [0]
/panels/dark-mode                  true
/panels/panel-0/autohide-behavior  0
/panels/panel-0/background-alpha   80
/panels/panel-0/background-rgba    [0,184000,0,204000,0,247000,1,000000]
/panels/panel-0/background-style   1
/panels/panel-0/dark-mode          true
/panels/panel-0/enable-struts      true
/panels/panel-0/enter-opacity      100
/panels/panel-0/icon-size          0
/panels/panel-0/leave-opacity      100
/panels/panel-0/length             100,000000
/panels/panel-0/length-adjust      true
/panels/panel-0/mode               0
/panels/panel-0/nrows              1
/panels/panel-0/plugin-ids         [1,3,4,6,7,8,9,10,11,12,14,13]
/panels/panel-0/position           p=6;x=0;y=0
/panels/panel-0/position-locked    true
/panels/panel-0/size               21
/panels/panel-0/span-monitors      false
```

### Panel Plugins
```
/plugins/plugin-1                      whiskermenu
/plugins/plugin-1/button-icon          archlinux
/plugins/plugin-1/button-title         Applications
/plugins/plugin-1/command-lockscreen   betterlockscreen -l
/plugins/plugin-1/command-logout       archlinux-logout
/plugins/plugin-1/command-switchuser   dm-tool switch-to-greeter
/plugins/plugin-1/custom-menu          false
/plugins/plugin-1/favorites            [xfce4-web-browser.desktop,xfce4-mail-reader.desktop,xfce4-file-manager.desktop,xfce4-terminal-emulator.desktop]
/plugins/plugin-1/favorites-in-recent  true
/plugins/plugin-1/menu-opacity         100
/plugins/plugin-1/recent               [xfce-keyboard-settings.desktop,be.maartenbaert.simplescreenrecorder.desktop,com.anthropic.claude-desktop.desktop,wps-office-wps.desktop,org.gnome.Screenshot.desktop,com.uploadedlobster.peek.desktop,org.gnome.SystemMonitor.desktop,gimp.desktop,xfce-display-settings.desktop,galculator.desktop]
/plugins/plugin-1/show-button-title    false
/plugins/plugin-1/show-generic-names   false
/plugins/plugin-1/show-menu-icons      true
/plugins/plugin-1/show-tooltips        false
/plugins/plugin-1/view-mode            1
/plugins/plugin-3                      separator
/plugins/plugin-3/expand               true
/plugins/plugin-3/style                0
/plugins/plugin-4                      systray
/plugins/plugin-4/hidden-items         [toolbox]
/plugins/plugin-4/hidden-legacy-items  [pamac-tray]
/plugins/plugin-4/icon-size            16
/plugins/plugin-4/known-items          [Claude_status_icon_1,easyeffects,jetbrains-toolbox,droidcam,obs,steam,Microsoft Teams - Preview1,vlc,SimpleScreenRecorder,zoom,Insync,tao application,chrome_status_icon_3,toolbox,chrome_status_icon_2,chrome_status_icon_1,flameshot,variety]
/plugins/plugin-4/known-legacy-items   [com.anthropic.claude-desktop,wi-fi network connection “jajaspeed” active: jajaspeed (46%),wi-fi network connection “jajaspeed” active: jajaspeed (89%),wi-fi network connection “jajaspeed” active: jajaspeed (70%),volumeicon,wi-fi network connection “jajaspeed” active: jajaspeed (67%),wi-fi network connection “jajaspeed” active: jajaspeed (61%),xfce4-power-manager,wi-fi network connection “jajaspeed” active: jajaspeed (65%),electron,wi-fi network connection “jajaspeed” active: jajaspeed (66%),wi-fi network connection “jajaspeed” active: jajaspeed (69%),wi-fi network connection “jajaspeed” active: jajaspeed (68%),wi-fi network connection “jajaspeed” active: jajaspeed (62%),wi-fi network connection “jajaspeed 5 ghz” active: jajaspeed (59%),wi-fi network connection “jajaspeed” active: jajaspeed (57%),wi-fi network connection “jajaspeed” active: jajaspeed (59%),wi-fi network connection “davidwesseler” active: davidwesseler (70%),wi-fi network connection “jajaspeed 2” active: jajaspeed (68%),wi-fi network connection “jajaspeed 2” active: jajaspeed (63%),wi-fi network connection “jajaspeed 2” active: jajaspeed (65%),wi-fi network connection “jajaspeed 3” active: jajaspeed (61%),notes,wi-fi network connection “jajaspeed” active: jajaspeed (54%),ethernet network connection “wired connection 1” active,wi-fi network connection “jajaspeed” active: jajaspeed (58%),obs,flameshot,system-config-printer,pragha music player,wi-fi network connection “jajaspeed” active: jajaspeed (73%),wi-fi network connection “jajaspeed” active: jajaspeed (74%),networkmanager applet,variety,clipman,wi-fi network connection “jajaspeed” active: jajaspeed (76%),blueberry-tray.py,pamac-tray]
/plugins/plugin-4/show-frame           false
/plugins/plugin-4/size-max             16
/plugins/plugin-4/symbolic-icons       true
/plugins/plugin-6                      power-manager-plugin
/plugins/plugin-7                      separator
/plugins/plugin-7/style                0
/plugins/plugin-8                      clock
/plugins/plugin-8/digital-format       %a %I:%M %p
/plugins/plugin-8/digital-layout       3
/plugins/plugin-8/digital-time-format  %H:%M
/plugins/plugin-8/mode                 2
/plugins/plugin-8/show-frame           true
/plugins/plugin-8/size-max             22
/plugins/plugin-8/style                0
/plugins/plugin-8/tooltip-format       %A %d %B %Y
/plugins/plugin-9                      separator
/plugins/plugin-9/expand               false
/plugins/plugin-9/style                0
/plugins/plugin-10                     actions
/plugins/plugin-10/appearance          1
/plugins/plugin-10/ask-confirmation    true
/plugins/plugin-10/button-title        1
/plugins/plugin-10/invert-orientation  false
/plugins/plugin-10/items               [+lock-screen,+separator,+suspend,+hibernate,+separator,-hybrid-sleep,+restart,+shutdown,+separator,+switch-user,-logout-dialog,+logout]
/plugins/plugin-11                     separator
```

### Active Panel Plugin Types
```
```

### Panel Layout
```
/panels/dark-mode                      true
/panels/panel-0/dark-mode              true
/panels/panel-0/icon-size              0
/panels/panel-0/length                 100,000000
/panels/panel-0/length-adjust          true
/panels/panel-0/mode                   0
/panels/panel-0/position               p=6;x=0;y=0
/panels/panel-0/position-locked        true
/panels/panel-0/size                   21
/plugins/plugin-1/view-mode            1
/plugins/plugin-4/icon-size            16
/plugins/plugin-4/size-max             16
/plugins/plugin-8/mode                 2
/plugins/plugin-8/size-max             22
```

# Themes, Fonts & Appearance Configuration

## GTK Themes
### GTK3 Settings
```ini
gtk-theme-name=Arc-Dark
gtk-icon-theme-name=Sardi-Arc
gtk-font-name=Noto Sans 11
gtk-cursor-theme-name=Bibata-Modern-Ice
gtk-cursor-theme-size=0
```

### GTK4 Settings
```ini
gtk-theme-name=Arc-Dark
gtk-icon-theme-name=Sardi-Arc
gtk-font-name=Noto Sans 11
gtk-cursor-theme-name=Bibata-Modern-Ice
```

### GTK2 Settings
```
gtk-theme-name="Arc-Dark"
```

### XFCE Theme Settings
```
GTK Theme: Arc-Dark
Icon Theme: breeze-dark
Cursor Theme: Sweet-cursors
Font: Noto Sans 11
Window Manager Theme: Arc-Dark
```

## Qt5 Theme Configuration
```ini
color_scheme_path=/usr/share/qt5ct/colors/airy.conf
icon_theme=Sardi-Arc
style=kvantum-dark
toolbutton_style=4
```

## Kvantum Theme
```ini
theme=ArcDark
```

## Font Configuration
### Configured System Fonts
```
Default Sans: DroidSans.ttf: "Droid Sans" "Regular"
Default Serif: DroidSerif-Regular.ttf: "Droid Serif" "Regular"
Default Mono: DroidSansMono.ttf: "Droid Sans Mono" "Regular"
```

## Fontconfig User Settings
File: `/home/patrickjaja/.config/fontconfig/fonts.conf`
```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <match target="font">
        <edit mode="assign" name="hinting" >
            <bool>true</bool>
        </edit>
        <edit mode="assign" name="autohint" >
            <bool>true</bool>
        </edit>
        <edit mode="assign" name="hintstyle" >
            <const>hintslight</const>
        </edit>
        <edit mode="assign" name="rgba" >
            <const>rgb</const>
        </edit>
        <edit mode="assign" name="antialias" >
            <bool>true</bool>
        </edit>
        <edit mode="assign" name="lcdfilter">
            <const>lcddefault</const>
        </edit>
    </match>

<!-- Set preferred serif, sans serif, and monospace fonts. -->
    <alias>
        <family>serif</family>
        <prefer>
            <family>Droid Serif</family>
        </prefer>
    </alias>
    <alias>
        <family>sans-serif</family>
        <prefer>
            <family>Droid Sans</family>
        </prefer>
    </alias>
    <alias>
        <family>sans</family>
        <prefer>
            <family>Droid Sans</family>
        </prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer>
            <family>Droid Sans Mono</family>
        </prefer>
    </alias>
    <alias>
... (57 lines total, showing first 50)
```

### Alacritty Font
```
#font:
  # Normal (roman) font face
  #normal:
    # Font family
```

### Kitty Font
```
font_family      NotoMono
font_size 13.0
```

### Font Rendering
Hinting: Slight

## Installed Theme Packages
```
adobe-source-sans-fonts 3.052-2
adwaita-cursors 50.0-1
adwaita-fonts 50.0-1
adwaita-icon-theme 50.0-1
adwaita-icon-theme-legacy 46.2-3
alacritty-themes 6.0.2-1
arc-gtk-theme 20221218-2
awesome-terminal-fonts 1.1.0-5
bibata-cursor-theme 2.0.7-1.1
breeze-icons 6.25.0-1
candy-icons-git r1346.1be42f2-1
cantarell-fonts 1:0.311-1
default-cursors 3-1
edu-rofi-themes-git 25.10-01
elementary-icon-theme 8.2.0-1
fluent-icon-theme-git 2025.08.21.r6.g8a99a6d-1
fontconfig 2:2.17.1-1
font-manager 0.9.4-3
gnome-themes-extra 1:3.28-1
gsfonts 20200910-6
gtk-update-icon-cache 1:4.22.2-1
hicolor-icon-theme 0.18-1
kiconthemes 6.25.0-1
la-capitaine-icon-theme 0.6.2-1.2
layan-gtk-theme-git 2023052342g6390f8e-1
lohit-fonts 2.95.5.1-2
noto-fonts 1:2026.04.01-1
noto-fonts-emoji 1:2.051-1
papirus-icon-theme 20250501-1
powerline-fonts 2.8.4-4
sound-theme-freedesktop 0.8-6
sweet-theme-git 6.0.r11.g9d09ed5-1
terminus-font 4.49.1-8
ttf-mac-fonts 20100901.134-1.1
ttf-meslo-nerd-font-powerlevel10k 2.3.3-1.1
ttf-nerd-fonts-symbols 3.4.0-1
ttf-nerd-fonts-symbols-common 3.4.0-1
ttf-nerd-fonts-symbols-mono 3.4.0-1
ttf-ubuntu-font-family 1:0.83-2
ttf-wps-fonts 2.0-1.1
urxvt-resize-font-git 27.b593580-1
vimix-icon-theme-git 2025.08.26.r6.g8c877b9-1
volumeicon 0.5.1-8
woff2-font-awesome 7.2.0-1
xapp-symbolic-icons 1.0.9-1
xcb-util-cursor 0.1.6-1
xfwm4-themes 4.10.0-6
xorg-fonts-encodings 1.1.0-2
xorg-mkfontscale 1.2.4-1
xorg-xcursorgen 1.0.9-1
```

## Available Icon Themes
```
Adwaita
AdwaitaLegacy
Bibata-Modern-Amber
Bibata-Modern-Amber-Right
Bibata-Modern-Classic
Bibata-Modern-Classic-Right
Bibata-Modern-Ice
Bibata-Modern-Ice-Right
Bibata-Original-Amber
Bibata-Original-Amber-Right
Bibata-Original-Classic
Bibata-Original-Classic-Right
Bibata-Original-Ice
Bibata-Original-Ice-Right
breeze
breeze-dark
candy-icons
elementary
Fluent
Fluent-dark

User Icon Themes:
hicolor
```

## Available Cursor Themes
```
Bibata-Modern-Amber
Bibata-Modern-Amber-Right
Bibata-Modern-Classic
Bibata-Modern-Classic-Right
Bibata-Modern-Ice
Bibata-Modern-Ice-Right
Bibata-Original-Amber
Bibata-Original-Amber-Right
Bibata-Original-Classic
Bibata-Original-Classic-Right
Bibata-Original-Ice
Bibata-Original-Ice-Right
elementary
```

# Network Configuration

## Network Interfaces
```
lo               UNKNOWN        <IP_REDACTED>/8 ::1/128 
wlp0s20f3        UP             <IP_REDACTED>/24 
wlp0s13f0u1u4    UP             <IP_REDACTED>/24 2a02:908:960:c4e0:7eac:3f17:ea37:193f/64 fd1e:5c62:5c6b:0:f87b:1f92:9411:5fe8/64 fe80::ef74:98b1:9245:a799/64 
br-081441c9ccf3  DOWN           <IP_REDACTED>/16 
br-7dbde1c8410f  DOWN           <IP_REDACTED>/16 
br-ccd6afa4e3df  DOWN           <IP_REDACTED>/16 
docker0          DOWN           <IP_REDACTED>/16 
enp0s20f0u3u4    DOWN           
tun0             UNKNOWN        <IP_REDACTED>/24 fe80::22f4:23f1:eeb5:d698/64 
```

## Default Routes
```
default via <IP_REDACTED> dev wlp0s20f3 proto dhcp src <IP_REDACTED> metric 600 
default via <IP_REDACTED> dev wlp0s13f0u1u4 proto dhcp src <IP_REDACTED> metric 601 
```

## Network Services Status
```
active
inactive
active
```

## DNS Configuration
```
Global
           Protocols: +LLMNR +mDNS -DNSOverTLS DNSSEC=no/unsupported
    resolv.conf mode: stub
Fallback DNS Servers: <IP_REDACTED>#dns.quad9.net 2620:fe::9#dns.quad9.net
                      <IP_REDACTED>#cloudflare-dns.com
                      2606:4700:4700::1111#cloudflare-dns.com <IP_REDACTED>#dns.google
                      2001:4860:4860::8888#dns.google

Link 4 (wlp0s13f0u1u4)
    Current Scopes: DNS LLMNR/IPv4 LLMNR/IPv6 mDNS/IPv4 mDNS/IPv6
         Protocols: +DefaultRoute +LLMNR +mDNS -DNSOverTLS DNSSEC=no/unsupported
Current DNS Server: <IP_REDACTED>
       DNS Servers: fd1e:5c62:5c6b:0:e72:74ff:feca:527d
                    2a02:908:960:c4e0:e72:74ff:feca:527d <IP_REDACTED>
        DNS Domain: fritz.box
     Default Route: yes

Link 10 (tun0)
    Current Scopes: DNS LLMNR/IPv4 LLMNR/IPv6 mDNS/IPv4 mDNS/IPv6
         Protocols: +DefaultRoute +LLMNR +mDNS -DNSOverTLS DNSSEC=no/unsupported
```

## UFW Firewall Status
```
ufw status requires sudo
```

# Container & Virtualization

## Docker Version
```
Docker version 29.4.0, build 9d7ad9ff18
```

## Docker Containers
```
NAMES                                       IMAGE                                           STATUS
workoflow-promopage-v2-frankenphp-1         workoflow-promopage-v2-frankenphp               Exited (0) 5 days ago
workoflow-promopage-v2-scheduled-worker-1   workoflow-promopage-v2-scheduled-worker         Exited (0) 5 days ago
workoflow-promopage-v2-messenger-worker-1   workoflow-promopage-v2-messenger-worker         Exited (0) 5 days ago
workoflow-crawl4ai                          unclecode/crawl4ai:latest                       Exited (0) 7 days ago
litellm                                     ghcr.io/berriai/litellm:v1.81.9-stable          Exited (0) 7 days ago
phoenix                                     arizephoenix/phoenix:latest                     Exited (0) 7 days ago
phoenix-postgres                            postgres:17.5-alpine                            Exited (0) 7 days ago
workoflow-rustfs                            d75319bf3085                                    Exited (0) 7 days ago
workoflow-docling                           ghcr.io/docling-project/docling-serve:v1.14.0   Exited (0) 7 days ago
qdrant                                      qdrant/qdrant:latest                            Exited (143) 7 days ago
litellm-postgres                            postgres:17.5-alpine                            Exited (0) 7 days ago
litellm-redis                               redis:8.0.1                                     Exited (0) 7 days ago
workoflow-promopage-v2-mariadb-1            mariadb:12                                      Exited (0) 5 days ago
workoflow-promopage-v2-redis-1              redis:8-alpine                                  Exited (0) 5 days ago
workoflow-promopage-v2-minio-1              minio/minio:latest                              Exited (0) 5 days ago
workoflow-ai-setup-redis-1                  redis:8.0.1                                     Exited (0) 7 days ago
```

## Docker Images
```
REPOSITORY                                TAG              SIZE
workoflow-promopage-v2-frankenphp         latest           1.56GB
workoflow-promopage-v2-scheduled-worker   latest           1.55GB
workoflow-promopage-v2-messenger-worker   latest           1.55GB
unclecode/crawl4ai                        latest           3.87GB
nimlang/nim                               latest           785MB
ghcr.io/docling-project/docling-serve     v1.14.0          10.7GB
redis                                     8-alpine         97.2MB
mariadb                                   12               336MB
ghcr.io/berriai/litellm                   v1.81.9-stable   1.87GB
rustfs/rustfs                             latest           225MB
arizephoenix/phoenix                      latest           984MB
qdrant/qdrant                             latest           178MB
minio/minio                               latest           175MB
postgres                                  17.5-alpine      279MB
redis                                     8.0.1            128MB
fedora                                    40               226MB
```

## Systemd Containers
```
No machines.
```

## VirtualBox VMs
```
"Ubuntu" {1cd74ca3-b714-4c92-adae-2daa3fcfcd50}
"Fedora43-KDE" {8bc44bd4-caec-4789-89e3-dfb2f33f90e7}
```

# Systemd Services

## Enabled Services (Top 30)
```
UNIT FILE                          STATE   PRESET
ananicy-cpp.service                enabled disabled
avahi-daemon.service               enabled disabled
bluetooth.service                  enabled disabled
cups.service                       enabled disabled
docker.service                     enabled disabled
NetworkManager-dispatcher.service  enabled disabled
NetworkManager-wait-online.service enabled disabled
NetworkManager.service             enabled disabled
ntpd.service                       enabled disabled
sddm.service                       enabled disabled
systemd-resolved.service           enabled enabled
systemd-timesyncd.service          enabled enabled

13 unit files listed.
```

## Enabled User Services
```
UNIT FILE                         STATE   PRESET
app-com.mitchellh.ghostty.service enabled enabled
claude-cowork.service             enabled enabled
pipewire-pulse.service            enabled enabled
pipewire.service                  enabled enabled
wireplumber.service               enabled enabled
xdg-user-dirs.service             enabled enabled

6 unit files listed.
```

## Systemd Timers
```
NEXT                           LEFT LAST                               PASSED UNIT                             ACTIVATES
Mon 2026-04-27 20:47:43 CEST     7h Fri 2026-04-24 14:48:56 CEST            - man-db.timer                     man-db.service
Tue 2026-04-28 00:00:00 CEST    10h Mon 2026-04-27 09:31:34 CEST            - shadow.timer                     shadow.service
Tue 2026-04-28 00:15:45 CEST    11h Mon 2026-04-27 09:42:12 CEST 3h 24min ago logrotate.timer                  logrotate.service
Tue 2026-04-28 00:56:40 CEST    11h Mon 2026-04-27 09:48:40 CEST 3h 18min ago plocate-updatedb.timer           plocate-updatedb.service
Tue 2026-04-28 09:47:41 CEST    20h Mon 2026-04-27 09:47:41 CEST 3h 19min ago systemd-tmpfiles-clean.timer     systemd-tmpfiles-clean.service
Thu 2026-04-30 02:15:08 CEST 2 days Wed 2026-04-22 11:41:36 CEST            - archlinux-keyring-wkd-sync.timer archlinux-keyring-wkd-sync.service
Mon 2026-05-04 00:19:25 CEST 6 days Mon 2026-04-27 09:37:04 CEST 3h 30min ago fstrim.timer                     fstrim.service
-                                 - -                                       - pamac-mirrorlist.timer           -

8 timers listed.
```

## Slowest Starting Services
```
8min 34.894s fstrim.service
 2min 7.939s colord.service
1min 10.131s plocate-updatedb.service
     20.098s cups.service
     17.858s NetworkManager-wait-online.service
     15.697s systemd-timesyncd.service
     15.609s systemd-backlight@backlight:intel_backlight.service
     15.532s systemd-resolved.service
     15.103s systemd-vconsole-setup.service
     14.973s systemd-backlight@leds:dell::kbd_backlight.service
      3.536s sys-devices-platform-STM0125:00-tpm-tpm0.device
      3.536s dev-tpm0.device
      3.446s sys-devices-platform-STM0125:00-tpmrm-tpmrm0.device
      3.446s dev-tpmrm0.device
      3.427s dev-ttyS0.device
      3.427s sys-devices-platform-serial8250-serial8250:0-serial8250:0.0-tty-ttyS0.device
      3.427s dev-ttyS1.device
      3.427s sys-devices-platform-serial8250-serial8250:0-serial8250:0.1-tty-ttyS1.device
      3.424s dev-ttyS3.device
      3.424s sys-devices-platform-serial8250-serial8250:0-serial8250:0.3-tty-ttyS3.device
```

## Boot Critical Chain
```
The time when unit became active or started is printed after the "@" character.
The time the unit took to start is printed after the "+" character.

graphical.target @37.199s
└─multi-user.target @37.197s
  └─cups.service @17.096s +20.098s
    └─network.target @17.093s
      └─wpa_supplicant.service @17.075s +16ms
        └─basic.target @16.652s
          └─dbus-broker.service @16.612s +21ms
            └─dbus.socket @16.601s +12us
              └─sysinit.target @16.589s
                └─systemd-update-utmp.service @16.565s +22ms
                  └─systemd-tmpfiles-setup.service @16.490s +73ms
                    └─local-fs.target @16.483s
                      └─boot-efi.mount @16.449s +27ms
                        └─systemd-fsck@dev-disk-by\x2duuid-A80A\x2d33AD.service @952ms +42ms
                          └─dev-disk-by\x2duuid-A80A\x2d33AD.device
```

# Development Environment

## Installed Programming Languages & Tools
- **gcc**: gcc (GCC) 15.2.1 20260209
- **g++**: g++ (GCC) 15.2.1 20260209
- **clang**: clang version 22.1.3
- **python**: Python 3.14.4
- **python3**: Python 3.14.4
- **node**: v25.9.0
- **npm**: 11.12.1
- **cargo**: cargo 1.95.0 (f2d3ce0bd 2026-03-21) (Arch Linux rust 1:1.95.0-1)
- **rustc**: rustc 1.95.0 (59807616e 2026-04-14) (Arch Linux rust 1:1.95.0-1)
