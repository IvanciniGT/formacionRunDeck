# Inventario de Ansible:

Si el inventario lo defino en Ansible, le dire a rundeck que lo lea...
Realmente quien lo lee es ANSIBLE.

Una vez que ANSIBLE lee el inventario (usa toda la info del inventario... es un inventario de Ansible),
conecta con los nodos, trae sus datos (GATHER_FACTS), y lo manda a RUNDECK,
RUNDECK SOLO GUARDA CIERTA INFORMACION:
- IGNORA EL PUERTO
- IGNORA EL USUARIO

Cuandop ejecutamos un COMANDO desde RUNDECK, usando ansible, lo que rundeck hace es:
- GENERAR DESDE LOS METADATOS QUE EL TIENE un nuevo fichero de inventario ANSIBLE
- Y ese fichero NUEVO es el que manda a ANSIBLE
- ESE FICHERO NI LLEVA PUERTO NI LLEVA USUARIO