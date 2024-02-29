# Definimos un argmento que nos deben suministrar al crear la imagen: LA IMAGEN DE PARTIDA (Qué versión de RD quiero usar)
ARG RUNDECK_IMAGE

# Crear un contenedor desde esa imagen... que posteriormente se exportará como imagen de contenedor.
FROM ${RUNDECK_IMAGE}

# Variable para controlar si Ansible de debe quedar cuajado esperando confirmación cuando el host no está en el knownhosts al conectar por ssh.
# NOTA. Esto ocurre solamente cuando conectamos por contraseña. 
# COSA QUE JAMAS DEBERIAMOS HACER EN UN ENTORNO DE PRODUCCION = NO DEBE SUPONER UN PROBLEMA 
ENV ANSIBLE_HOST_KEY_CHECKING=false

# Instalar requisitos previos de ansible.
RUN sudo apt-get -y update \
  && sudo apt-get -y --no-install-recommends install ca-certificates python3-pip python3-setuptools \
    sshpass zip unzip \
  && sudo -H pip3 install --upgrade pip==20.3.4 \
  && sudo rm -rf /var/lib/apt/lists/* 

# Instalar ansible
RUN sudo mkdir /etc/ansible \
  && pip install ansible==2.10.1

# Copiar acls customizadas
COPY acls/ /home/rundeck/etc/
RUN sudo chmod 775 /home/rundeck/etc/*.aclpolicy \
 && sudo chown rundeck:root /home/rundeck/etc/*.aclpolicy

# Añadir ansible en el path
ENV PATH=$PATH:~/.local/bin
