# deploy
Ansible Tasks to deploy Arch Linux.

## Usage
This will automatically run the playbook called `local.yml` in the given repository.
```
sudo ansible-pull -U https://github.com/hertg/deploy
```

## Local
Execute the playbook locally.
```
sudo ansible-playbook -c local -i localhost, local.yml
```

## Custom Roles
### Install with paru (AUR)
```yml
- name: install from aur
  import_role:
    name: paru
  vars:
    force_update: yes # optional -> default: no
    package:
      - nerd-fonts-hack
      - ttf-apple-emoji
```

### Install from git
```yml
- name: install from git repo and run 'makepkg ...'
  import_role:
    name: install-from-git
  vars:
    dir_name: steelseries-arctis-pro-wireless
    git_url: https://github.com/hertg/steelseries-arctis-pro-wireless
```

## Todo
- Teamviewer: install from AUR, enable teamviewerd
- KVM / VirtManager (usermod -aG libvirt <user>)

<details>
<summary>Installation based on <a href="https://wiki.archlinux.org/title/installation_guide#Installation">Arch Installation Guide</a></summary>
 
```sh
loadkeys de_CH-latin1 # load swiss keymap
iwctl # connect to wifi: https://wiki.archlinux.org/title/Iwd#iwctl
timedatectl set-ntp true
fdisk -l # list disks
fdisk /dev/<disk> # create partition-table and partitions (1G EFI | 1G Boot | *G LVM)

mkfs.fat -F 32 <efi>
mkfs.ext4 <boot>
cryptsetup -c aes-xts-plain64 -h sha512 -s 512 --use-random luksFormat /dev/{lvm}
cryptsetup luksOpen /dev/{lvm} crypt
pvcreate /dev/mapper/crypt
vgcreate vg0 /dev/mapper/crypt
lvcreate -n swap -L +<size> vg0
lvcreate -n root -L +<size> vg0
lvcreate -n home -L +<size> vg0

mkswap /dev/mapper/vg0-swap
mkfs.ext4 /dev/mapper/vg0-root
mkfs.ext4 /dev/mapper/vg0-home

mount /dev/mapper/vg0-root /mnt
swapon /dev/mapper/vg0-swap
mkdir /mnt/home
mount /dev/mapper/vg0-home /mnt/home
mkdir /mnt/boot
mount /dev/{boot} /mnt/boot
mkdir /mnt/boot/efi
mount /dev/{efi} /mnt/boot/efi

pacman -Sy

pacstrap /mnt base base-devel grub efibootmgr linux linux-headers linux-firmware vim lvm2 git ansible iwd networkmanager
genfstab -U /mnt >> /mnt/etc/fstab

# Enter the new system
arch-chroot /mnt /bin/bash

# Configure System Clock
timedatectl set-ntp true
ln -s /usr/share/zoneinfo/UTC /etc/localtime
hwclock --systohc --utc

# Assign Hostname
echo <hostname> > /etc/hostname

# Generate locales
vim /etc/locale.gen # uncomment desired line
vim /etc/locale.conf # set LANG=en_US.UTF-8
locale-gen

# Set root password
passwd

# Create your user
useradd -m -G wheel -s /bin/bash <user>
passwd <user>

# Configure mkinitcpio
vim /etc/mkinitcpio.conf # HOOKS=(base udev autodetect modconf block keymap encrypt lvm2 filesystems keyboard fsck)

# Generate initramdisk
mkinitcpio -p linux

# Install GRUB
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
# alternatively: 
# grub-install --target=i386-pc /dev/<disk>

# Configure GRUB
vim /etc/default/grub # GRUB_CMDLINE_LINUX="cryptdevice=/dev/{lvm}:crypt"

# Generate Grub Configuration
grub-mkconfig -o /boot/grub/grub.cfg

# Exit new system
exit

# Unmount all partitions
umount -R /mnt
swapoff -a

# Reboot
reboot
```

</details>
