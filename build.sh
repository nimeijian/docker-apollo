#!/bin/bash
name="apollo-all"
tag=1.5.1

docker build --build-arg maven_repo=/home/nimeijian/software/maven/repo -t ${name}:${tag} .

oldImage=$(docker images | grep ${name} | grep -v ${tag} | awk -vOFS=":" '{ print $1,$2 }')
if [[ -n ${oldImage} ]];then
    echo "Delete old Image: ${oldImage}"
    docker rmi ${oldImage}
fi
