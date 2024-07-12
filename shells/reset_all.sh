### most bugs happen due to coffee not enabling ipv6
### hence you need to change
### 1. have the following
###      listen 80 default_server;
###      # listen [::]:80 ipv6only=on default_server;
###      server_name _;
###    inside /etc/nginx/conf.d/default.conf of the containers
### 2. check the container's [CMD] command by `docker inspect container`. Re-run the cmd inside the container to restart the service

./shells/reset_cms.sh
./shells/reset_gitlab.sh
./shells/reset_reddit.sh
./shells/reset_shopping.sh
