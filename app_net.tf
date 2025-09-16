# Red para las aplicaciones
resource "docker_network" "app_net" {
  name = "app_net"
}

resource "docker_container" "app" {
  count = 3
  name  = "app${count.index + 1}"
  image = "nginx:alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  restart = "unless-stopped"
}
