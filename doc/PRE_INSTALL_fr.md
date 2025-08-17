### Avant-propos

Vous êtes sur le point d'installer une app Yunohost pour vous permettre
de déverrouiller vos partitions chiffrées via SSH.

**⚠️IMPORTANT**: Ce paquet ne chiffrera pas vos partitions pour vous.
Vous êtes censé/es avoir installé Yunohost sur une partition LVM chiffrée.

Quand vous sélectionnez une interface réseau, le paquet va automatiquement
déduire l'IP, le masque et la passerelle utilisés durant l'installation et
les réutiliser durant le démarrage du système. Vous êtes invité/e à vérifier
leur valeur dans le panneau de configuration après l'installation et les modifier
si nécessaire.

### Dégagement de responsabilité

Ce paquet modifie la façon dont votre serveur démarre.

Il vous est proposé sans aucune garantie, comme précisé dans sa LICENSE.
Son auteur et ses contributeur/rices rejettent toute responsabilité en cas de souci
qui pourrait survenir après l'installation, en dépit des efforts pour s'assurer
de sa fiabilité.

**Vous êtes responsable de contrôler ce que fait le paquet sur votre serveur.**

Il vous est recommandé de créer des sauvegarde de votre serveur et de les
copier ailleurs (ce qui est une bonne pratique dans tous les cas).

Vous êtes invité/es à ouvrir un ticket (issue) sur Github si vous rencontrez
des soucis.
