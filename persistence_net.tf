# persistence net
resource "docker_network" "persistence_net" {
  name = "persistence_net"
}

resource "docker_volume" "redis_data" {
  name = "redis_data_${terraform.workspace}"
}

resource "docker_volume" "postgres_data" {
  name = "postgres_data_${terraform.workspace}"
}

# Redis
resource "docker_container" "redis" {
  name  = "redis-${terraform.workspace}"
  image = "redis:7.2-alpine"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 6379
    external = var.redis_external_port[terraform.workspace]
  }

  volumes {
    volume_name    = docker_volume.redis_data.name
    container_path = "/data"
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.persistence_net]
}

# Postgres
resource "docker_container" "postgres" {
  name  = "postgres-${terraform.workspace}"
  image = "postgres:15.7-alpine"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = var.postgres_external_port[terraform.workspace]
  }

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  restart    = "unless-stopped"
  depends_on = [docker_network.persistence_net]
}
