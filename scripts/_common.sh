#!/bin/bash

INITRAMFS_CONF=/etc/initramfs-tools/initramfs.conf
DROPBEAR_INITRAMFS_DIR=/etc/dropbear/initramfs

unconfigure_initramfs() {
    sed -i  '/^#---BEGIN CRYPTROOT_UNLOCK_YNH/,/^#---END CRYPTROOT_UNLOCK_YNH/d' "$INITRAMFS_CONF" || true
}

configure_initramfs() {
    unconfigure_initramfs # Remove previous configuration beforehand

    cat <<EOF >> "$INITRAMFS_CONF"
#---BEGIN CRYPTROOT_UNLOCK_YNH
BUSYBOX=y
DROPBEAR=y
IP=$ip:$gateway:$mask::$iface
#---END CRYPTROOT_UNLOCK_YNH
EOF
}

add_dropbear_options() {
    sed -i '/^DROPBEAR_OPTIONS=/d' "$DROPBEAR_INITRAMFS_DIR/dropbear.conf" || true
    echo "DROPBEAR_OPTIONS=\"-p $port -s -j -k -I 60\"" >> "$DROPBEAR_INITRAMFS_DIR/dropbear.conf"
}

# Credits:
# https://gist.github.com/kwilczynski/5d37e1cced7e76c7c9ccfdf875ba6c5b
cidr_to_netmask() {
    value=$(( 0xffffffff ^ ((1 << (32 - $1)) - 1) ))
    echo "$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"
}
