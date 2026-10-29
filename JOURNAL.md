# Journal du  Projet Terraform 

## 1. Mise en route & Architecture Terraform
* **Environnement :** Prise en main de Terraform directement sur ma VM Ubuntu Server (`192.168.56.101`).
* **Logique IaC :** Utilisation de l'approche déclarative. Au lieu de lancer les commandes Docker à la main, je décris l'infrastructure voulue dans le fichier `main.tf` et Terraform s'occupe de l'appliquer.
* **Le traducteur :** Utilisation du provider Docker (`kreuzwerker/docker`) pour permettre à Terraform de dialoguer avec le Daemon Docker local.

## 2. Contenu du Fichier de Configuration (`main.tf`)
* **Bloc Provider & Moteur :** 
  * Initialisation du provider Terraform et téléchargement du plugin depuis le registre officiel HashiCorp (version `2.25.0`).
* **Ressource Image :** 
  * L'équivalent du `FROM` dans un Dockerfile : Terraform demande au Daemon Docker d'aller chercher et télécharger l'image `nginx:alpine` (choisie pour sa légèreté) sur le Docker Hub.
* **Ressource Conteneur :** 
  * Création du conteneur nommé `mon_serveur_terraform` basé sur l'image définie juste avant.
  * **Redirection des ports (`ports`) :** Configuration du mapping pour lier le port interne `80` (où écoute Nginx) vers un port externe accessible sur la machine.

## 3. Exécution & Commandes CLI
* `terraform init` : Initialise le répertoire et télécharge automatiquement le provider nécessaire.
* `terraform plan` : Affiche le plan d'exécution pour valider ce que Terraform s'apprête à faire avant de modifier quoi que ce soit.
* `terraform apply` : Lance le déploiement effectif de l'infrastructure sur le serveur.

## 4. Validation & Contrôle
* **Vérification du conteneur :** Utilisation de `docker ps` pour s'assurer que le conteneur tourne bien.
* **Test d'accès :** Vérification de la page web via le navigateur ou un `curl` sur l'IP et le port configurés.
