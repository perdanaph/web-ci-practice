# 1. Memberitahu Terraform bahwa kita akan menggunakan Docker
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 2. Menginstruksikan Terraform untuk mengunduh Image Nginx
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

# 3. Menginstruksikan Terraform untuk membuat server (kontainer)
resource "docker_container" "nginx_server" {
  image = docker_image.nginx_image.image_id
  name  = "server-terraform-perdana"
  
  ports {
    internal = 80
    external = 8080
  }
}
