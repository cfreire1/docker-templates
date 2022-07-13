# Sitio Oficial:
* Link: https://hub.docker.com/_/sonarqube

# Descripcion del proyecto:
* Docker Compose de sonanarqube con bd posgresql



# Instalacion
1. Creacion de carpetas con privilegios (Iniciar terminal en super usuario(sudo))
```
#!/bin/bash

    # Crear carpetas
    mkdir db db/postgresql db/data
    mkdir sonarqube sonarqube/data sonarqube/extensions sonarqube/logs

    # Asignar privilegios
    chmod 7777 -R db/ sonarqube
```

2. Creacion de contenedor
```
  docker-compose up
```
3. acceso
```
    http://localhost:9000/about

    Credenciales:
    User: admin
    pass: admin

```