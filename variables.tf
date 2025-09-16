variable "nginx_external_port" {
  description = "Coloca el puerto de NGINX"
}

variable "grafana_admin_password" {
  description = "Contraseña admin para Grafana"
  type        = string
  sensitive   = true
}

variable "grafana_external_port" {
  description = "Puertos externos para Grafana por entorno"
  type        = map(number)
}
