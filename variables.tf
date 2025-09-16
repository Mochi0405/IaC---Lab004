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

variable "redis_external_port" {
  description = "Puertos externos para Redis por workspace"
  type        = map(number)
}

variable "postgres_external_port" {
  description = "Puertos externos para PostgreSQL por workspace"
  type        = map(number)
}

variable "postgres_user" {
  description = "Usuario por defecto para Postgres"
  type        = string
  default     = "admin"
}

variable "postgres_password" {
  description = "Contraseña de Postgres (sensible)"
  type        = string
  sensitive   = true
}

variable "postgres_db" {
  description = "Nombre de la BD por defecto"
  type        = string
  default     = "appdb"
}
