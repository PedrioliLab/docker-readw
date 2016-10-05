#!/bin/bash

## Cleanup any potential left overs from past builds
docker rm readw_build

## Build initial image
docker build -t ppatrick/readw_temp .

## Setup XCalibur DDLs
docker run -v $PWD:/install -e LOCAL_USER_ID=`id -u $USER` -e DISPLAY -v $HOME/.Xauthority:/home/user/.Xauthority -it --name readw_build --net=host ppatrick/readw_temp /install/finish_installation.sh

## Establish new entrypoint
docker commit -c 'ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]' readw_build ppatrick/readw

## Remove temporary containers and images
docker rm readw_build
docker rmi ppatrick/readw_temp
