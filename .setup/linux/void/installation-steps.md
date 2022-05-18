# Void Linux installation (XBPS method)

## Pre-installation setup

### Switching to root

    su -s /bin/bash

### Connecting to a network

    nmtui

### Updating the host system

Update `xbps` itself

    xbps-install -Su xbps

Update all packages

    xbps-install -u

> In case of errors about expired certificates, use the following before the command to set an environment variable: SSL_NO_VERIFY_PEER=true

## Partitions - Part 1

### Creating partitions

Perform partitioning with `cfdisk` and verify with `lsblk` before proceeding.

### Preparing partitions

Format the first partition as EFI

    mkfs.fat -F32 /dev/nvme0n1p1

Create a swap partition

    mkswap /dev/nvme0n1p2

Prepare the main encrypted partition

    cryptsetup -y -v luksFormat --type luks1 /dev/nvme0n1p3

Respond with a "YES" and enter a passphrase twice.

Open the main partition with the name "mirage"

    cryptsetup open /dev/nvme0n1p3 mirage
    <passphrase>

Format the main partition as `btrfs`

    mkfs.btrfs /dev/mapper/mirage

## Partitions - Part 2

### Creating BTRFS subvolumes

Mount main partition temporarily

    mount /dev/mapper/mirage /mnt

Create subvolumes for root, home, var and snapshots

    btrfs su cr /mnt/@
    btrfs su cr /mnt/@home
    btrfs su cr /mnt/@var
    btrfs su cr /mnt/@snapshots
    
Unmount the partition

    umount /mnt
    
### Re-mounting subvolumes as partitions

    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@ /dev/mapper/mirage /mnt
    mkdir -p /mnt/{boot,home,var,.snapshots}
    mkdir /mnt/boot/efi
    mount /dev/nvme0n1p1 /mnt/boot/efi
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@home /dev/mapper/mirage /mnt/home
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@var /dev/mapper/mirage /mnt/var
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@snapshots /dev/mapper/mirage /mnt/.snapshots
    swapon /dev/nvme0n1p2

## Base installation

### Setting `REPO` and `ARCH`

    REPO=https://alpha.de.repo.voidlinux.org/current
    ARCH=x86_64

### Bootstrapping a base-system

    XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" base-system elogind polkit dbus chrony grub-x86_64-efi efibootmgr btrfs-progs ntfs-3g mtools dosfstools cryptsetup vim git wget

### Mounting the pseudo-filesystems for chroot

    mount --rbind /sys /mnt/sys && mount --make-rslave /mnt/sys
    mount --rbind /dev /mnt/dev && mount --make-rslave /mnt/dev
    mount --rbind /proc /mnt/proc && mount --make-rslave /mnt/proc

### Copying the DNS configuration to the new system

    cp /etc/resolv.conf /mnt/etc

### Rooting into the new system

    chroot /mnt /bin/bash

## Configuration

### Setting the timezone

    ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

### Selecting locale

Uncomment the desired locales in `/etc/default/libc-locales`

    vim /etc/default/libc-locales

Generate locales

    xbps-reconfigure -f glibc-locales

### Setting `HOSTNAME`

    echo "excelsior" > /etc/hostname

### Configuring hosts file

Place below content in the file `/etc/hosts`

    127.0.0.1    localhost
    ::1          localhost
    127.0.1.1    excelsior.localdomain excelsior

### Installing network-related packages

    xbps-install -Sy NetworkManager

## Creating users and groups

### Setting root password

    passwd

### Creating a non-root user

Create user

    useradd ismail -m -c "Mohammed Ismail Ansari" -s /bin/bash

Set password for user

    passwd ismail

Add user to wheel group

    usermod -aG wheel,audio,video,optical,storage ismail

Configure sudo for 'wheel' group

    visudo

## Filesystem

### Creating `/etc/fstab`

Copy the file `/proc/mounts` as the starting point for `/etc/fstab` (or append it to save some time)

    cat /proc/mounts >> /etc/fstab

Remove unnecessary lines, replace references with their respective UUIDs and change the last zero for `/` and everything else as "1" and "2" respectively. Note that BTRFS subvolumes may need to have the last column as "0".

Add an entry for `/tmp`

    tmpfs    /tmp    tmpfs    defaults,nosuid,nodev    0 0

Add an entry for SWAP

    UUID=[....]    swap     swap    rw,noatime,discard    0 0

## Setting up bootloader

### Setting up encryption parameters for boot

Create a key

    dd bs=1 count=64 if=/dev/urandom of=/boot/volume.key

Add the key for the encrypted volume

    cryptsetup luksAddKey /dev/nvme0n1p3 /boot/volume.key

Restrict access to the key (and `/boot`)

    chmod 000 /boot/volume.key
    chmod -R g-rwx,o-rwx /boot

Use `blkid` to get the `UUID` of the encrypted partition

Create an entry in the `/etc/crypttab` file

    mirage <tab> UUID=[uuid-of-encrypted-partition] <tab> /boot/volume.key <tab> luks

Make GRUB aware of the encrypted partition

    vim /etc/default/grub

Set `GRUB_CMDLINE_LINUX` = "rd.luks=1 rd.luks.uuid=[UUID-of-encrypted-partition] root=/dev/mapper/mirage rootflags=subvol=@"

Also, set `GRUB_ENABLE_CRYPTODISK=y` to allow us to install GRUB on an encrytped boot.

To enable `os-prober` (could be temporary), add the following

    GRUB_DISABLE_OS_PROBER=FALSE

Add an entry in `/etc/dracut.conf.d/10-crypt.conf

    install_items+=" /boot/volume.key /etc/crypttab "

### Running a `grub-install`

    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=VOID

### Generating GRUB config

    update-grub

### Update `initramfs`

    xbps-reconfigure -fa

## End with a clean up

Exit chroot

    exit

Unmount all mounted partitions

    umount -a

Reboot

    reboot now

## Post installation

### Enabling RTC service

    ln -s /etc/sv/chronyd /var/service/

### Enabling network-related services

    ln -s /etc/sv/{dhcpcd,NetworkManager} /var/service/

### Enabling services for seat

    ln -srf /etc/sv/{dbus,polkitd,elogind} /var/service
