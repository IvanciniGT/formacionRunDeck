
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


