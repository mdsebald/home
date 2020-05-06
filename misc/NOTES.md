# Arch Linux install notes

## Packages

```
adobe-source-code-pro-fonts
aura-bin
autoconf
awesome
bash-completion
chrome
chromium
cifs-utils
completion
copyq
cups-pdf
curl
deadbeef
dotnet
dotnet-sdk
fakeroot
flex
fop
gcc
git
gnupg
go
gvim
htop
jdk-openjdk
libwmf
libxslt
lxqt
lxqt-config-monitor
lxqt-runner
make
maven
mesa
noto-fonts
noto-fonts-cjk
noto-fonts-extra
obconf
openssh
openssl
oxygen-icons
patch
pavucontrol-qt
pcmanfm-qt
rand
reflector
rsync
speedcrunch
st
sudo git
tmux
unixodbc
unzip
util-linux
vagrant
vim
virtualbox
virtualbox-guest-utils
vlc
wget
which
wireshark
wxgtk2
wxgtk3
xf86-video-intel
xorg-apps
xorg-fonts
xorg-fonts-type1
xorg-server
xorg-xdpyinfo
xorg-xini
xorg-xrandr
xrand
xrandr
xscreensaver
xsltproc
xterm
ytt
```

## `systemd-networkd`

```
$ cat /etc/systemd/network/10-wired.network
[Match]
Name=enp0s31f6

[Network]
Address=192.168.1.5/24
Gateway=192.168.1.1
DNS=192.168.1.1
```

## `systemd-resolved`

`/etc/systemd/resolved.conf`:

```
[Resolve]
DNS=192.168.1.1
FallbackDNS=8.8.8.8 8.8.4.4 1.1.1.1 9.9.9.10 2606:4700:4700::1111 2620:fe::10 2001:4860:4860::8888
Domains=bakken.io
```

```
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
```

## `qterminal`

```
mv zenburn.colorscheme.txt ~/.config/qterminal.org/color-schemes/zenburn.colorscheme
```
