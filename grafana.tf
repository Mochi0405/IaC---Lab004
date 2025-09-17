resource "docker_volume" "grafana_data" {
  name = "grafana_data_${terraform.workspace}"
}

resource "docker_container" "grafana" {
  name  = "grafana-${terraform.workspace}"
  image = "grafana/grafana-oss:10.4.2"

  networks_advanced {
    name = docker_network.monitor_net.name
  }

  ports {
    internal = 3000
    external = var.grafana_external_port[terraform.workspace]
  }

  volumes {
    volume_name    = docker_volume.grafana_data.name
    container_path = "/var/lib/grafana"
  }

  env = [
    "GF_SECURITY_ADMIN_USER=${var.grafana_admin_user}",
    "GF_SECURITY_ADMIN_PASSWORD=${var.grafana_admin_password}"
  ]

  restart    = "unless-stopped"
  depends_on = [docker_network.monitor_net]
}
