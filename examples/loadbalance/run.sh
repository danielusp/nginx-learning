#!/bin/bash

# Creates three node servers in 1000 2000 3000 ports

appNum=1

for port in 1000 2000 3000
do
    docker run -d --rm -p ${port}:3000 -e APPID="APP ${appNum}" -e EXT_PORT=${port} --name "NODE-APP-${appNum}" -v ${PWD}/examples/loadbalance/node-servers/:/usr/src/app/ node:current-alpine3.12 node /usr/src/app/app.js

    ((appNum++))
done