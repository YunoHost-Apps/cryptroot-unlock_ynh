# Utiliser __APP__

Vous pouvez ajouter un alias sur vos machines pour
lesquels vous avez autorisé à déverrouiller vos partitions.

Cela vous facilitera à vous connecter ensuite à
votre server en SSH au moment du boot:

```
Host ynh-boot
    User root
    Port __PORT__
    Hostname __IP__
    RemoteCommand cryptroot-unlock

    # Optionnel. Nécessaire uniquement si ce n'est pas votre clé par défaut.
    # ⚠️ Le chemin ci-après doit être adapté
    IdentityFile /PATH/TO/YOUR/.ssh/KEY
```

Ensuite pour déverrouiller votre partition au démarrage, lancez simplement :

```bash
ssh ynh-boot
```

Et entrez votre mot de passe quand on vous le demande.
