output "grafana_url" {
  value       = "http://localhost:${var.grafana_external_port[terraform.workspace]}"
  description = "URL local de Grafana"
}

output "redis_port" {
  value       = var.redis_external_port[terraform.workspace]
  description = "Puerto externo de Redis"
}

output "postgres_port" {
  value       = var.postgres_external_port[terraform.workspace]
  description = "Puerto externo de Postgres"
}
