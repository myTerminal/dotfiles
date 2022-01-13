# Arch installation (pacstrap)

## Pre-installation setup

### Connecting to a wireless network

1. Start `iwctl`
2. List devices with `device list`
3. Scan for networks with `station <device-name> scan`
4. List the available networks with `station <device-name> get-networks`
4. Connect to a network with `station <device-name> connect <network-name>` and enter a password.

Verify internet connectivity with `ip a`.

### Setting up time

    timedatectl set-ntp true
    timedatectl status

## Partitions - Part 1

### Creating partitions

Perform partitioning with `cfdisk` and verify with `lsblk` before proceeding.

### Preparing partitions

Format the first partition as EFI (boot)

    mkfs.fat -F32 /dev/nvme0n1p1

Create a swap

    mkswap /dev/nvme0n1p2

Prepare the main encrypted partition

    cryptsetup -y -v luksFormat /dev/nvme0n1p3

Respond with a "YES" and enter a passphrase twice.

Open the main partition with a name "enc"

    cryptsetup open /dev/nvme0n1p3 enc
    <passphrase>

Format the main partition as btrfs

    mkfs.btrfs /dev/mapper/enc

## Partitions - Part 2

### Creating BTRFS subvolumes

Mount main partition temporarily

    mount /dev/mapper/enc /mnt

Create subvolumes for root, home, var and snapshots

    btrfs su cr /mnt/@
    btrfs su cr /mnt/@home
    btrfs su cr /mnt/@var
    btrfs su cr /mnt/@snapshots
    
Unmount the partition

    umount /mnt
    
### Re-mounting subvolumes as partitions

    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@ /dev/mapper/enc /mnt
    mkdir -p /mnt/{boot,home,var,.snapshots}
    mount /dev/nvme0n1p1 /mnt/boot
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@home /dev/mapper/enc /mnt/home
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@var /dev/mapper/enc /mnt/var
    mount -o noatime,nodiratime,compress=lzo,space_cache,subvol=@snapshots /dev/mapper/enc /mnt/.snapshots
    swapon /dev/nvme0n1p2

## Base installation

### Bootstrapping a base-system

    pacstrap /mnt base base-devel linux linux-firmware linux-headers vim git wget intel-ucode archlinux-keyring polkit

### Generating file-system table

    genfstab -U /mnt >> /mnt/etc/fstab

### Logging into the new system

    arch-chroot /mnt

## Configuration

### Setting up `pacman`

Enable `multilib` repository for pacman by uncommenting `[multilib]` section in `/etc/pacman.conf` and then update pacman database with `pacman -Syu`.

### Setting timezone

    ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
    hwclock --systohc

### Setting locale

Uncommenting `en_US.UTF-8` from `/etc/locale.gen` and then generate the selected locale(s)

    locale-gen
    echo "LANG=en_US.UTF-8" > /etc/locale.conf

### Setting `HOSTNAME`

    echo "excelsior" > /etc/hostname

### Configuring hosts files

Place below content in the file `/etc/hosts`

    127.0.0.1    localhost
    ::1          localhost
    127.0.1.1    excelsior.localdomain excelsior

### Installing network-related packages

    pacman -S dhcpcd networkmanager network-manager-applet wireless_tools wpa_supplicant dialog --noconfirm

## Creating users and groups

### Setting root password

    passwd

### Creating a non-root user

Create user

    useradd ismail -m -c "Mohammed Ismail Ansari"

Set password for user

    passwd ismail

Add user to wheel (and other) group(s)

    usermod -aG wheel,audio,video,optical,storage ismail

Configure sudo for 'wheel' group

    visudo

## Installing a few packages

Install grub and company

    pacman -S grub efibootmgr btrfs-progs os-prober ntfs-3g mtools dosfstools

## Setting up bootloader

### Setting up encryption parameters

Add hook for encryption

    vim /etc/mkinitcpi.conf

Add "encrypt" after "block" under `HOOKS`.
    
Init mkinitcpio

    mkinitcpio -p linux

Use `blkid` to get the `UUID` of the encrypted partition

Make GRUB aware of the encrypted partition

    vim /etc/default/grub

Enter the following kernel parameters under `GRUB_CMDLINE_LINUX`: "cryptdevice=UUID=[uuid-of-encrypted-partition]>:enc root=/dev/mapper/enc"

To enable `os-prober` (could be temporary), add the following

    GRUB_DISABLE_OS_PROBER=FALSE

### Running a `grub-install`

    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH

### Generating GRUB config

    grub-mkconfig -o /boot/grub/grub.cfg

## Ending with a clean up

Exit chroot

    exit

Unmount all mounted partitions

    umount -a

Reboot

    reboot now

## Post installation

### Enabling network-related services

    systemctl enable dhcpcd
    systemctl enable NetworkManager
