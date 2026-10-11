# Automatisation d'un conteneur Nginx avec Terraform

Ce projet utilise Terraform pour déployer un conteneur Nginx sur une VM Ubuntu Server, avec le provider Docker. Au lieu de lancer les commandes Docker une par une, je décris l'infrastructure dans un fichier `main.tf` et Terraform s'occupe du reste. C'est la quatrième étape de mon projet évolutif. Le détail de ma démarche est dans [JOURNAL.md](JOURNAL.md).

## Objectif

Télécharger l'image Nginx et lancer un conteneur qui répond sur le port 8080 de la VM, en passant uniquement par Terraform.

## Fichiers

- `main.tf` : décrit le provider Docker, l'image Nginx et le conteneur
- `.gitignore` : exclut les fichiers d'état locaux de Terraform (`.terraform/`, `*.tfstate*`)
- `JOURNAL.md` : mon journal de bord

## Environnement

- Terraform sur une VM Ubuntu Server (192.168.56.101)
- Docker installé sur la même VM, avec le provider `kreuzwerker/docker` en version 2.25.0

## Lancer le projet

Initialiser le répertoire de travail (télécharge le provider) :

```bash
terraform init
```

Voir le plan d'exécution avant de l'appliquer :

```bash
terraform plan
```

Déployer le conteneur :

```bash
terraform apply -auto-approve
```

Vérifier que le conteneur tourne :

```bash
docker ps
```

Tester le résultat :

```bash
curl http://localhost:8080
```

## Notes

Les fichiers d'état (`terraform.tfstate`) ne sont pas versionnés, ils restent en local. Pour réutiliser le projet, adapte l'adresse IP et les ports si besoin.
