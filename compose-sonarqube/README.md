# Sitio Oficial:
* Link: https://hub.docker.com/_/sonarqube

# Descripcion:
* Docker Compose de sonanarqube con bd posgresql



# Instalacion


1. Creacion de contenedor
```
  docker-compose up
```
2. acceso
```
    http://localhost:9000/about

    Credenciales:
    User: admin
    pass: admin

```

# Para otras versiones de Sonnar

1. Creacion de carpetas con privilegios (Iniciar terminal en super usuario(sudo))
```
#!/bin/bash

    # Crear carpetas
    mkdir dbsonnar dbsonnar/postgresql dbsonnar/data
    mkdir sonarqube sonarqube/data sonarqube/extensions sonarqube/logs

    # Asignar privilegios
    chmod 7777 -R dbsonnar/ sonarqube
```
