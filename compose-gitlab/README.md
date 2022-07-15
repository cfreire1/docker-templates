# Sitio Oficial:
* Link: https://registry.hub.docker.com/r/gitlab/gitlab-ce/

# Descripcion:
* Docker Compose de git lab community

# Instrucciones
# Iniciar compose (GIT-LAB)
1. Iniciar compose
```
    docker-compose up
```
3. Ingresar el siguiente comando en el teminal para obtener pasword generada
```
    docker exec -it <ID-CONTAINER> grep 'Password:' /etc/gitlab/initial_root_password
    docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```
2. Ingresar a url
```
    http://localhost/users/sign_in
    user: root
    pass: <password generada>
```

# Notas

* change Port
    * https://stackoverflow.com/questions/59177615/gitlab-on-docker-how-to-set-the-external-url-for-gitlab
    * https://docs.gitlab.com/omnibus/docker/
