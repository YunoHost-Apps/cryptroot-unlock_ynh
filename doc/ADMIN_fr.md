# Utiliser __APP__

Vous pouvez ajouter un alias sur vos machines pour
lesquels vous avez autorisé à déverrouiller vos partitions.

Cela vous facilitera à vous connecter ensuite à
votre serveur en SSH au moment du boot:

```
Host ynh-boot
    User root
    Port __PORT__
    Hostname __IP__

    # Optionnel. Nécessaire uniquement si ce n'est pas votre clé par défaut.
    # ⚠️ Le chemin ci-après doit être adapté
    IdentityFile /PATH/TO/YOUR/.ssh/KEY
```

Une fois cela fait, redémarrez votre serveur et déverrouillez
votre partition au démarrage, en lançant simplement :

```bash
ssh ynh-boot
```

Puis une fois authentifié/e, lancez:
```
cryptroot-unlock
```

Et entrez votre mot de passe quand on vous le demande.
