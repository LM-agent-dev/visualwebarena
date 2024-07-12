#!/bin/bash
# Define variables
CONTAINER_NAME="shopping_admin"
echo "resetting CMS"

docker stop ${CONTAINER_NAME}
docker remove ${CONTAINER_NAME}
sleep 3
docker run --rm -p 55988:80 ubuntu bash

docker run --name ${CONTAINER_NAME} -p 55988:80 -d shopping_admin_final_0719_fixed
echo "wait ~1 min to wait all services to start"
sleep 60

docker exec ${CONTAINER_NAME} /var/www/magento2/bin/magento setup:store-config:set --base-url="http://coffee.cs.columbia.edu:55988" # no trailing slash
docker exec ${CONTAINER_NAME} mysql -u magentouser -pMyPassword magentodb -e  'UPDATE core_config_data SET value="http://coffee.cs.columbia.edu:55988/" WHERE path = "web/secure/base_url";'
docker exec ${CONTAINER_NAME} /var/www/magento2/bin/magento cache:flush
sleep 1

echo "restarted CMS"