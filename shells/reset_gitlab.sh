#!/bin/bash
# Define variables
CONTAINER_NAME="gitlab"
echo "resetting gitlab"

docker stop ${CONTAINER_NAME}
docker remove ${CONTAINER_NAME}
sleep 1
docker run --rm -p 58023:80 ubuntu bash

### launch gitlab # working
# to debug gitlab container, tail the logs:
# ```gitlab-ctl tail```
# see more at https://docs.gitlab.com/omnibus/settings/logs.html
docker run --name ${CONTAINER_NAME} -d \
-p 58023:8023 \
--shm-size=2g \
gitlab-populated-final-port8023_fixed /opt/gitlab/embedded/bin/runsvdir-start

echo "wait at least 5 mins for services to boot"
sleep 360

docker exec ${CONTAINER_NAME} sed -i "s|^external_url.*|external_url 'http://0.0.0.0:8023'|" /etc/gitlab/gitlab.rb
docker exec ${CONTAINER_NAME} gitlab-ctl reconfigure
docker exec ${CONTAINER_NAME} /opt/gitlab/embedded/sbin/logrotate -fv -s /var/opt/gitlab/logrotate/logrotate.status /var/opt/gitlab/logrotate/logrotate.conf
sleep 10


echo "restarted gitlab"