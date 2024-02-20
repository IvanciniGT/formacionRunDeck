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