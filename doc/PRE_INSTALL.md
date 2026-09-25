### Foreword

You're about to install a Yunohost app to let you unlock your encrypted
partitions using SSH.

**⚠️IMPORTANT**: This package will not encrypt your partitions, for you. You
are expected to have installed Yunohost on an encrypted LVM partition.

When you select a network interface, this package will also deduce the IP,
mask, gateway, as set during the installation and reuse them during the boot.
You may check the values in the config panel after the installation and change
them if necessary.

Make sure to set at least one valid SSH key (by reusing a key of a selected user
and/or by manually specifying it) during the install questions or
the install will be cancelled so that you are not locked out of your server at 
next reboot.

### Disclaimer of warranty

This package applies some changes on how your server boots.

It is provided without any warranty, as stated in its LICENSE.
The author and contributors disclaim all responsibility for any issues that
may arise after installation, despite efforts to ensure reliability.

**You are responsible for controlling what the package does on your server.**

You are recommended to make backup of your server and copy them elsewhere
(which is a good practice in any case).

You are invited to open issues on Github if you encounter problems.
