
# Descripcion:
* Docker Compose de  portainer web open-source que permite gestionar contenedores Docker.​ Permite administrar contenedores.


# Comando para terminal
```
docker run -d -p 32403:8000 -p 9444:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v ./portainer_data:/data portainer/portainer-ce:latest
```