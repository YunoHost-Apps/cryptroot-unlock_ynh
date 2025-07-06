# cryptroot-unlock

This package allows you to unlock your encrypted partitions when booting your server.

**⚠️IMPORTANT**: This package will not encrypt your partitions,
for you. You are expected to have installed Yunohost on an encrypted LVM partition.

Under the hood, the package installs the Debian package named
`dropbear-initramfs` and configures it as seamlessly as possible.
