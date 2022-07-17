* Ejecuar compose

* conectarse a registry
```
    docker login localhost:5000
    docker logout localhost:5000
    user/name: cualquer cosas -// sin credenciales

```

* subir/bajar imagen 
```
    $ docker pull ubuntu

    $ docker tag ubuntu localhost:7000/ubuntu
        docker tag <existing-image> <hub-user>/<repo-name>[:<tag>]

    $ docker push localhost:7000/ubuntu
        docker push <hub-user>/<repo-name>:<tag
    
    $ docker pull localhost:7000/ubuntu
```

* Contenedor
* Iniciar sesion en el contenedor
```
    docker exec -it registry sh
```

# Notas
    * https://hub.docker.com/_/registry
    * https://stackoverflow.com/questions/38247362/how-i-can-use-docker-registry-with-login-password
    * https://stackoverflow.com/questions/50033624/how-to-set-username-and-password-for-our-own-docker-private-registry
    * https://stackoverflow.com/questions/43730680/way-to-delete-the-images-from-private-docker-registry
    * https://stackoverflow.com/questions/25436742/how-to-delete-images-from-a-private-docker-registry
    * https://github.com/distribution/distribution/blob/main/docs/spec/api.md#deleting-an-image
