# Red de monitoreo para Grafana
resource "docker_network" "monitor_net" {
  name = "monitor_net"
}
