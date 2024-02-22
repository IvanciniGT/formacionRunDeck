En el mismo proyecto que teniamos:
    - Nuevo NodeSource: Local, Ansible Inventory, 
        Fichero YAML
                vv
        Script BASH -> Que genere un fichero YAML según la especificación de RUNDECK
                        Con la info del nodo
        Le poneis un icono propio


Imaginad que voy a instalar un cluster de nginx (nodo1, nodo2, nodo3...)
    - Vamos a montar un job para este nodo:
        # Donde instalo? En todas: NODE STEP
        - Instalar paquetería con un comando bash (apt): nginx
        # Donde ejecuto ansoible? TODAS: NODE STEP
        - Playbook de ansible
            Que haga un clonado del repo de git en una carpeta: https://github.com/IvanciniGT/webEjemploAnsible.git
            Copie los archivos descargados en la carpeta de nginx adecuada para servirlos
                /var/www/html
        # Donde hago la prueba? TODAS?
            - Playbook de ansible que: NODE STEP
                Haga una prueba y mire si la web funciona bien
                    shell curl
            - Balanceador de carga <<< SOLO 1 vez: WORKFLOW STEP
            
    Dentro de un JOB, en el workflow, tenemos 2 tipos de steps:
        NODE: Se ejecutan en cada nodo
        WORKFLOW: solo 1 vez... en el nodo de rundeck
                