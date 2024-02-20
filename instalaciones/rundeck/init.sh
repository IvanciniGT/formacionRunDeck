mkdir -p ~/environment/data/rundeck
mkdir -p ~/environment/data/mariadb
chmod 777 ~/environment/data/rundeck
chmod 777 ~/environment/data/mariadb
export PUBLIC_IP=$(curl ifconfig.me)
docker compose up -d