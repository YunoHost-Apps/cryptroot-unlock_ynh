# __APP__ installed

Congrats, the app __APP__ is installed!

You may reboot and try to unlock your partitions by running the following command
using a remote machine and an authorized key:

```bash
# Needs to be adapted to point to your SSH private key.
# You may skip that part and the `-I "$SSH_KEY_PATH"` option
# below if that's your default identity
SSH_KEY_PATH=/PATH/TO/YOUR/.ssh/KEY

ssh -p __PORT__ -I "$SSH_KEY_PATH" root@__IP__ "cryptroot-unlock"
```

## Pro-tip

You may add an alias on your machines you have allowed to unlock your partitions.
This makes easier to then connect to SSH on the server during the boot:

```
Host ynh-boot
    User root
    Port __PORT__
    Hostname __IP__
    RemoteCommand cryptroot-unlock

    # Optional. Required only if that's not your default key.
    # ⚠️ The below path needs to be adapted
    IdentityFile /PATH/TO/YOUR/.ssh/KEY
```

Then unlock your partitions at startup simply by running:

```bash
ssh ynh-boot
```

And enter your passphrase when prompted.
