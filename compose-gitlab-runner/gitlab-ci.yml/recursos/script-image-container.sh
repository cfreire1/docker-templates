#!/bin/bash
# Colocar dentro del repositorio del proyecto

if [ $( docker ps -a | grep $CI_PROJECT_NAME | wc -l ) -gt 0 ]; then
    docker stop $CI_PROJECT_NAME
    docker rm $CI_PROJECT_NAME
    echo "Deteniendo y eliminando contenedor..."
else
    echo "No existe contenedor, se procede a crear..."
fi

if [ $( docker images -a | grep img-$CI_PROJECT_NAME | wc -l  ) -gt 0  ]; then
    docker image rm img-$CI_PROJECT_NAME
    echo "Eliminando Imagen..."
else
    echo "No existe Imagen, se procede a crear..."
fi


echo "Contruyendo imagen..."
docker build -t img-$CI_PROJECT_NAME .

echo "Creando contenedor..."
docker run -d -p 5000:5000 --name $CI_PROJECT_NAME img-$CI_PROJECT_NAME