#!/bin/bash

IMAGES=(os-util)

docker_rm () {
    docker_image_find $1
    if [ ! -z "$IMAGE" ]; then
        docker image rm $IMAGE
    fi
}

docker_kill () {
    docker_find $1
    if [ ! -z "$CONTAINER" ]; then
        docker kill $CONTAINER
    fi
}

docker_image_find () {
    IMAGE=$(docker image ls | grep sh3rp/$1 | awk '{print $3}')
}

docker_find () {
    CONTAINER=$(docker ps $2 | grep sh3rp/$1 | awk '{print $1}')
}

copy_kubeconfig () {
    if [ ! -z "$KUBECONFIG" ]; then
        cp $KUBECONFIG kubeconfig
    fi
}

rm_kubeconfig () {
    rm kubeconfig
}


if [ ! -z "$1" ]; then
    docker_kill $1
    docker_rm $1
    cd $1
    copy_kubeconfig
    docker build -t sh3rp/$1 .
    rm kubeconfig
    cd ..
else
    for d in ${IMAGES[*]}; do
        docker_kill $d
        docker_rm $d
        cd $d
        copy_kubeconfig
        docker build -t sh3rp/$d .
        rm kubeconfig
        cd ..
    done
fi
