# cryptroot-unlock

## Foreword

You're about to install a Yunohost app to let you unlock your encrypted partitions using SSH.

**⚠️IMPORTANT**: This package will not encrypt your partitions, for you. You are expected to have installed Yunohost on an encrypted LVM partition.

Under the hood, the package takes installs the debian package named `dropbear-initramfs` and configures it as seamlessly as possible.

You are invited to select a user's authorized keys to import them for the unlock, or to paste the authorized keys during the installation process.

This package will also detect the IP, mask, gateway, ... of the given network interface. You may check the values in the config panel after the installation and change them if necessary.

## Disclaimer of warranty

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
