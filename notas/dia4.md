En el mismo proyecto que teniamos:
    - Nuevo NodeSource: Local, Ansible Inventory, 
        Fichero YAML
                vv
        Script BASH -> Que genere un fichero YAML según la especificación de RUNDECK
                        Con la info del nodo
        Le poneis un icono propio
    - Vamos a montar un job para este nodo:
        - Instalar paquetería con un comando bash (apt): nginx
        - Playbook de ansible
            Que haga un clonado del repo de git en una carpeta: https://github.com/IvanciniGT/webEjemploAnsible.git
            Copie los archivos descargados en la carpeta de nginx adecuada para servirlos
        - Playbook de ansible que
            Haga una prueba y mire si la web funciona bien
                shell curl
                