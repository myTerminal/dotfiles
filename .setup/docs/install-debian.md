# Debian installation (debootstrap)

## Pre-installation setup

(empty)

## Partitions - Part 1

### Creating partitions

Perform partitioning with `cfdisk` and verify with `lsblk` before proceeding.

### Preparing partitions

Format the first partition as EFI (boot)

    mkfs.fat -F32 /dev/nvme0n1p1

Create a swap

    mkswap /dev/nvme0n1p2

Prepare the main encrypted partition

    cryptsetup -y -v luksFormat --type luks1 /dev/nvme0n1p3

Respond with a "YES" and enter a passphrase twice.

Open the main partition with a name "mirage"

    cryptsetup open /dev/nvme0n1p3 mirage
    <passphrase>

Format the main partition as btrfs

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

### Obtaining `debootstrap`

Depending on the running platform, obtain `debootstrap`.

On Debian: `apt install debootstrap`.

On Arch: `pacman -S debootstrap`.

### Bootstrapping a base-system

With all partitions mounted, run

    debootstrap --include linux-image-amd64,grub-efi,locales --arch amd64 bullseye /mnt

### Preparing the `chroot` environment

Copy the mounted file systems table

    cp /etc/mtab /mnt/etc/mtab

Bind the pseudo-filesystems for chroot

    mount -o bind /dev /mnt/dev
    mount -o bind /dev/pts /mnt/dev/pts
    mount -o bind /proc /mnt/proc
    mount -o bind /sys /mnt/sys

### Generating fstab

Install `arch-install-scripts`

    apt install arch-install-scripts

Run `genfstab`

    genfstab -U /mnt >> /mnt/etc/fstab

### Changing root to the new system

    chroot /mnt

## Configuration

### Setting up `apt` sources

Update `/etc/apt/sources.list` to contain the following:

    deb https://deb.debian.org/debian bullseye main contrib non-free
    deb https://security.debian.org/debian-security bullseye-security main contrib non-free
    deb https://deb.debian.org/debian bullseye-updates main contrib non-free

Update packages list

    apt update

### Installing core packages

    apt install firmware-linux firmware-linux-nonfree sudo vim git wget curl make

### Setting timezone

    dpkg-reconfigure tzdata

Choose an appropriate region.

### Setting locale

    dpkg-reconfigure locales

Choose `en_US.UTF-8` from the list of locales.

### Setting `HOSTNAME`

    echo "excelsior" > /etc/hostname

### Configuring hosts file

Place below content in the file `/etc/hosts`

    127.0.0.1    localhost
    ::1          localhost
    127.0.1.1    excelsior.localdomain excelsior

### Configuring network interfaces

Place the below content in `/etc/network/interfaces`

    auto lo
    iface lo inet loopback
    auto eth0
    iface eth0 inet dhcp

### Setting up network tools

Install a few network related packages

    apt install dhcpcd5 network-manager wireless-tools wpasupplicant dialog

## Creating users and groups

### Setting root password

    passwd

### Creating a non-root user

Create user

    useradd ismail -m -c "Mohammed Ismail Ansari" -s /bin/bash

Set password for user

    passwd ismail

Add user to sudo group

    usermod -aG sudo ismail

## Setting up bootloader

### Installing bootloader utils

    apt install os-prober

### Setting up encryption parameters

Use `blkid` to get the `UUID` of the encrypted partition

Create an entry in the `/etc/crypttab` file

    mirage <tab> UUID=[uuid-of-encrypted-partition] <tab> none <tab> luks

Make GRUB aware of the encrypted partition

    vim /etc/default/grub

Set `GRUB_CMDLINE_LINUX` = "cryptdevice=UUID=[uuid-of-encrypted-partition]:mirage root=/dev/mapper/mirage"

Also, set `GRUB_ENABLE_CRYPTODISK=y` to allow us to install GRUB on an encrytped boot.

### Running a `grub-install`

    grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=DEBIAN

### Generating GRUB config

    update-grub

### Update `initramfs`

    update-initramfs -u -k all

## Ending with a clean up

Exit chroot

    exit

Unmount all mounted partitions

    umount -a

Reboot

    reboot now

## Post installation

### Console setup

    dpkg-reconfigure console-setup

### Install wireless drivers

    apt install firmware-iwlwifi

### Enabling network-related services

    systemctl enable dhcpcd
    systemctl enable NetworkManager

### Connecting to the internet

Use `nmtui` for a text-based interface.
