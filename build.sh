#!/bin/bash
name="172.24.0.28:1180/yzf-apollo/apollo-all"
tag=1.5.1

docker build -t ${name}:${tag} .

oldImage=$(docker images | grep ${name} | grep -v ${tag} | awk -vOFS=":" '{ print $1,$2 }')
if [[ -n ${oldImage} ]];then
    echo "Delete old Image: ${oldImage}"
    docker rmi ${oldImage}
fi
