# Red para las aplicaciones
resource "docker_network" "app_net" {
  name = "app_net"
}

locals {
  repo_root = path.module
}

# APP1
resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  #HTML de app1 en la raíz de nginx
  volumes {
    host_path      = abspath("${local.repo_root}/apps/app1")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }


  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

# APP2
resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  volumes {
    host_path      = abspath("${local.repo_root}/apps/app2")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }


  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

# APP3
resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  volumes {
    host_path      = abspath("${local.repo_root}/apps/app3")
    container_path = "/usr/share/nginx/html"
    read_only      = true
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}
