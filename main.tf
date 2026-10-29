# Configuration globale de Terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" # Source officielle HashiCorp
      version = "2.25.0"             # Version du provider (plugin)
    }
  }
}

# Connexion au Daemon Docker local via le socket Unix
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Téléchargement de l'image Nginx (version alpine, ultra légère) depuis le Docker Hub
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = false # Supprime l'image lors d'un terraform destroy
}

# Déploiement et configuration du conteneur
resource "docker_container" "nginx_web" {
  name  = "mon_serveur_terraform"  # Nom visible via "docker ps"
  image = docker_image.nginx.image_id # Référence l'image définie ci-dessus

  ports {
    internal = 80   # Port interne du conteneur (Nginx)
    external = 8082 # Port externe sur la VM (redirection)
  }
}
