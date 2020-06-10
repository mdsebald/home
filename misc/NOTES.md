# Arch Linux install notes

## `/etc/fstab`

```
#zroot/ROOT/default
zroot/ROOT/default			/			zfs		rw,noatime,xattr,posixacl	0	0

#zroot/data/home
zroot/data/home				/home		zfs		rw,xattr,posixacl			0	0

#swap
/dev/zvol/zroot/data/swap   none		swap	discard						0	0

# /dev/nvme0n1p1
UUID=780B-390D				/mnt/efi	vfat	rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,errors=remount-ro				0	2

# /dev/sda3
UUID=5AA2-3E24				/mnt/data	vfat	rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,user,noauto,errors=remount-ro	0	2

# /mnt/efi/env/zedenv-default
# https://wiki.archlinux.org/index.php/EFI_system_partition#Using_bind_mount
/mnt/efi/env/zedenv-default	/boot		none	rw,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,utf8,errors=remount-ro,bind					0	0
```


## Swap

https://wiki.archlinux.org/index.php/ZFS#Swap_volume

```
zfs create -V 32G -b $(getconf PAGESIZE) -o logbias=throughput -o sync=always -o primarycache=metadata -o com.sun:auto-snapshot=false zroot/data/swap
```

```
[root@shostakovich ~]# mkswap -f /dev/zvol/zroot/data/swap 
Setting up swapspace version 1, size = 32 GiB (34359734272 bytes)
no label, UUID=6d98f068-e68a-4d03-a7eb-d0f141692c7a

[root@shostakovich ~]# swapon /dev/zvol/zroot/data/swap 

/dev/zvol/zroot/data/swap none swap discard 0 0
```


## Packages

```
adobe-source-code-pro-fonts
alsa-utils
aura-bin
autoconf
awesome
bash-completion
chrome
chromium
cifs-utils
completion
copyq
ctags
cups
cups-pdf
curl
deadbeef
dotnet
dotnet-sdk
fakeroot
ffmpegthumbnailer
flex
fop
gcc
git
gnupg
go
gvim
htop
jdk-openjdk
jq
lastpass-cli
libheif
libwmf
libstatgrab
libsysstat
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
openvpn
oxygen-icons
patch
pavucontrol-qt
pcmanfm-qt
python-pipenv
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
zoom
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

