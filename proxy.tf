resource "docker_container" "proxy" {
  name  = "proxy-${terraform.workspace}"
  image = "nginx:1.27-alpine"

  networks_advanced { name = docker_network.app_net.name }

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = abspath("${path.module}/proxy/default.conf")
    container_path = "/etc/nginx/conf.d/default.conf"
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
