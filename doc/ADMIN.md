# Using __APP__

You may add an alias on your machines you have allowed to unlock your partitions.
This makes easier to then connect to SSH on the server during the boot:

```
Host ynh-boot
    User root
    Port __PORT__
    Hostname __IP__

    # Optional. Required only if that's not your default key.
    # ⚠️ The below path needs to be adapted
    IdentityFile /PATH/TO/YOUR/.ssh/KEY
```

Once this is done, reboot your server and unlock your partitions at startup simply by running:

```bash
ssh ynh-boot
```

Then once logged in, run:
```
cryptroot-unlock
```

And enter your passphrase when prompted.
