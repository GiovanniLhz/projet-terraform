# Configuration globale de Terraform
terraform {
  required_providers {
    docker = {
      # Source officielle du provider Docker
      source  = "kreuzwerker/docker"
      # Version compatible avec l'API Docker de la VM
      version = "2.25.0"
    }
  }
}

# Initialisation du provider Docker (utilise /var/run/docker.sock)
provider "docker" {}

# Image Nginx à télécharger
resource "docker_image" "nginx" {
  # Nom de l'image sur Docker Hub
  name         = "nginx:alpine"
  # Supprime l'image du disque lors d'un 'terraform destroy'
  keep_locally = false
}

# Conteneur Nginx à lancer
resource "docker_container" "nginx_web" {
  # Récupère l'ID de l'image Nginx ci-dessus
  image = docker_image.nginx.image_id
  # Nom du conteneur dans 'docker ps'
  name  = "mon-serveur-terraform"

  # Redirection de port (8081 sur la VM -> 80 dans le conteneur)
  ports {
    internal = 80
    external = 8082
  }
}
