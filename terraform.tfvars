# Puertos por workspace
grafana_external_port = {
  dev  = 3000
  qa   = 43000
  prod = 53000
}

#Puertos expuestos
app1_external_port = {
  dev  = 8081
  qa   = 48081
  prod = 58081
}
app2_external_port = {
  dev  = 8082
  qa   = 48082
  prod = 58082
}
app3_external_port = {
  dev  = 8083
  qa   = 48083
  prod = 58083
}

redis_external_port = {
  dev  = 6379
  qa   = 46379
  prod = 56379
}

postgres_external_port = {
  dev  = 5432
  qa   = 45432
  prod = 55432
}

postgres_user = "admin"
postgres_db   = "appdb"
