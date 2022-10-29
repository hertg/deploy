# deploy

## Requirements
**Ansible**
```shell
sudo pacman -S ansible
```

## Usage

To run the ansible script locally, after cloning the repository:
```shell
make local
```

To run the ansible script from Github directly:
```shell
make remote
```

## Options
The following options can be configured as host variables. They can also be omitted.

```yaml
desktop: minimal    # minimal, gnome, xfce

# wm/dm only apply on 'minimal'
wm: leftwm          # leftwm
dm: lightdm         # lightdm, ly

gpu: amd            # amd, nvidia, intel

bluetooth: yes
thunderbolt: yes
touchpad: yes
```

## Software
Optional software is not installed automatically, it has to be specified via host variables. 

*Example*
```yaml
docker: yes
kvm: yes
```

### List of available software
- [ ] android
- [ ] brave
- [ ] dbeaver
- [ ] discord
- [ ] docker
- [ ] firefox
- [ ] intellij
- [ ] jdk
- [ ] kvm
- [ ] masterpdfeditor
- [ ] netextender
- [ ] nodejs
- [ ] obs
- [ ] odbc
- [ ] remmina
- [ ] sbt
- [ ] spotify
- [ ] steam
- [ ] vscode
- [ ] wompiler

## Todo
- 1Password / Bitwarden
- Firefox Configuration + Extensions / Librewolf
- X.org config for monitor
- Arandr / Autorandr
- Thunar (File Manager)
- `ntfs-3g` to mount Windows NTFS drives
- Udiskie (Automount storage devices)
- Configure KVM/QEMU (image locations, access rights, ...)
- Set user password (always manually)
- Set up SSH key (always manually)
- CUPS / Printing + Permissions (https://unix.stackexchange.com/a/392629/351554) + `system-config-printer`?
  ```
  hp-setup -i <printer-ip>
  sudo chown root:root /usr/lib/cups/backend/
  ```
- boltctl + manual device authorization
- st
- polybar for multi-monitor
- enable + start `docker.service`
- dbeaver configuration: AllowPublicKeyRetrieval = true
- create sbt/gradle credential files (alwlays manually)
- docker-compose
- `gvfs-smb` (mount cifs share)
- golang
- postman
- adobe-base-14-fonts
- Yubikey Authenticator: `yubioath-desktop`
  `systemctl enable --now pcscd`
- Yubikey Personalization Tool `yubikey-personalization-gui`
- Yubikey Manager GUI `yubikey-manager-qt`
- SVN (RabbitVCS): `rabbitvcs rabbitvcs-thunar-git` (AUR)
- QR code reader: `zbar`
- zoiper
- `light-locker` (`light-locker-command -l`)
- timewarrior: `timew`
- taskwarrior: `task`
- ClamAV: `clamav`
- Lynis: `lynis`
- [Disable beep](https://bbs.archlinux.org/viewtopic.php?id=276754)
- checkupdates: `pacman-contrib`
- boot splashscreen: `plymouth` (AUR)
- flutter
	- `flutter` (AUR)
	- `android-studio` (AUR)

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

## Troubleshoot

### Invalid or corrupted package

**Symptom**\
invalid or corrupted package (PGP signature)

**Solution**
```shell
pacman-key --init
pacman-key --populate
```


### Base Installation
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

```sh
systemctl enable --now NetworkManager
nmtui
pacman -S inetutils # provides 'hostname' command
```
</details>
