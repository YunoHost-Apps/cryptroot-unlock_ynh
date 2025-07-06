# cryptroot-unlock

Ce paquet vous permet de déverrouiller vos partitions chiffrées quand vous 
démarrez votre serveur.

**⚠️IMPORTANT**: Ce paquet ne chiffrera pas les partitions pour vous.
Yunohost est supposé être installé sur une partition LVM chiffrée.

Sous le capot, il vous installe le paquet Debian appelé `dropbear-initramfs`
et le configure de la manière la plus transparente possible.
