FROM ubuntu:22.04

################################################################
# ARGUMENTOS PARA LA GENERACION DE LA IMAGEN
################################################################
ARG USER_NAME
ARG GIT_USER_NAME="Alumno de IOChannel"
ARG GIT_USER_EMAIL="alumno@iochannel.tech"
ENV IMAGE_VERSION="test"

################################################################
# INSTALACION DE SOFTWARE
################################################################
# Actualizar repositorios e instalar software requerido
RUN apt update && \
    apt install -y openssh-server sudo git man man-db manpages-posix vim && \
    (yes | unminimize) && \
    apt autoclean && \
    rm -rf /var/lib/apt/lists/*

################################################################
# CONFIGURACION DE SSH
################################################################
# Crear clave privada para el contenedor y configurar SSH
COPY resources/sshd_config /etc/ssh/sshd_config
RUN ssh-keygen -A && \
    chmod -x /etc/update-motd.d/* && \
    mkdir /run/sshd && chmod 0755 /run/sshd

################################################################
# CREACION DEL USUARIO QUE CONECTARA MEDIANTE SSH
################################################################
# Crear usuario sin contraseña y configurar sudoers
RUN groupadd -g 999 $USER_NAME && \
    useradd -u 999 -g $USER_NAME -G sudo -m -s /bin/bash $USER_NAME && \
    sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g' && \
    sed -i /etc/sudoers -re 's/^root.*/root ALL=(ALL:ALL) NOPASSWD: ALL/g' && \
    sed -i /etc/sudoers -re 's/^#includedir.*/## **Removed the include directive** ##"/g' && \
    echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Cambiar sh por bash y establecer permisos a la carpeta de historial
RUN ln -sf bash /bin/sh && \
    mkdir -p /tmp/.history && chmod 777 /tmp/.history

USER $USER_NAME

# Crear carpeta de trabajo y configuraciones SSH
RUN mkdir -p /home/$USER_NAME/environment ~/.ssh && \
    mkdir -p ~/.cache/ && > ~/.cache/motd.legal-displayed

################################################################
# CONFIGURACION DE SU SHELL: BASH
################################################################
# Configurar bash para el usuario
COPY --chown=$USER_NAME:$USER_NAME resources/bash_profile /tmp/bash_profile.sh
RUN ls -l /tmp/bash_profile.sh
RUN echo 'export LANG="C.UTF-8"' >> /home/$USER_NAME/.bashrc && \
    echo 'export LANGUAGE="C.UTF-8"' >> /home/$USER_NAME/.bashrc && \
    echo 'export LC_ALL="C.UTF-8"' >> /home/$USER_NAME/.bashrc && \
    cat /tmp/bash_profile.sh >> /home/$USER_NAME/.bashrc && \
    rm /tmp/bash_profile.sh && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O /home/$USER_NAME/.git-completion.bash

################################################################
# COMANDO DE ARRANQUE DEL CONTENEDOR
################################################################
COPY resources/init.sh /bin/init.sh
RUN sudo chmod 0755 /bin/init.sh

################################################################
# VOLUMENES PARA LAS CLAVES
################################################################
# Carpeta donde se exportan / suministran las claves ssh
# con la que conectarse y que debe registrarse
RUN sudo mkdir -p /home/$USER_NAME/.ssh/keys \
 && sudo chmod 0777 /home/$USER_NAME/.ssh/keys

VOLUME ["/home/$USER_NAME/.ssh/keys", "/tmp/.history", "/home/$USER_NAME/environment"]

################################################################
# VARIABLES DE ENTORNO
################################################################
ENV GIT_USER_NAME=$GIT_USER_NAME
ENV GIT_USER_EMAIL=$GIT_USER_EMAIL
ENV IMAGE_VERSION @project.version@
ENV USER_NAME=$USER_NAME

################################################################
# OTRAS CONFIGURACIONES
################################################################
WORKDIR /home/$USER_NAME/environment
EXPOSE 22
LABEL maintainer="Ivan Osuna Ayuste <ivan@iochannel.tech>"
CMD ["/bin/bash", "-c", "/bin/init.sh"]
