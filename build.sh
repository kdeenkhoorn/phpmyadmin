#!/bin/bash

# Set requested phpMyAdmin version
ADMINVER=5.1.0

docker build -t kdedesign/phpmyadmin:latest ./build-context --build-arg ADMINVER=${ADMINVER}
docker tag kdedesign/phpmyadmin:latest kdedesign/phpmyadmin:${ADMINVER}
