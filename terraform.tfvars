nginx_external_port = {
  dev  = 3000
  qa   = 4000
  prod = 81
}

# Grafana
grafana_external_port = {
  dev  = 3100
  qa   = 3200
  prod = 3000
}

redis_external_port = {
  dev  = 6370
  qa   = 6371
  prod = 6372
}

postgres_external_port = {
  dev  = 5432
  qa   = 5433
  prod = 5434
}

postgres_user = "admin"
postgres_db   = "appdb"