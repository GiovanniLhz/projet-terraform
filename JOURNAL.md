# Journal de Bord Projet Évolutif Sciensano

## Session 4 : Automatisation d'Infrastructure avec Terraform

### 1. Ingestion & Architecture Terraform
* Initialisation et prise en main de Terraform sur l'environnement Ubuntu Server (`192.168.56.101`).
* Utilisation du provider Docker pour gérer l'infrastructure de conteneurs de manière déclarative.
* Structuration du code Terraform via le fichier principal `main.tf`.

### 2. Rédaction du Fichier de Configuration (`main.tf`)
* **Provider & Docker Image :**
  * Configuration du provider `kreuzwerker/docker`.
  * Téléchargement automatique de l'image officielle Nginx (`nginx:latest`).
* **Ressource Conteneur :**
  * Création du conteneur nommé `mon-site-nginx`.
  * Mappage des ports : exposition externe du port `8080` redirigeant vers le port `80` du conteneur.

### 3. Execution & Automatisation CLI
* Initialisation du répertoire de travail via `terraform init`.
* Validation du plan d'exécution avec `terraform plan`.
* Déploiement effectif du conteneur web via `terraform apply -auto-approve`.

### 4. Gestion de Version & Publication GitHub
* Configuration du fichier `.gitignore` pour exclure les fichiers d'état locaux (`.terraform/`, `*.tfstate*`).
* Initialisation du dépôt Git local, création des commits et branche `main`.
* Configuration de l'authentification SSH sécurisée avec GitHub.
* Publication du projet sur le dépôt distant (`projet-terraform`).

### 5. Validation & Contrôle Qualité
* Vérification du statut du conteneur via `docker ps`.
* Validation de l'accès au service web via `curl http://localhost:8080` et depuis le navigateur hôte.
