FROM tutum/rabbitmq
MAINTAINER Greg Poirier <grep@gray.industries>

RUN rabbitmqctl add_vhost /sensu
RUN rabbitmqctl set_permissions -p /sensu sensu '.*' '.*' '.*'

CMD /run.sh
