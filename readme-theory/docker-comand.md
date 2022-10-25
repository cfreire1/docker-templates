# Info
* ¿Qué son las imágenes?
    * Son moldes o plantillas que tienen empaquetado todo lo necesario para funcionar. Docker usa estás misma para construir contenedores.
* ¿Para qué sirven las imágenes en la construcción de software?
    * Las imágenes sirven para crear contenedores y también es como docker intenta solucionar el problema de construcción de y distribución de software.

# Generales
```

    #Listar imagenes
    docker image ls

    # Lista todos los contenedores
    docker ps -a

    #Ver contenedores activos
    docker ps


    # =======================
    ## dockerfile
    #creo un Dockerfile
    touch Dockerfile 

    #Crear una imagen local
    docker build -t <new_image_name>:<version_tag> . 

    # =======================
    ## Images
    #Descarga una versión específica imagen
    docker pull <image_name>:<version_tag> 

    #Descarga la última versión disponible imagen
    docker pull <image_name> 

    #Para eliminar una imagen
    op1 =>  docker image rm -f <image_id>
    op2 => docker image rm -f <image_name>:<version_tag>

    #observar la historia de nuestra imágen, con el siguiente comando
    docker history <image_name>

    # borrar imagenes
    docker image prune -a

    # =======================
    ## Volumes
    #listo los volumes
    docker volume ls 

    #creo un volume
    docker volume create <name_volume>

    # corro el contenedor(BBDD) y monto el volume
    docker run -d --name db --mount src=<name_volume>,dst=/data/db mongo

    # =======================
    ## Containers
    #Crear contenedor simple
    docker run --name <name_container> <image_name>:<version_tag> 

    #Crear contenedor con opción de borrarse si se detiene
    docker run --rm -p 3000:3000 <image-name> 

    # crear contenedor lo corre y entro al shell de ubuntu (modo interactivo)
    docker run -it ubuntu 

        -i: interactivo
        -t: abre la consola o terminal

    #Iniciar el bash(comandos) dentro del contenedor(Iniciado)
    docker exec -it <name_container> bash

    #crear contenedor en background (-d) y con un bind-mount(volumenes fisicos -v) al contenedor
    docker run -d --name <name_container> -v <path_maquina_host>:<path_container>

    #crear contenedor con un nginx y expongo el puerto 80 del contenedor en el puerto 8080 de mi máquina o host
    docker run -d --name proxy -p 8080:80 nginx 

    #crear contenedor que no se detiene (main process)
    docker run -d ubuntu tail -f /dev/null #se crea en background (-d)
    docker run ubuntu tail -f /dev/null
        tambien se peuden colocar: (procesos infinitos que no hace nada, pero se mantiene siempre en ejecución)
            /dev/null
            /dev/full
            /dev/zero
            /dev/random


    #detener contenedor
    docker stop <name_container>
    docker stop <id_container>

    #vuelve arrancar contenedor
    docker start <name_container>
    docker start <id_container>

    #Copia desde contenedor y hacia nuestra maquina
    op1 => docker cp prueba.txt <name_container>:/home/testing
    op2 => docker cp <name_container>:/home/testing .

    #Borrar contenedor
    docker rm <name_container> 
    docker rm <id_container> 

    #Borra contenedor pero antes se detiene
    docker rm -f <name_container> 
    docker rm -f <id_container> 

    #Ver log de contenedor
    docker logs <name_container> 
    docker logs <id_container> 

    #Ver log de contenedor con seguimiento(follow)
    docker logs -f <name_container>
    docker logs -f <id_container>  

    #Ver log de contenedor y mostrar solo las 10 últimas entradas del log
    docker logs --tail 10 -f <name_container>
    docker logs --tail 10 -f <id_container>

    # =======================
    ## docker hub
    #me logueo en docker hub
    docker login 

    #cambio el tag para poder subirla a mi docker hub
    docker tag <my_image_name>:<version_tag> <mi_usuario_dockerhub>/<my_image_name>:<version_tag_new>

    #publico la imagen a mi docker hub
    docker push <mi_usuario_dockerhub>/<my_image_name>:<version_tag_new>

    # Salir de la session
    docker docker logout

```

# DockerFile
```
    # COPY [".","/usr/src"]
    para copiar archivos de un origen, en este caso del contexto de build “.”, hacia un # destino “/usr/src”

    # WORKDIR /usr/src
    es como un cd de la línea de comandos hacia el directorio base.

    # EXPOSE 3000
    para abrir o exponer el puerto, en caso 3000.

    # CMD ["node","index.js"]
    Es el comando que se ejecutará cuando se inicie el contenedor.
```
* Ejemplo de dockerfile
```
    #Imagen de base a ocupar
    FROM node:12

    # copiar solo los archivos que se necesitan para el npm
    COPY ["package.json","package-lock.json", "/usr/src/"]

    # como hacer cd 
    WORKDIR /usr/src

    RUN npm install

    # copiar todos los archivos desde build a esa ruta, como ya pasamos dos archivos package json ya no se volveran a pasar
    # optimizaremos el tiempo 
    COPY [".", "/usr/src/"]

    # permitir que el puerto sea vinculable, se pueda acceder al contenedor mediante ese puerto
    EXPOSE 3000

    # comando a ejecutarse
    CMD ["node", "index.js"]
```

# Docker networking 
```
    #listar redes
    docker network ls

    #crear red
    docker network create --attachable <network_name>

    #ver definicion de red
    docker inspect <network_name>

    #Conectar contenedor a la red  
    docker network connect <network_name> <container-name> 

    #crear contenedor enviando una variable de entorno mongo
    docker run -d --name <name> -p <local-port>:<container-port> --env MONGO_URL=mondodb://db:27017/test <image_name>
```


# Docker Compose
```
    # para crear las imagenes de los servicios de docker
    docker-compose build

    # para iniciar los servicios declarados en el archivo de docker-compose.
    docker-compose up -d

    # visualizar los servicios que se están ejecutando.
    docker-compose ps
```

