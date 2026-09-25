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

    # Keep only the portion of the string before the second space character (skip email if it is there)
    local key_without_email=$(echo "$key" | cut -d' ' -f1-2)

    # Regex check (credits: https://github.com/nemchik/ssh-key-regex)
    if [[ "$key_without_email" =~ ^(ssh-dss AAAAB3NzaC1kc3|ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNT|ecdsa-sha2-nistp384 AAAAE2VjZHNhLXNoYTItbmlzdHAzOD|ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1Mj|sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb2|ssh-ed25519 AAAAC3NzaC1lZDI1NTE5|sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29t|ssh-rsa AAAAB3NzaC1yc2)[0-9A-Za-z+/]+[=]{0,3}(\s.*)?$ ]]; then
        ynh_print_info "Valid SSH key: $key_without_email"
        return 0
    else
        ynh_print_info "Invalid SSH key: $key_without_email"
        return 1
    fi
}

validate_authorized_keys() {
    while IFS= read -r line; do
        # Skip empty lines
        [[ -z "$line" ]] && continue
        _validate_ssh_key "$line"
    done
}
