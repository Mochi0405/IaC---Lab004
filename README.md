# Infraestructura como Código (IAC) – Proyecto Docker + Terraform

Este trabajo es una implementación de infraestructura como código (IAC) utilizando Docker y Terraform para desplegar un ecosistema compuesto por tres redes: AppNet, MonitorNet y PersistenciaNet. Cada red tiene contenedores específicos para simular un entorno de aplicaciones, monitoreo y persistencia de datos.


##  Tecnologías utilizadas

Docker – Contenedores y redes aisladas

Terraform – Provisión automatizada de contenedores y redes

Grafana – Visualización y monitoreo de métricas

Nginx – Servidores web

PostgreSQL – Base de datos relacional

Redis – Caché en memoria

1. git clone https://github.com/Mochi0405/Iac---Lab02
2. Inicializar |terraform init|
3. Verificar |terraform plan|
4. Aplicar |terraform apply| ----  Confirma con "yes" cuando se te pida
5. Comprobar |docker ps|
6. Instalar Reddis o usar |docker exec -it redis-dev redis-cli| 



