
# Contenedores

Vamos a usarlos para:
- Instalación de RUNDECK
- BBDD
- LDAP
- GUI LDAP
- Entornos remotos para administrarlos con RUNDECK

# Rundeck

Automatizar principalmente tareas de administración de sistemas, pero también puede ser utilizado para automatizar tareas en una amplia variedad de escenarios.

Pero.. no es una herramienta como Ansible, Terraform, Puppet, Chef... sino que es una herramienta que se encarga de orquestar y ejecutar tareas en sistemas remotos.

Sería equivalente a Jenkins / Ansible Tower.

---

# DEVOPS

Cultura/Movimiento en pro de la automatización de tareas... qué tipo de tareas? Todas las que encontramos entre el desarrollo y la operación de un sistema.

            Automatizables?     HERRAMIENTAS?
PLAN                x
CODE                x
BUILD               √
                            JAVA: maven, gradle, sbt
                            .NET: msbuild, nuget, dotnet
                            JS:   npm, yarn, webpack
                            ...ant, make
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Desarrollo ágil.
TEST
    Definición      x
    Ejecución       √
                            JUnit, TestNG, NUnit, MSTest, Jasmine, Mocha, Jest, Selenium, Cucumber, SoapUI, Postman, JMeter, Gatling, LoadRunner, ...
    Esas pruebas deben ejecutarse en un determinado entorno...
    En la máquina del desarrollador? NO... no me fio... está maleada
    En la máquina del tester? NO... no me fio... está maleada
    Queremos un entorno de pruebas... precreado? Antiguamente si.
    Hoy en día la tendencia es a usar entornos efímeros... que se crean y destruyen en el momento de la ejecución de las pruebas ---> CONTENEDORES
    Clouds
        Generar esa infra donde ejecutar las pruebas: 
                    √       Ansible, Puppet, Chef, Salt (Planchado / aprovisionamiento)
                            sh, bash, .bat, ps1, py
                            Terraform, Vagrant, CloudFormation, ARM, ... (obtención de infraestructura)
                            Contenedores: Docker, Podman, Kubernetes
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Integración continua: PRODUCTO: Un informe de pruebas
RELEASE             √
    La puesta en disposición de mi producto en las manos del cliente 
        Subir un artefacto a unn repositorio de artefactos (nexus, artifactory, gitlab registry, docker hub, npm registry, ...)
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Entrega continua: Continuous Delivery
DEPLOY              √   \   Se tiende a Kubernetes
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Despliegue continuo: Continuous Deployment
OPERATION           √   /
MONITOR             √   (Splunk, Nagios, Zabbix, Prometheus, Grafana, ELK, ...)
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Devops completa

Yo puedo tener :
- Un montón de scripts de terraform
- Un montón de playbooks de Ansible
- Maven
- Pruebas automatizadas (selenium, appium, cucumber...)
- Generación y distribución de imágenes de contenedor: docker

Hace falta orquestar todas esas tareas: Servidores de CI/CD
- Jenkins
- Gitlab CI
- Github Actions
- Travis CI
- TeamCity
- Bamboo
- ...

Estas herramientas permiten montar Pipelines de CI/CD

La operación de un sistema es complejo el orquestarla. Las tareas básicas si!
- Arranques
- Pares
- Reinicies

La operación de un sistema es compleja... y salen muchos escenarios imprevistos.
Pequeños flujos de Operación: Rundeck

Rundeck ~= Ansible Tower (solo permite ejecutar/orquestar playbooks de Ansible)
Rundeck nos permite ejecutar cualquier tipo de tarea en cualquier tipo de sistema.


# Términos en Rundeck

- Usuario: Persona o programa que conecta con Rundesk para ejecutar/crear Jobs
- Proyecto: Agrupación de Jobs que se ejecutan sobre unos Nodos
- Job: Trabajo (secuencia de tareas)
- Nodo: Entorno remoto sobre el que ejecutamos unos jobs
- Almacen de claves (credenciales) que usaremos para conectarnos a los nodos.

# Los JOBS:

Asociado a un Job tendremos un workflow de tareas.
- Habrá tareas que se ejecutarán de forma secuencial.
- Habrá tareas que se ejecuten en paralelo.

Una tarea puede ser un:
- Script de la bash o de ps1
- Playbook de Ansible

Estos JOBS debemos velar porque sean IDEMPOTENTES!
En un mundo IT como el de hoy en día, esto es clave.
No tengo npi de cúando y cómo se va a solicitar la ejecución de un JOB:
- Manualmente
- Desde Jenkins
- Programo en el tiempo (todas las noches)

---

# Lenguaje declarativo

En el mundo de la automatización las herramientas que están triunfando lo hacen por utilizar un lenguaje declarativo.

Ansible, Terraform, Puppet, docker-compose, kubernetes, (JAVA - Spring), (JS- Angular), Gitlab ci/cd (a ratos)

Cuando programamos usamos lenguajes de programación.
Esos lenguajes de programación, igual que los lenguajes humanos (lenguajes naturales), me permiten expresarme de distintas formas.
En el mundo de los lenguajes de programación, a esas formas en las que puedo expresarme le denominamos: PARADIGMAS:
- Imperativo
- Procedural
- Funcional
- Orientado a objetos
- Declarativo

Durante décadas, hemos estado acostumbrados a usar lenguajes que soportan un paradigma imperativo.
Y nos ha sido "fácil" adaptarnos a esa forma de expresarnos...
Pero la realidad (lo que hemos aprendido a base de ostias) es que los lenguajes imperativos son una MIERDA ENORME, sobre todo de cara a montar SCRIPTS.
Y hoy en día, el paradigma DECLARATIVO ha reemplazado ya casi en su totalidad a los lenguajes imperativos.

- PYTHON, BASH, PS1: Lenguajes imperativos

Ese mismo concepto lo tenemos en los lenguajes humanos.

> Ejemplos:

Felipe, IF hay algo que no sea una silla debajo de la ventana
    Lo quitas
Felipe, IF (SI) no hay una silla debajo de la ventana: 
    Felipe, si no hay sillas, vete al ikea a por una silla!
    Felipe, debajo de la ventana pon una silla!         IMPERATIVO

El problema del lenguaje imperativo es que pierdo de vista lo que quiero conseguir... centrándome en lo que otro debe hacer.

> > Lenguaje declarativo: Felipe, debajo de la ventana debe haber una silla. Tu mismo!

Le cedo la responsabilidad a Felipe!

El uso de lenguajes DECDLARATIVOS lleva asociado el concepto de IDEMPOTENCIA (Ansible)

## Idempotencia

Da igual el estado inicial de un sistema, siempre quiero llevar al mismo estado final.
Ésto me lo da el uso de un lenguaje DECLARATIVO !

Muchas de éstas herramientas, que "hablan" lenguajes declarativos, ofrecen este concepto de la idempotencia.... a medias!

ANSIBLE no ofrece idempotencia.
Los módulos de ANSIBLE se programan de forma que ofrezcan idempotencia.
En Ansible yo montaré un SCRIPT = PLAYs (que se definen dentro de un PLAYBOOK)
Ese script es una "secuencia" de tareas... cada tarea, en ansible, se ejecuta por un MODULO.
Y el módulo me garantiza que la tarea se ejecute de forma idempotente.
Otra cosa es que el script sea idempotente.. y esa responsabilidad es MIA, no de ansible!

> Modulo que permite trabajar con Servicios (OS)

- Quiero que tal servicio se arranque cuando arranca la máquina 
    - A lo mejor ya está configurado
    - O no
    --> Da igual... en cualquiera de estos 2 escenarios el módulo deja el servicio configurado para arranque autom.
        Básicamente, de cara a montar un script, me quito de un IF
- Quiero que tal servicio esté corriendo
    - A lo mejor ya está corriendo
    - A lo mejor no
    --> Da igual... en cualquier de estos 2 escenarios el módulo deja el servicio corriendo.

La idempotencia en ANSIBLE y otras herramientas equivalentes se ofrece a nivel de TAREA.

Imaginad ahora que estoy montando un script:
- Paso 1: # Instalación de MySQL
    # Lenguaje imperativo   
    if not instalado MySQL, entonces:    
        instala MySQL   
    else..
        Si la versión que me piden no es la misma:
            Desinstala mysql
    # Lenguaje declarativo:
    Quiero el mysql v 5.14 instalado.
        Instala mi versión de mysql
- Paso 2: Servicio de Mysql
    Quiero el servicio de Mysql corriendo.   

En Rundesk nos ocurre esto mismo!

QUEREMOS SCRIPTS (JOBS) IDEMPOTENTES!
Es decir, que independientemente del estado en el que se encuentre el sistema, funcionen... y dejen el sistema en un estado final constante:

- Arranque del servicio de BBDD
    Da igual que ya esté el servicio arrancado o no... siempre debe quedar arrancado

El garatizar la idempotencia tiene que ver con la secuencia de pasos en el script(job) ... orquestación que monte.

NO PENSEIS que por usar por debajo playbooks de Ansible (por ejemplo), ya tengo idempotencia... NI DE COÑA... en el script la puedo pisotear esa idempotencia de los MODULOS de ansible.

---

# Automatizar

Crear una máquina / programa que realice las tareas que antes realizaba un ser humano!... a manita.
Lo que vamos a estar es desarrollando programas (script). 
Y hemos de acogernos a las buenas prácticas que durante décadas llevan usando los desarrolladores de software.










