#!/bin/sh

if [ -z "$ES_PORT" ]; then
    export ES_PORT=9200
fi

if [ -z "$ES_HOST" ]; then
    export ES_HOST=elasticsearch-logging
fi


sed -i 's/host ES_HOST/host '"$ES_HOST"'/' /etc/td-agent/td-agent.conf
sed -i 's/port ES_PORT/port '"$ES_PORT"'/' /etc/td-agent/td-agent.conf

/usr/sbin/td-agent 2>&1 >> /var/log/fluentd.log
