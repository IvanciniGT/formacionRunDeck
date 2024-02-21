mkdir -p ~/environment/data/rundeck
mkdir -p ~/environment/data/mariadb
chmod 777 ~/environment/data/rundeck
chmod 777 ~/environment/data/mariadb
export PUBLIC_IP=$(curl ifconfig.me)
docker compose up -d --build
                     # Con esto forzamos a que siempre se regenere la imagen de contenedor que vamos a crear