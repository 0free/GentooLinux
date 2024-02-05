#!/bin/bash

timezone='Asia/Muscat'
ZFSpool='rpool'
mirror='rsync://mirror.leaseweb.com/gentoo/'
sync_uri='https://ftp.fau.de/gentoo/releases/amd64/binpackages/17.1/x86-64-v3/'

pkg_list() {

    pkg="$pkg
    app-admin/doas
    "

    pkg="$pkg
    sys-apps/apparmor
    sys-apps/apparmor-utils
    sys-apps/bolt
    sys-apps/coreutils
    sys-apps/dbus
    sys-apps/fakeroot
    sys-apps/findutils
    sys-apps/gawk
    sys-apps/gentoo-functions
    sys-apps/gentoo-systemd-integration
    sys-apps/gptfdisk
    sys-apps/kbd
    sys-apps/kmod
    sys-apps/lm-sensors
    sys-apps/locale-gen
    sys-apps/nvme-cli
    sys-apps/pciutils
    sys-apps/portage
    sys-apps/sed
    sys-apps/shadow
    sys-apps/systemd
    sys-apps/systemd-utils
    sys-apps/thunderbolt-software-user-space
    sys-apps/util-linux
    sys-apps/uutils-coreutils
    sys-apps/uutils-findutils
    sys-apps/which
    "

    pkg="$pkg
    net-firewall/firewalld net-firewall/nftables
    net-misc/networkmanager
    net-misc/curl net-misc/wget2
    "

    if ! grep -q 'no-desktop'; then
        pkg="$pkg
        sys-apps/openrazer
        sys-apps/polychromatic
        sys-apps/xdg-desktop-portal
        "
    fi

    if ! grep -q 'virtual'; then
        pkg="$pkg
        net-wireless/iwd net-wireless/wireless-regdb
        net-print/cups net-print/cups-windows net-print/cups-pdf
        net-misc/yt-dlp
        sys-apps/fwupd
        sys-apps/fwupd-efi
        "
    fi

    pkg="$pkg
    sys-fs/dosfstools sys-fs/exfatprogs sys-fs/exfat-utils sys-fs/mtools sys-fs/ntfs3g
    sys-fs/fuse sys-fs/fuse-exfat sys-fs/fuseiso sys-fs/fuse-zip sys-fs/mount-zip
    sys-fs/jmtpfs sys-fs/mtpfs
    sys-fs/lvm2
    sys-fs/mtd-utils
    sys-fs/udisks
    "

    if grep -q bcachefs list; then
        pkg="$pkg
        sys-fs/bcachefs-tools
        "
    fi

    if grep -q btrfs list; then
        pkg="$pkg
        sys-fs/btrfs-progs sys-fs/btrfsmaintenance
        "
    fi

    if grep -q ext4 list; then
        pkg="$pkg
        sys-fs/e2fsprogs
        "
    fi

    if grep -q f2fs list; then
        pkg="$pkg
        sys-fs/e2fsprogs
        "
    fi

    if grep -q xfs list; then
        pkg="$pkg
        sys-fs/xfsprogs
        "
    fi

    if grep -q zfs list; then
        pkg="$pkg
        sys-fs/zfs sys-fs/zfs-kmod
        "
    fi

    if ! grep -q virtual list; then
        pkg="$pkg

        "
    fi

    if grep -q gnome list; then

        pkg="$pkg
        gnome-base/gdm
        gnome-base/gnome-common
        gnome-base/gnome-control-center
        gnome-base/gnome-core-libs
        gnome-base/gnome-desktop
        gnome-base/dconf
        gnome-base/dconf-editor
        gnome-base/gnome-keyring
        gnome-base/gnome-session
        gnome-base/gnome-settings-daemon
        gnome-base/gnome-shell
        gnome-base/gsettings-desktop-schemas
        gnome-base/gvfs
        gnome-base/nautilus
        "

        pkg="$pkg
        gnome-extra/gnome-color-manager
        gnome-extra/gnome-firmware
        gnome-extra/gnome-logs
        gnome-extra/gnome-shell-extensions
        gnome-extra/gnome-shell-extension-dash-to-panel
        gnome-extra/gnome-system-monitor
        gnome-extra/gnome-tweaks
        gnome-extra/polkit-gnome
        "

        pkg="$pkg
        x11-themes/adwaita-icon-theme
        x11-themes/sound-theme-freedesktop
        "

        pkg="$pkg
        x11-terms/gnome-terminal
        "

        pkg="$pkg
        x11-wm/mutter
        "

        pkg="$pkg
        gui-apps/gnome-console
        "

        pkg="$pkg
        sys-apps/baobab					
        sys-apps/gnome-disk-utility
        sys-apps/xdg-desktop-portal-gnome
        "

        pkg="$pkg
        net-libs/glib-networking
        net-wireless/gnome-bluetooth
        "

        pkg="$pkg
        media-fonts/cantarell
        "

        pkg="$pkg
        media-gfx/eog
        media-gfx/gnome-photos
        "

        pkg="$pkg
        media-sound/gnome-music
        "

        pkg="$pkg
        app-arch/file-roller
        app-editors/gedit
        app-text/evince
        "

    fi

    if grep -q kde list; then

        pkg="$pkg
        kde-frameworks/krunner
        "

        pkg="$pkg
        kde-plasma/bluedevil
        kde-plasma/breeze kde-plasma/breeze-gtk
        kde-plasma/kactivitymanagerd
        kde-plasma/kde-cli-tools
        kde-plasma/kdecoration
        kde-plasma/kde-gtk-config
        kde-plasma/kglobalacceld
        kde-plasma/kpipewire
        kde-plasma/kscreen kde-plasma/kscreenlocker
        kde-plasma/ksysguard kde-plasma/ksystemstats
        kde-plasma/kwallet-pam
        kde-plasma/kwayland kde-plasma/kwayland-integration
        kde-plasma/kwin kde-plasma/kwrited
        kde-plasma/layer-shell-qt
        kde-plasma/plasma5support
        kde-plasma/plasma-activities kde-plasma/plasma-activities-stats
        kde-plasma/plasma-desktop
        kde-plasma/plasma-disks
        kde-plasma/plasma-firewall
        kde-plasma/plasma-integration
        kde-plasma/plasma-nm
        kde-plasma/plasma-pa
        kde-plasma/plasma-systemmonitor
        kde-plasma/plasma-thunderbolt
        kde-plasma/plasma-workspace
        kde-plasma/polkit-kde-agent
        kde-plasma/powerdevil
        kde-plasma/print-manager
        kde-plasma/sddm-kcm
        kde-plasma/systemsettings
        kde-plasma/xdg-desktop-portal-kde
        "

        pkg="$pkg
        kde-apps/ark
        kde-apps/dolphin
        kde-apps/kate
        kde-apps/kcolorchooser
        kde-apps/kdenlive
        kde-apps/kolourpaint
        kde-apps/kdialog
        kde-apps/kfind
        kde-apps/kmail
        kde-apps/kmix
        kde-apps/konsole
        kde-apps/ksystemlog
        kde-apps/ffmpegthumbs
        kde-apps/okular
        kde-apps/spectacle
        kde-apps/thumbnailers
        "

        pkg="$pkg
        kde-misc/bismuth
        kde-misc/colord-kde
        kde-misc/kdeconnect
        "

        pkg="$pkg
        net-p2p/ktorrent
        "

        pkg="$pkg
        x11-misc/sddm
        "

    fi

    if grep -q hyprland list; then
        pkg="$pkg
        x11-misc/lightdm x11-misc/lightdm-gtk-greeter
        gui-libs/greetd gui-apps/gtkgreet
        gui-wm/hyprland
        gui-apps/waybar
        "
    fi

    if ! grep -Eq "no-desktop|virtual|server" list; then
        pkg="$pkg

        "
    fi

    if grep -q minimal list; then

        if grep -q gnome list; then
            pkg="$pkg

            "
        fi

        if grep -q kde list; then
            pkg="$pkg

            "
        fi

        pkg="$pkg
        games-util/heroic-bin games-util/lutris
        "

    fi

    if grep -q minimal list; then
        pkg="$pkg

        "
    fi

}

menu() {

    printf '\n ❯❯ %s:\n\n' "$1"
    output=$2
    shift 2
    n=1
    while true; do
        eval "c=\${$n}"
        for i in "$@"; do
            if [ "$i" = "$c" ]; then
                printf ' \e[7m ❯ %s \e[0m\n' "$i"
            else
                printf '  ❯ %s \n' "$i"
            fi
        done
        read -rsn3 key
        case $key in
            $(printf '\e[A')) [ $n -gt 1 ] && n=$((n-1));;
            $(printf '\e[B')) [ $n -lt $# ] && n=$((n+1));;
            '') break;;
        esac
        printf -- '\e[%sA' $#
    done
    export "$output"="$c"

}

init_drive() {

    printf '%s\n' '❯ created by Saif AlSubhi'
    for i in $(seq 1 100); do printf -- '-%.0s' $i; done
    printf '\n'
    lsblk -o name,type,fstype,size,fsused,mountpoint,parttypename,label,model | grep -E "^NAME|^nvme.*|sd.*"
    for i in $(seq 1 100); do printf -- '-%.0s' $i; done
    printf '\n'

    if [ ! -f list ]; then
        printf '%s\n' "" > list
    fi

    if ! grep -q 'drive=' list; then

        set -- $(find /dev -name 'nvme[0-9]n[1-9]' -o -name 'sd[a-z]')

        menu 'select a drive' drive $@

        printf '%s\n' "drive=$drive" >> list

        if find /dev | grep -Eq "$drive[p][1-9]|$drive[1-9]"; then

            set -- $(find $drive*)

            menu 'use this drive or select a root partition' partition $@

            if [ "$drive" -ne "$partition" ]; then

                rootDrive=$partition

                set -- $(find $drive*[1-9]* | grep -v $partition)

                if [ "$*" -ne "" ]; then
                    menu 'select a boot partition' bootDrive $@
                fi

                set -- $(find $drive*[1-9]* | grep-Ev "$rootDrive|$bootDrive")

                if [ "$*" -ne "" ]; then
                    menu 'select a recovery partition' recoveryDrive $@
                fi

                set -- $(find $drive*[1-9]* | grep-Ev "$rootDrive|$bootDrive|$recoveryDrive")

                if [ "$*" -ne "" ]; then
                    menu 'select a swap partition' swapDrive $@
                fi

            fi

        fi

    fi

    if ! grep -q 'swapSize=' list; then
        set -- no-swap 2GiB 3GiB 4GiB 8GiB 16GiB
        menu 'select swap partition size' swapSize $@
        printf '%s\n' "swapSize=$swapSize" >> list
    fi

    if ! grep -q 'recoverySize=' list; then
        set -- 3GiB 4GiB 8GiB no-recovery
        menu 'select recovery partition size' recoverySize $@
        printf '%s\n' "recoverySize=$recoverySize" >> list
    fi

    if ! grep -q 'filesystem=' list; then
        set -- ext4 xfs zfs bcachefs btrfs
        menu 'select a filesystem' filesystem $@
        printf '%s\n' "filesystem=$filesystem" >> list
    fi

}

init_system() {

    if ! grep -q 'computer=' list; then
        set -- minimal virtual base
        menu 'select a computer' computer $@
        printf '%s\n' "computer=$computer" >> list
    fi

    if ! grep -q 'desktop=' list; then
        set -- kde gnome hyprland no-desktop
        menu 'select a desktop' desktop $@
        printf '%s\n' "desktop=$desktop" >> list
    fi

    printf '\n'

}

init_user() {

    if ! grep -q 'user=' list; then
        while ! printf '%s' $user | grep -Eiq '^[a-z_][-a-z0-9._-]*$'; do
            printf '❯ username: ' && read -r user
        done
        printf '%s\n' "user=$user" >> list
    fi

    if ! grep -q 'password=' list; then
        while ! printf '%s' $password | grep -Eiq '^[a-z0-9._-].{1,16}$'; do
            printf '❯ password: ' && read -r password
        done
        printf '%s\n' "password=$password" >> list
    fi

    printf '\n'

}

setup_drive() {

    if ! df -Th | grep -q '/mnt/gentoo'; then
        format_drive
    fi

    if ! df -Th | grep -q "^$rootDrive"; then
        mount_root
    fi

    if df -Th | grep -q "^$rootDrive"; then
        install_base
        mount_boot
        change_root
    fi

}

format_drive() {

    if [ ! -f /usr/sbin/sgdisk ]; then
        printf '%s\n' "❯ installing sgdisk"
        emerge -g sys-apps/gptfdisk
    fi

    printf '%s\n' "❯ wiping filesystm"
    wipefs -a -f $drive
    printf '%s\n' "❯ deleting partitions"
    sgdisk -Z $drive
    printf '%s\n' "❯ creating GPT"
    sgdisk -o -U $drive

    printf '%s\n' "❯ creating boot partition"
    if grep -q virtual list; then
        bootSize='100MiB'
    else
        bootSize='300MiB'
    fi

    sgdisk -n 0:0:+$bootSize -c 0:EFI -t 0:EF00 $drive

    i=1

    bootDrive=$(find $drive* | grep -E "$drive[$i]|$drive[p][$i]")

    printf '%s\n' "❯ creating boot filesystem"
    printf '%s\n' 'Y' | mkfs.vfat -F 32 -n BOOT $bootDrive
    sleep 1

    printf '%s\n' "bootDrive=$bootDrive" >> list

    if printf '%s' $recoverySize | grep -q GiB; then

        printf '%s\n' "❯ creating recovery partition"
        sgdisk -n 0:0:+ $recoverySize -c 0:RECOVERY -t 0:8300 $drive
        i=$((i+1))
        recoveryDrive=$(find $drive* | grep -E "$drive[$i]|$drive[p][$i]")
        printf '%s\n' "recoveryDrive=$recoveryDrive" >> list

        printf '%s\n' "❯ creating recovery filesystem"
        if [ "$filesystem" = 'zfs' ]; then
            bcachefs format --compression=lz4 $recoveryDrive
        elif [ "$filesystem" = 'bcachefs' ]; then
            bcachefs format --compression=lz4 $recoveryDrive
        elif [ "$filesystem" = 'btrfs' ]; then
            printf '%s\n' 'Y' | mkfs.btrfs  -f -L btrfs $recoveryDrive
        elif [ "$filesystem" = 'ext4' ]; then
            printf '%s\n' 'Y' | mkfs.ext4 -L ext4 $recoveryDrive
        elif [ "$filesystem" = 'xfs' ]; then
            printf '%s\n' 'Y' | mkfs.xfs -f -L xfs $recoveryDrive
        fi

    fi

    if printf '%s' $swapSize | grep -q GiB; then

        printf '%s\n' "❯ creating swap partition"
        sgdisk -n 0:0:+$swapSize -c 0:SWAP -t 0:8200 $drive
        i=$((i+1))
        swapDrive=$(find $drive* | grep -E "$drive[$i]|$drive[p][$i]")
        printf '%s\n' "❯ creating swap filesystem"
        mkswap $swapDrive
        printf '%s\n' "swapDrive=$swapDrive" >> list

    fi

    printf '%s\n' "❯ creating root partition"
    if [ "$filesystem" = zfs ]; then
        sgdisk -n 0:0:0 -c 0:ZFS -t 0:BF00 $drive
    else
        sgdisk -n 0:0:0 -c 0:ROOT -t 0:8300 $drive
    fi

    i=$((i+1))

    rootDrive=$(find $drive* | grep -E "$drive[$i]|$drive[p][$i]")

    printf '%s\n' "rootDrive=$rootDrive" >> list

    printf '%s\n' "❯ creating root filesystem"

    if [ "$filesystem" = 'zfs' ]; then
        create_zfs
    elif [ "$filesystem" = 'bcachefs' ]; then
        bcachefs format --compression=lz4 $rootDrive
    elif [ "$filesystem" = 'btrfs' ]; then
        printf '%s\n' 'Y' | mkfs.btrfs  -f -L btrfs $rootDrive
    elif [ "$filesystem" = 'ext4' ]; then
        printf '%s\n' 'Y' | mkfs.ext4 -L ext4 $rootDrive
    elif [ "$filesystem" = 'xfs' ]; then
        printf '%s\n' 'Y' | mkfs.xfs -f -L xfs $rootDrive
    fi

}

create_zfs() {

    if ! test zfs; then
        printf '%s\n' "❯ adding ZFS"
        emerge -g sys-fs/zfs sys-fs/zfs-kmod
    fi

    printf '%s\n' "❯ creating ZFS pool"
    zpool create -f -o ashift=12 -o \
    -o autotrim=on \
    -o cachefile=/etc/zfs/zpool.cache \
    -O logbias=latency \
    -O compression=lz4 \
    -O primarycache=metadata -O secondarycache=metadata -O sync=always \
    -O recordsize=16k -O dnodesize=16k \
    -O devices=off -O relatime=off -O atime=off -O normalization=formD \
    -O acltype=posixacl -O xattr=sa -O dedup=off \
    -O canmount=noauto -O mountpoint=/ -R /mnt/gentoo $ZFSpool $rootDrive

    printf '%s\n' "❯ checking ZFS pool"
    zpool status

    set_zfs

}

set_zfs() {

    printf '%s\n' "❯ setting ZFS pool as rootfs"
    zpool set bootfs=$ZFSpool $ZFSpool

    printf '%s\n' "❯ setting ZFS cache"
    mkdir -p /mnt/gentoo/etc/zfs/
    cp /etc/zfs/zpool.cache /mnt/gentoo/etc/zfs/zpool.cache
    chmod a-w /mnt/gentoo/etc/zfs/zpool.cache
    chattr +i /mnt/gentoo/etc/zfs/zpool.cache

    printf '%s\n' "❯ adding ZFS options"
    mkdir -p /mnt/gentoo/etc/modprobe.d/
    cat > /mnt/gentoo/etc/modprobe.d/zfs.conf <<EOF
options zfs l2arc_noprefetch=0
options zfs l2arc_write_max=536870912
options zfs l2arc_write_boost=1073741824
options zfs l2arc_headroom=12
options zfs zfs_arc_max=536870912
options zfs zfs_arc_min=268435456
options zfs zfs_prefetch_disable=0
options zfs zfs_top_maxinflight=320
options zfs zfs_txg_timeout=15
options zfs zfs_vdev_scheduler=deadline
options zfs zfs_vdev_async_read_min_active=8
options zfs zfs_vdev_async_read_max_active=32
options zfs zfs_vdev_async_write_min_active=8
options zfs zfs_vdev_async_write_max_active=32
options zfs zfs_vdev_sync_write_min_active=8
options zfs zfs_vdev_sync_write_max_active=32
options zfs zfs_vdev_sync_read_min_active=8
options zfs zfs_vdev_sync_read_max_active=32
EOF

}

mount_root() {

    mkdir -p /mnt/gentoo

    if grep -q 'zfs' list; then
        printf '%s\n' "❯ exporting zpool"
        zpool export $ZFSpool
        printf '%s\n' "❯ importing zpool"
        zpool import $ZFSpool -d $rootDrive -R /mnt/gentoo
        printf '%s\n' "❯ mounting zfs dataset"
        zfs mount -a
    else
        printf '%s\n' "❯ mounting root drive"
        mount -t $filesystem $rootDrive /mnt/gentoo
    fi
    if ! df -Th | grep -q '/mnt/gentoo'; then
        printf '%s\n' "ERROR: root drive is not mounted"
        exit
    fi

}

install_base() {

    printf '%s\n' "❯ adding CloudFlare DNS"
    cat > /etc/resolv.conf <<EOF
nameserver 1.0.0.1
EOF

    printf '%s\n' "❯ Configuring Portage"
    cat > /etc/portage/make.conf <<EOF
COMMON_FLAGS="-O2 -pipe"
CFLAGS="\${COMMON_FLAGS}"
CXXFLAGS="\${COMMON_FLAGS}"
FCFLAGS="$\{COMMON_FLAGS}"
FFLAGS="\${COMMON_FLAGS}"
PORTDIR="/var/db/repo/gentoo"
DISDIR="/var/cache/distfiles"
PKGDIR="/var/cache/binpkgs"
USE="-wayland -systemd -consolekit dbus als pipewire elogind png"
ACCEPT_KEYWORDS="-amd64"
INPUT_DEVICE="libinput synaptics"
VIDEO_CARDS="nvidia"
LC_MESSAGES=C.utf8
GENTOO_MIRRORS="$mirror"
FEATURES="\${FEATURES} binpkg-request-signature"
EMERGE_DEFAULT_OPTS="\${EMERGE_DEFAULT_OPTS} --getbinpkg --with-bdeps=y"
EOF

    mkdir -p /etc/portage/binrepos.conf/
    cat > /etc/portage/binrepos.conf/gentoo.conf <<EOF
[binhost]
priority = 1
sync-uri = $sync_uri
EOF

    mkdir -p /etc/portage/repos.conf/
    cat > /etc/portage/repos.conf/gentoo.conf<<EOF
[DEFAULT]
main-repo = gentoo
[gentoo]
priority = 2
location = /var/db/repos/gentoo
sync-type = rsync
sync-uri = rsync://rsync.gentoo.org/gentoo-portage
auto-sync = yes
EOF

    cat > /etc/portage/repos.conf/the-pit.conf <<EOF
[the-pit]
priority = 3
location = /var/db/repos/the-pit
sync-type = git
sync-uri = git://me.org/me/the-pit.git
auto-sync = true
EOF

    mkdir -p /etc/portage/repos.conf
    cp /usr/share/portage/config/repos.conf /etc/portage/repos.conf/gentoo.conf

    emerge-webrsync
    emerge --sync --quiet
    emaint sync -r the-pit

    printf '%s\n' "❯ installing Gentoo Linux stage3"

    url="https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-llvm-systemd/latest-stage3-amd64-llvm-systemd.txt"

    curl -o ~/stage3.txt $url

    url=$(grep -o "^stage3.*.tar.xz$" ~/stage3.txt)

    curl -o ~/stage3.tar.xz $url

    tar xpf ~/stage3.tar.xz --xattrs-include='*.*' --numeric-owner

    if [ -d /mnt/gentoo/boot/ ]; then
        rm ~/stage3.tar.xz
    fi

    printf '%s\n' "❯ Configuring Portage"
    mkdir -p /mnt/gentoo/etc/portage/repos.conf/
    cp /etc/portage/*.conf /mnt/gentoo/etc/portage/
    cp /etc/portage/repos.conf/*.conf /mnt/gentoo/etc/portage/repos.conf/
    cp /etc/portage/binrepos.conf/*.conf /mnt/gentoo/etc/portage/binrepos.conf/

    printf '%s\n' "❯ configuring systemd"
    mkdir -p /etc/portage/package.use/
    echo "sys-apps/systemd boot" >> /etc/portage/package.use/systemd
    emerge -g --root=/mnt/gentoo --config-root=/mnt/gentoo sys-apps/systemd

    printf '%s\n' "❯ adding CloudFlare DNS"
    ln -snf /run/systemd/resolve/resolv.conf /etc/resolv.conf

    mount_boot

}

mount_boot() {

    printf '%s\n' "❯ mounting boot drive"
    mount -t vfat $bootDrive /mnt/gentoo/boot/
    mkdir -p /mnt/gentoo/boot/efi/boot/

}

change_root() {

    if ! grep -q 'step=' list; then
        printf '%s\n' "❯ copying list file"
        printf '\n%s' 'step=0' >> list
        cp list /mnt/gentoo/
    fi

    printf '%s\n' "❯ copying install script"
    cp ~/setup.sh /mnt/gentoo/

    printf '%s\n' "❯ changing root"
    mount --types proc /proc /mnt/gentoo/proc
    mount --rbind /sys /mnt/gentoo/sys
    mount --make-rslave /mnt/gentoo/sys
    mount --rbind /dev /mnt/gentoo/dev
    mount --make-rslave /mnt/gentoo/dev
    mount --bind /run /mnt/gentoo/run
    mount --make-slave /mnt/gentoo/run

    chroot /mnt/gentoo/ bash setup.sh

}

set_fstab() {

    printf '%s\n' "❯ setting fstab"

    rootUUID=$(blkid $rootDrive -o export | grep ^UUID=)

    entry="$rootUUID / $filesystem x-systemd.automount,rw,ssd,noatime,autodefrag,compression=lz4 0 0"

    printf '\n%s\n' "$entry" > /etc/fstab

    bootUUID=$(blkid $bootDrive -o export | grep ^UUID=)

    printf '\n%s\n' "$bootUUID /boot vfat x-systemd.automount,rw,ssd,noatime,autodefrag 0 0" >> /etc/fstab

    if grep -q swapDrive list; then
        swapUUID=$(blkid $swapDrive -o export | grep ^UUID=)
        printf '\n%s\n' "$swapUUID none swap x-systemd.automount,sw 0 0" >> /etc/fstab
    fi

    printf '\n%s\n' "tmpfs /var/tmp/portage tmpfs x-systemd.automount,rw,size=16GB,uid=portage,gid=portage,mode=775,ssd,nosuid,noatime,nodev 0 0" >> /etc/fstab

    sed -i 's|step=.*|step=1|' list

}

configure_gentoo() {

    printf '%s\n' "❯ setting locales"

    cat > /etc/locale.gen <<EOF
en_US ISO-8859-1
en_US.UTF-8 UTF-8
EOF

    locale-gen
    localectl set-locale LANG=en_US.UTF-8
    localectl set-keymap us
    hostnamectl set-hostname 'gentooLinux'

    cat > /etc/profile.d/locale <<EOF
export CHARSET=\${CHARSET:-UTF-8}
export LANG=\${LANG:-C.UTF-8}
export LC_COLLATE=\${LC_COLLATE:-C}
EOF

    printf '%s\n' "❯ setting timezone"
    timedatectl set-timezone $timezone
    timedatectl set-ntp true

    printf '%s\n' "127.0.0.1 localhost gentooLinux" > /etc/hosts
    printf '%s\n' "::1       localhost gentooLinux" >> /etc/hosts

    printf '%s\n' "❯ adding interfaces"

    cat > /etc/network/interfaces <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto wlan0
iface wlan0 inet dhcp
EOF

    printf '%s\n' "❯ configuring NetworkManager"

    mkdir /etc/NetworkManager/
    cat > /etc/NetworkManager/NetworkManager.conf <<EOF
[main]
dhcp=internal
plugins=ifupdown,keyfile
[ifupdown]
managed=true
[device]
wifi.backend=iwd
EOF

    if [ -f /etc/conf.d/hwclock ]; then
        cat > /etc/conf.d/hwclock <<EOF
clock="local"
clock_hctosys="NO"
clock_systohc="YES"
clock_args=""
EOF
    fi

    if ! grep -q snd_seq /etc/modules; then
        printf '%s\n' snd_seq >> /etc/modules
    fi

    printf '%s\n' "❯ configuring pipewire"
    mkdir -p $H/.config/pipewire/
    cp /usr/share/pipewire/*.conf $H/.config/pipewire/

    printf '%s\n' "❯ disabling IPv6"
    printf '%s\n' 'net.ipv6.conf.all.disable_ipv6 = 1' > /etc/sysctl.d/01-disable-ipv6.conf

    printf '%s\n' "❯ configuring firewalld"
    sed -i 's|^#.*||' /etc/firewalld/firewalld.conf

    printf '%s\n' "❯ setting ~/"
    chown -R $user:wheel $H/
    chown -R $user:wheel $H/.config/
    chmod -R 700 $H/
    chmod -R 700 $H/.config/

    printf '%s\n' "❯ configuring systemd"

    printf '%s\n' "❯ configuring gentooLinux"

    sed -i 's|step=.*|step=2|' list

}

install_linux() {

    emerge -g sys-kernel/gentoo-kernel-bin
    emerge -g sys-kernel/linux-headers
    emerge -g sys-kernel/linux-firmware

    if grep -q virtual list; then

        list="$list "

        if grep -q zfs list; then
            list="$list "
        fi

    else

        if grep -q zfs list; then
            list=''
        fi

        if grep -m1 'model name' /proc/cpuinfo | grep -q 'AMD'; then
            list="$list sys-firmware/amd-microcode"
        fi

        if grep -m1 'model name' /proc/cpuinfo | grep -q 'Intel'; then
            list="$list sys-firmware/intel-microcode"
        fi

        if grep -q 'nVidia'; then
            list="$list x11-drivers/nvidia-drivers"
        fi

        list="$list "

    fi

    if grep -q zfs list; then
        list="$list zfs zfs-openrc zfs-libs zfs-udev"
    fi

    printf '%s\n' "❯ installing linux"
    emerge -g $list

    sed -i 's|step=.*|step=3|' list

}

install_pkg() {

    printf '%s\n' "❯ packages list"
    pkg_list
    list=''
    for p in $pkg; do
        if ! printf $p | grep -q '^#'; then
            list="$list $p"
        fi
    done
    printf '%s\n' "❯ installing packages"
    emerge -g $list

    sed -i 's|step=.*|step=4|' list

}

disable_root() {

    printf '%s\n' "❯ disabling root login"
    passwd -l root
    sed -i 's|:/bin/bash|:/sbin/nologin|' /etc/passwd

    sed -i 's|step=.*|step=5|' list

}

create_user() {

    if id $user >/dev/null 2>&1; then
        printf '%s\n' "❯ deleting $user"
        userdel -r $user
    fi
    printf '%s\n' "❯ adding wheel to doas"
    sed -i 's|# permit persist :wheel|permit persist :wheel|' /etc/doas.conf
    chmod 0400 /etc/doas.conf
    printf '%s\n' "❯ creating user"
    printf '%s\n%s\n' $password $password | adduser -h /home/$user -s /bin/bash -G wheel $user
    usermod -aG input,audio,video,netdev,usb,disk $user
    mkdir -p /var/mail/$user/
    H="/home/$user"
    mkdir -p $H/.config/autostart/
    mkdir -p $H/.local/

    sed -i 's|step=.*|step=6|' list

}

enable_services() {

    printf '%s\n' "❯ enabling services"
    #systemd
    systemctl enable systemd-bootchart
    systemctl enable systemd-networkd.service
    systemctl enable systemd-resolved.service
    systemctl enable systemd-boot-update.service
    #busybox
    systemctl enable mdev.service
    systemctl enable syslog.service
    systemctl enable acpid.service
    systemctl enable crond.service
    #rsyslog
    systemctl enable rsyslog.service
    #zfs
    systemctl enable zfs-import.service
    systemctl enable zfs-mount.service
    systemctl enable zfs-share.service
    systemctl enable zfs-zed.service
    systemctl enable zfs-load-key.service
    #apparmor
    systemctl enable apparmor.service
    #seatd
    systemctl enable seatd.service
    #dbus
    systemctl enable dbus.service
    #logind
    systemctl enable elogind.service
    #polkit
    systemctl enable polkit.service
    #networkmanager
    systemctl enable networkmanager.service
    systemctl enable networkmanager-dispatcher.service
    #firewall
    systemctl enable nftables.service
    systemctl enable firewalld.service
    #alsa
    systemctl enable alsa.service
    #bluez
    systemctl enable bluetooth.service
    systemctl enable bluealsa.service
    #rsync
    systemctl enable rsyncd.service
    #wireless
    systemctl enable iwd.service
    #firmware
    systemctl enable fwupd.service
    #login-manager
    systemctl enable gdm.service
    systemctl enable greetd.service
    systemctl enable lightdm.service
    systemctl enable sddm.service
    #linux-tools
    systemctl enable cpupower.service
    systemctl enable usbip.service
    #printer
    systemctl enable cupsd.service
    #openvpn
    systemctl enable openvpn.service
    #rpcbind
    systemctl enable rpcbind.service
    #syncthing
    systemctl enable syncthing.service

    sed -i 's|step=.*|step=7|' list

}

setup_desktop() {

    if [ -f /usr/bin/gnome-session ]; then
        run_session='/usr/bin/gnome-session'
        session='/usr/share/wayland-sessions/gnome-wayland.desktop'
    fi

    if [ -f /usr/bin/startplasma-wayland ]; then
        run_session='/usr/bin/startplasma-wayland'
        session='/usr/share/wayland-sessions/plasma.desktop'
    fi

    if [ -f /usr/bin/Hyprland ]; then
        run_session='/usr/bin/Hyprland'
        session='/usr/share/wayland-sessions/hyprland.desktop'
    fi

    if [ ! -d /usr/share/icons/windows-11-icons/ ]; then
        printf '%s\n' "❯ cloning Windows-11-icons"
        git clone https://github.com/0free/windows-11-icons.git $H/windows-11-icons/
        cp -r $H/windows-11-icons/* /usr/share/icons/
        rm -r $H/windows-11-icons/
    fi

    if grep -q gnome list; then
        if [ ! -f $H/dconf-settings.ini ]; then
            printf '%s\n' "❯ downloading dconf-settings"
            curl -so $H/dconf.ini https://raw.githubusercontent.com/0free/GentooLinux/systemd/dconf-settings.ini
            printf '%s\n' "❯ loading dconf-settings"
            dconf load / < $H/dconf.ini
            printf '%s\n' "❯ removing dconf-settings"
            rm $H/dconf.ini
        fi
    fi

    if grep -q kde list; then
        mkdir -p /etc/sddm.conf.d/
        if [ ! -d $H/.config/kde.org/ ]; then
            printf '%s\n' "❯ cloning KDE settings"
            git clone https://github.com/0free/KDE-plasma.git $H/kde/
            printf '%s\n' "❯ configuring KDE"
            cp -r $H/kde/config/* $H/.config/
            cp -r $H/kde/local/* $H/.local/
            rm -r $H/kde/
        fi
    fi

    if [ -f /etc/sddm.conf ]; then
        cat > /etc/sddm.conf <<EOF
[Autologin]
User=$user
[Theme]
Current=breeze
EOF
    fi

    if [ -f /usr/bin/lightdm ]; then
        configure_lightdm
    fi

    if [ -f /usr/sbin/greetd ]; then
        configure_greetd
    fi

    sed -i 's|step=.*|step=8|' list

}

configure_lightdm() {

    printf '%s\n' "❯ configuring lightdm"

    if grep -q hyprland list; then
        sed -i 's|#autologin-session=.*|autologin-session=/usr/share/wayland-sessions/hyprland.desktop|' /etc/lightdm/lightdm.conf
    fi

    sed -i "s|#allow-guest=.*|allow-guest=false|" /etc/lightdm/lightdm.conf
    sed -i "s|#autologin-guest=.*|autologin-guest=false|" /etc/lightdm/lightdm.conf
    sed -i "s|#autologin-user=.*|autologin-user=$user|" /etc/lightdm/lightdm.conf
    sed -i "s|#autologin-user-timeout=.*|autologin-user-timeout=0|" /etc/lightdm/lightdm.conf
    sed -i "s|#autologin-in-background=.*|autologin-in-background=false|" /etc/lightdm/lightdm.conf
    sed -i "s|#user-session=.*|user-session=default|" /etc/lightdm/lightdm.conf
    sed -i "s|#greeter-session=.*|greeter-session=lightdm-gtk-greeter|" /etc/lightdm/lightdm.conf

}

configure_greetd() {

    printf '%s\n' "❯ configuring greetd"

    if grep -q hyprland list; then
        sed -i 's|# exec-once = .*|exec-once = regreet|' /usr/share/hyprland/hyprland.conf
        command='/usr/bin/Hyprland  --config /usr/share/hyprland/hyprland.conf'
    fi

    cat > /etc/greetd/config.toml <<EOF
[terminal]
vt=1
[initial_session]
command="$command"
user=$user
[default_session]
command="$command"
user=$user
EOF

    cat > /etc/greetd/regreet.toml <<EOF
[background]
path = "/usr/share/backgrounds/greeter.jpg"
fit = "Contain"
[env]
ENV_VARIABLE = ""
[GTK]
application_prefer_dark_theme = true
cursor_theme_name = "Adwaita"
font_name = "Cantarell 16"
icon_theme_name = "Adwaita"
theme_name = "Adwaita"
[commands]
reboot = [ "loginctl", "reboot" ]
poweroff = [ "loginctl", "poweroff" ]
login = [ "loginctl", "login" ]
EOF

    url='https://raw.githubusercontent.com/shnaps/dotfiles/main/packages/greetd/regreet.css'
    curl -so /etc/greetd/regreet.css $url

    regreet --config /etc/greetd/regreet.toml
    regreet --style /etc/greetd/regreet.css

}

add_scripts() {

    build_zfs
    custom_kernel
    google_chrome
    create_iso
    install_office
    openwrt

    sed -i 's|step=.*|step=9|' list

}

build_zfs() {

    printf '%s\n' "❯ downloading zfs-src script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/zfs.sh'
    curl -so /etc/profile.d/zfs.sh $url

}

custom_kernel() {

    printf '%s\n' "❯ downloading kernel script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/kernel.sh'
    curl -so /etc/profile.d/kernel.sh $url

}

google_chrome() {

    printf '%s\n' "❯ downloading google-chrome script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/google-chrome.sh'
    curl -so /etc/profile.d/google-chrome.sh $url

}

create_iso() {

    printf '%s\n' "❯ addining iso script"
    url="https://raw.githubusercontent.com/0free/GentooLinux/systemd/menu.sh"
    curl -so /etc/profile.d/menu.sh $url
    url="https://raw.githubusercontent.com/0free/GentooLinux/systemd/iso.sh"
    curl -so /etc/profile.d/iso.sh $url

}

install_office() {

    printf '%s\n' "❯ addining office script"
    url="https://raw.githubusercontent.com/0free/GentooLinux/systemd/options.sh"
    curl -so /etc/profile.d/options.sh $url
    url="https://raw.githubusercontent.com/0free/GentooLinux/systemd/office.sh"
    curl -so /etc/profile.d/office.sh $url

}

openwrt() {

    printf '%s\n' "❯ downloading openwrt script"
    url="https://raw.githubusercontent.com/0free/GentooLinux/systemd/openwrt.sh"
    curl -so /etc/profile.d/openwrt.sh $url

}

make_initramfs() {

    printf '%s\n' "❯ installing mkinitfs"
    modules='ata base btrfs cdrom dhcp ext4 f2fs keymap kms lvm mmc network nvme scsi usb virtio wireguard xfs zfs'

    if grep -q virtual list; then
        modules="$modules vboxvideo virtio-gpu vmvga vmwgfx"
    else
        modules="$modules intel_agp i915"
        modules="$modules amdgpu"
    fi

    printf '%s\n' "❯ configuring mkinitfs"
    printf '%s' "features=\"$modules \"" > /etc/mkinitfs/mkinitfs.conf

    for k in $(ls /lib/modules/ | grep [0-9]); do
        printf '%s\n' "❯ building linux $k initial ramdisk"
        mkinitfs -b / -c /etc/mkinitfs/mkinitfs.conf -f /etc/fstab -o /boot/initramfs-$(printf '%s' $k | sed 's|.*-||') $k
    done

    sed -i 's|step=.*|step=10|' list

}

setup_bootloader() {

    find_windows

    if grep -q zfs list; then
        param="root=$ZFSpool"
    else
        param="root=$(blkid $rootDrive -o export | grep ^UUID=)"
    fi

    param="$param rootfstype=$filesystem rw quiet loglevel=3 mitigations=off apparmor=1 security=apparmor"

    if [ -f /usr/libexec/fwupd/efi/fwupdx64.efi ]; then
        firmware_update
    fi

    systemd_boot

    sed -i 's|step=.*|step=11|' list

}

find_windows() {

    printf '%s\n' "❯ looking for Windows"
    for d in /dev/*; do
        if [ ! -d $d ]; then
            if printf '%s' $d | grep -Eq '/dev/nvme[0-9]n[1-9]p1$|/dev/sd[a-z]1$'; then
                p=$d
                if [ "$p" -ne "$bootDrive" ]; then
                    mkdir -p /windows/
                    mount -r $p /windows/
                    if [ -f /windows/EFI/Microsoft/Boot/BCD ]; then
                        printf '%s\n' "❯ copying Windows Boot Manager"
                        cp -rlf /windows/* /boot/
                        windowsDrive=$d
                        windowsBoot=$p
                        printf '%s\n' "windowsDrive=$d" >> list
                        printf '%s\n' "windowsBoot=$p" >> list
                    fi
                    umount /windows/
                    if [ -d /windows/ ]; then
                        rm -r /windows/
                    fi
                fi
            fi
        fi
    done

}

firmware_update() {

    mkdir -p /boot/firmware/
    cp /usr/libexec/fwupd/efi/fwupdx64.efi /boot/firmware/
    version=$(emerge -s fwupd)
    cat > /etc/profile.d/fwupd.sh <<EOF
#!/bin/bash
version='$version'
update_firmware() {
    latest=\$(emerge -s fwupd)
    if ! grep -q \$latest /etc/profile.d/fwupd.sh; then
        doas cp /usr/libexec/fwupd/efi/fwupdx64.efi /boot/firmware/
        doas sed -i "s|^version='.*'|version='\$latest'|" /etc/profile.d/fwupd.sh
    else
        printf '%s\n' '❯ fwupd is up-to-date'
    fi
}
EOF

}

systemd_boot() {

    printf '%s\n' "❯ installing systemd-boot"
    emerge -g sys-apps/systemd boot
    emerge -g sys-kernel/installkernel-systemd
    emerge -g kernel-install

    bootctl install

    printf '%s\n' "❯ adding entries to systemd-boot"
    mkdir -p /boot/loader/entries/

    if [ "$windowsDrive" -ne '' ]; then
        cat > /boot/loader/entries/windows.conf <<EOF
title Windows
efi /EFI/Microsoft/Boot/BOOTMGFW.EFI
options "root=$(blkid $windowsBoot -o export | grep ^UUID=)"
EOF
    fi

    for i in $(find /boot/initramfs-* | sed 's|/boot/initramfs-||'); do
        entry="/boot/loader/entries/linux-$i.conf"
        cat > $entry <<EOF
title Gentoo Linux $i
linux /vmlinuz-$i
initrd /initramfs-$i
options $param
EOF
        if [ -f /boot/intel-ucode.img ]; then
            sed -i "s|vmlinuz-$i|vmlinuz-$i\ninitrd /intel-ucode.img|" $entry
        fi
        if [ -f /boot/amd-ucode.img ]; then
            sed -i "s|vmlinuz-$i|vmlinuz-$i\ninitrd /amd-ucode.img|" $entry
        fi
    done

    if [ -f /boot/fwupd/fwupdx64.efi ]; then
        printf '%s\n' "❯ adding fwupd to systemd-boot"
        cat > /boot/loader/entries/fwupd.conf <<EOF
title firmware-update
efi /fwupd/fwupdx64.efi
EOF
    fi

    if [ -f /boot/ZFSBootMenu/zfsbootmenu.efi ]; then
        printf '%s\n' "❯ addding ZFSBootMenu to systemd-boot"
        cat > /boot/loader/entried/ZFSBootMenu.conf <<EOF
title ZFSBootMenu
efi /boot/ZFSBootMenu/bootx64.efi
EOF
    fi

    if [ -f /boot/loader/entries/gentooLinux.conf ]; then
        default='gentooLinux.conf'
    fi
    cat >> /boot/loader/loader.conf <<EOF
default $default
timeout 1
console-mode auto
EOF

}

custom_commands() {

    printf '%s\n' "❯ downloading setup script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/setup'
    curl -so /usr/local/bin/setup $url
    chmod 0711 /usr/local/bin/setup

    printf '%s\n' "❯ downloading disk script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/disk.sh'
    curl -so /usr/bin/disk $url
    chmod 0711 /usr/bin/disk

    printf '%s\n' "❯ downloading shell script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/shell.sh'
    curl -so /etc/profile.d/shell.sh $url

    cat > /etc/profile.d/commands.sh <<EOF
search() {
    emerge -s
}
install() {
    doas emerge
}
remove() {
    doas emerge --depclean
}
disk() {
    lsblk -o name,type,mountpoints,size,fsused,fsuse%,uuid,model
}
clean() {
    printf '%s\n' "❯ cleaning old kernel"
    emerge --prune sys-kernel/gentoo-kernel sys-kernel/gentoo-kernel-bin
    printf '%s\n' "❯ cleaning tmp"
    doas rm -rf /tmp/*
    doas rm -rf /var/tmp/*
    printf '%s\n' "❯ cleaning logs"
    doas rm -f /var/log/*
    printf '%s\n' "❯ cleaning files"
    doas find / ! -path './proc/*' -type f -iname 'readme' -o -iname 'readme.txt' -o -iname '*.md' -o -iname '*.rst' -o -iname 'license' -o -iname 'license.txt' -o -iname '*.license' -o -iname '*.docbook' -exec rm -f {} \;
    if [ ~/.*_history ]; then
        sort -u -o ~/.*_history ~/.*_history
    fi
}
EOF

    if [ -f /usr/bin/yt-dlp ]; then
    cat >> /etc/profile.d/commands.sh <<EOF
youtube() {
    yt-dlp -o '~/%(title)s.%(ext)s' -f 'bv[vcodec~="^((he|a)vc|h26[45])"][height<=1080][fps<=60]+ba' --merge-output-format mp4 --downloader ffmpeg --external-downloader ffmpeg --external-downloader-args ffmpeg:'-ss 00:00:00 -to 03:00:00'
}
EOF
    fi

    cat >> /etc/profile.d/commands.sh <<EOF
update() {
    if curl -so /dev/null gentooLinux.org; then
        printf '%s\n' "❯ updating gentooLinux"
        doas emerge -g --update --deep --changed-use @world
        if [ -f /usr/bin/fwupdmgr ]; then
            doas fwupdmgr get-devices
            doas fwupdmgr refresh
            doas fwupdmgr get-updates
            doas fwupdmgr update
        fi
        if [ -f /opt/google/chrome/chrome ]; then
            update-google-chrome
        fi
        if [ -f /etc/profile.d/zfs.sh ]; then
            update-zfs
        fi
EOF

    if [ -f /etc/profile.d/fwupd.sh ]; then
        cat >> /etc/profile.d/commands.sh <<EOF
        if [ -f /etc/profile.d/fwupd.sh ]; then
            update-firmware
        fi
EOF
    fi

    cat >> /etc/profile.d/commands.sh <<EOF
    fi
}
EOF

    sed -i 's|step=.*|step=12|' list

}

finish() {

    printf '%s\n' "❯ fixing /etc/profile.d/*.sh"
    sed -i 's|\r||g' /etc/profile.d/*.sh

    printf '%s\n' "❯ cleaning files"
    rm -rf /var/tmp/*
    find / ! -prune -type f -iname 'readme' -o -iname 'readme.txt' -o -iname '*.md' -o -iname 'license' -o -iname 'license.txt' -o -iname '*.license' -o -iname '*.docbook' -o -iname 'authors' -o -iname 'copying' -exec rm {} \;

    printf '%s\n' "❯ installation is completed"

    sed -i 's|step=.*|step=13|' list

}

unmount() {

    printf '%s\n' "❯ un-mounting /mnt/gentoo/*"
    for d in '/mnt/gentoo/run' \
             '/mnt/gentoo/sys' \
             '/mnt/gentoo/dev' \
             '/mnt/gentoo/proc' \
             '/mnt/gentoo/boot'; do
        if df -Th | grep -q $d; then
            umount $d
        fi
    done

    printf '%s\n' "❯ cleaning /root/"
    rm -rf /mnt/gentoo/root/*
    rm setup.sh

    if df -Th | grep -q '/mnt/gentoo'; then
        printf '%s\n' "❯ un-mounting /mnt/gentoo/"
        umount -R /mnt/gentoo
    fi

    if df -Th | grep -q zfs; then
        printf '%s\n' "❯ exporting ZFS pool"
        zpool export -a
    fi

    sed -i 's|step=.*|step=14|' list

    exit

}

set -e

if [ ! -f /usr/local/bin/setup ]; then

    printf '%s\n' "❯ downloading setup script"
    url='https://raw.githubusercontent.com/0free/GentooLinux/systemd/setup'
    curl -so /usr/local/bin/setup $url
    chmod 0711 /usr/local/bin/setup

fi

if [ -f /mnt/gentoo/list ]; then

    change_root

else

    if [ -f list ]; then

        drive=$(. list; printf '%s' $drive)
        filesystem=$(. list; printf '%s' $filesystem)
        bootDrive=$(. list; printf '%s' $bootDrive)
        swapDrive=$(. list; printf '%s' $swapDrive)
        rootDrive=$(. list; printf '%s' $rootDrive)
        recoveryDrive=$(. list; printf '%s' $recoveryDrive)
        windowsDrive=$(. list; printf '%s' $windowsDrive)
        windowsBoot=$(. list; printf '%s' $windowsBoot)
        user=$(. list; printf '%s' $user)
        password=$(. list; printf '%s' $password)
        H="/home/$user"

        if grep -q 'step=' list; then

            if [ $(. list; printf '%s' $step) = 14 ]; then
                reboot
            fi

            if [ $(. list; printf '%s' $step) = 13 ]; then
                unmount
            fi

            while true; do

                case $(. list; printf '%s' $step) in

                    '0') set_fstab;;
                    '1') configure_gentoo;;
                    '2') install_linux;;
                    '3') install_pkg;;
                    '4') disable_root;;
                    '5') create_user;;
                    '6') enable_services;;
                    '7') setup_desktop;;
                    '8') add_scripts;;
                    '9') make_initramfs;;
                    '10') setup_bootloader;;
                    '11') custom_commands;;
                    '12') finish;;
                    *) break;;

                esac

            done

        else

            if df -Th | grep -q '/mnt/gentoo'; then

                install_base
                change_root

            fi
        fi

    else

        clear
        init_drive
        init_system
        init_user
        setup_drive

    fi

fi

#end