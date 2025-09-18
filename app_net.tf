# Red para las aplicaciones
resource "docker_network" "app_net" {
  name = "app_net"
}

# APP1
resource "docker_container" "app1" {
  name  = "app1-${terraform.workspace}"
  image = "python:3.12-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/apps/app1")
    container_path = "/app"
    read_only      = false
  }

  # instala flask y corre el server en :80
  command = ["sh", "-c", "pip install --no-cache-dir flask && python /app/app1.py"]

  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

# APP2
resource "docker_container" "app2" {
  name  = "app2-${terraform.workspace}"
  image = "python:3.12-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/apps/app2")
    container_path = "/app"
    read_only      = false
  }

  command    = ["sh", "-c", "pip install --no-cache-dir flask && python /app/app2.py"]
  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}

# APP3
resource "docker_container" "app3" {
  name  = "app3-${terraform.workspace}"
  image = "python:3.12-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  volumes {
    host_path      = abspath("${path.module}/apps/app3")
    container_path = "/app"
    read_only      = false
  }

  command    = ["sh", "-c", "pip install --no-cache-dir flask && python /app/app3.py"]
  restart    = "unless-stopped"
  depends_on = [docker_network.app_net]
}
