# Versiones de software

Esquema de versionado: 1.2.3

            ¿Cuándo se incrementa?
MAJOR 1     Breaking changes = NO SE GARANTIZA RETROCOMPATIBILIDAD
                = Quitamos cosas del API (con reemplazo o no)
MINOR 2     Nueva funcionalidad
            Funcionalidad marcada como obsoleta (deprecated)
                + Arreglos de bugs
PATCH 3     Arreglo de bugs

---

# Alta de un proyecto

Una vez dado de alta un proyecto, necesitaremos dar de alta NODOS.
Los nodos son donde ejecutaremos los trabajos.

Hay varias opciones para cargarlos:
- A MANO NO !
- Fichero/Directorio donde podemos definir los nodos... en una sintaxis que nos ofrece RUNDECK (YAML|XML)
- Script que al ejecutarlo generase ese XML o YAML.
    - Hago un programa py|bash que llame a mi CMDB y saque los servidores que tengo en la empresa... y los exporte en ese formato YAML | XML
- Inventario de Ansible
- VMWARE
- Kubernetes
- Docker
- Clouds: AWS EC2, AZURE, GCP

---

# INFRAESTRUCTURA PARA EL CURSO

    ---------------------------red de amazon--------------------
    |
    172.31.AAA.BBB:1022 -> 172.22.0.2:22
    |
    host
    |
    |-172.21.0.1-------+----------------------------+------------------ docker network DOCKER-COMPOSE RUNDECK
    |                  |                            |
    |               172.21.0.2 (rundeck)        172.21.0.3 (mariadb)
    |
    |-172.22.0.1-------+----------------------------------------------- docker network DOCKER-COMPOSE entorno1
    |                  |                            
    |               172.22.0.2 (entorno1)
    |
    |-127.0.0.1------------------------------------------------------- red loopback


Desde el host: ssh root@172.22.0.2 y llega sin problema
Desde el rundeck no iba a funcionar

Desde el host: ssh 172.31.AAA.BBB:1022 y llega sin problema
Desde el rundeck no iba a funcionar
            

            vvv
            

    ---------------------------red de amazon--------------------
    |
    172.31.AAA.BBB:1022 -> 172.22.0.2:22
    |
    host
    |
    |-172.21.0.1-------+----------------------------+---------------------+---- docker network DOCKER-COMPOSE RUNDECK
    |                  |                            |                     |
    |               172.21.0.2 (rundeck)        172.21.0.3 (mariadb)   172.21.0.4 (entorno1)
    |
    |-172.22.0.1-------+----------------------------------------------- docker network DOCKER-COMPOSE entorno1
    |                  |                            
    |               
    |
    |-127.0.0.1------------------------------------------------------- red loopback
            
    
---

# RUNDECK & ANSIBLE

Rundeck             
 (app grails/Groovy < --- JAVA)
    - Interfaz Web
    - API REST
    
    Proyecto
        Nodos: (sacados del inventario Ansible)
        Job:
            - Tarea: Ejecutar el playbook (1)

Rundeck lo único que hará (1) será pedirle a un PLUGIN DE ANSIBLE que llame a Ansible para ejecutar nuestro playbook

             (esto no es ansible)
RunDeck ---> Plugin de Ansible ---> Ansible
 ^
 Proyecto
  ^
  Job
   ^
   TAREA: 
        plugin: Que es quién ejecuta la tarea
        metadatos:
            - playbook que queremos que se ejecute 