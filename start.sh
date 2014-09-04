#!/usr/bin/env bash
NAME="rabbitmq"
PORTS="5672 15672"
ENV_VARS="RABBITMQ_USER=sensu RABBITMQ_PASS=sensu"
OPTS="-d "

PORT_ARGS=""
for port in $PORTS; do
    PORT_ARGS+=" -p ${port}:${port}"
done

ENV_ARGS=""
for env_var in $ENV_VARS; do
    ENV_ARGS+=" -e $env_var"
done

docker run --name ${NAME} ${OPTS}${PORT_ARGS}${ENV_ARGS} grayindustries/docker-rabbitmq
