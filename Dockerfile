FROM grayindustries/docker-sensu-client
MAINTAINER Greg Poirier <grep@gray.industries>

# Setup RabbitMQ
ADD files/rabbitmq-signing-key-public.asc /rabbitmq-signing-key-public.asc
RUN apt-key add /rabbitmq-signing-key-public.asc
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server pwgen
RUN rabbitmq-plugins enable rabbitmq_management

ADD files/supervisord-rabbitmq.conf /etc/supervisor/conf.d/rabbitmq.conf
ADD files/set_rabbitmq_password.sh /set_rabbitmq_password.sh
ADD files/rabbitmq.sh /rabbitmq.sh

EXPOSE 5672 15672
