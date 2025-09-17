# Red para las aplicaciones
resource "docker_network" "app_net" {
  name = "app_net"
}

# Apps
resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  ports {
    internal = 80
    external = var.app1_external_port[terraform.workspace]
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  ports {
    internal = 80
    external = var.app2_external_port[terraform.workspace]
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }
  ports {
    internal = 80
    external = var.app3_external_port[terraform.workspace]
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}
