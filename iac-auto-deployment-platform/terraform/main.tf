############################################
# Terraform Configuration
############################################
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

############################################
# Provider Configuration
############################################
provider "docker" {}

############################################
# Docker Image
############################################
resource "docker_image" "app_image" {
  name = "iac-app:latest"

  build {
    context    = "${path.module}/../app"
    dockerfile = "Dockerfile"
  }
}

############################################
# Docker Container
############################################
resource "docker_container" "app_container" {
  name  = "app-container"
  image = docker_image.app_image.image_id


  ports {
    internal = 3000
    external = 3000
  }

  restart = "unless-stopped"
}


