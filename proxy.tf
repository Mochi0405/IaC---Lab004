resource "docker_container" "proxy" {
  name  = "proxy-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced {
    name = docker_network.app_net.name
  }

  # Publica 8080 (host) -> 80 (proxy)
  ports {
    internal = 80
    external = 8080
  }

  # Monta la carpeta 'proxy' con configs .conf
  volumes {
    host_path      = abspath("${local.repo_root}/proxy")
    container_path = "/etc/nginx/conf.d"
    read_only      = false
  }

  restart = "unless-stopped"
  depends_on = [
    docker_network.app_net,
    docker_container.app1,
    docker_container.app2,
    docker_container.app3
  ]
}
