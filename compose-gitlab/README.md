# Sitio Oficial:
* Link: https://registry.hub.docker.com/r/gitlab/gitlab-ce/

# Descripcion:
* Docker Compose de git lab community

# Instalacion
1. Iniciar
```
    docker-compose up
```
3. Ingresar el siguiente comando en el teminal para obtener pasword generada
```
    docker exec -it <ID-CONTAINER> grep 'Password:' /etc/gitlab/initial_root_password
```
2. Ingresar a url
```
    http://localhost/users/sign_in
    user: root
    pass: <password generada>
```
