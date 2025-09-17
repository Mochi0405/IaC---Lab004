variable "nginx_external_port" {
  description = "Puerto externo para un Nginx frontal"
  type        = map(number)
  default = {
    dev  = 8080
    qa   = 8080
    prod = 8080
  }
}

variable "app1_external_port" {
  description = "Puerto externo de app1"
  type        = map(number)
}
variable "app2_external_port" {
  description = "Puerto externo de app2"
  type        = map(number)
}
variable "app3_external_port" {
  description = "Puerto externo de app3"
  type        = map(number)
}


# Grafana
variable "grafana_admin_user" {
  description = "Usuario admin para Grafana"
  type        = string
  default     = "admin"
}

variable "grafana_admin_password" {
  description = "Contraseña admin para Grafana"
  type        = string
  sensitive   = true
}

variable "grafana_external_port" {
  description = "Puerto externo de Grafana por workspace"
  type        = map(number)
}

# Redis
variable "redis_external_port" {
  description = "Puerto externo de Redis por workspace"
  type        = map(number)
}

# Postgres
variable "postgres_user" {
  description = "Usuario de Postgres"
  type        = string
  default     = "admin"
}

variable "postgres_password" {
  description = "Contraseña de Postgres"
  type        = string
  sensitive   = true
}

variable "postgres_db" {
  description = "Nombre de la BD por defecto"
  type        = string
  default     = "appdb"
}

variable "postgres_external_port" {
  description = "Puerto externo de Postgres"
  type        = map(number)
}
