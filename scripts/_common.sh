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
IP=$ip::$gateway:$mask::$iface
#---END CRYPTROOT_UNLOCK_YNH
EOF
}

add_dropbear_options() {
    sed -i '/^DROPBEAR_OPTIONS=/d' "$DROPBEAR_INITRAMFS_DIR/dropbear.conf" || true
    echo "DROPBEAR_OPTIONS=\"-p $port -s -j -k -I 180 -c cryptroot-unlock\"" >> "$DROPBEAR_INITRAMFS_DIR/dropbear.conf"
}

# Credits:
# https://gist.github.com/kwilczynski/5d37e1cced7e76c7c9ccfdf875ba6c5b
cidr_to_netmask() {
    value=$(( 0xffffffff ^ ((1 << (32 - $1)) - 1) ))
    echo "$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"
}

_validate_ssh_key() {
    local key="$1"
    if ssh-keygen -lf - <<< "$key" &>/dev/null; then
        ynh_print_info "Valid SSH key: $key"
        return 0
    else
        ynh_print_warn "Invalid SSH key: $key"
        return 1
    fi
}

validate_authorized_keys() {
    local valid_keys=0
    while IFS= read -r line; do
        # Remove comments
        local cleaned_up_line="${line/\#*/}"
        # Skip empty lines or lines containing only whitespaces
        [[ "$cleaned_up_line" =~ ^[[::space:]]*$ ]] && continue
        _validate_ssh_key "$cleaned_up_line" && ((valid_keys++))
    done
    if [ "$valid_keys" -ge 1 ]; then
        return 0
    else
        return 1
    fi
}
