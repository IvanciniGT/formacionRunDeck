Rundeck instalado en 2 entornos:
- desarrollo/Pruebas
    Proyecto1 -> EXPORTAR (acls, nodos, keys...) ---> .jar
        Job1 --export--> job1 a github -- import --> producción
        Job2
        Job3 --export--> job3 a github -- import --> producción
- producción
    Proyecto1-PROD <--- IMPORTAR (acls, nodos, propiedades...) (project.properties) <--- .jar
        default executor (passwords)
        nodos

Hay ocasiones que es necesario cambiar algún dato del job cuando lo paso a producción.
Podemos optar por exportarlo a un git, cambiar allí el dato que me interesa y después importarlo a producción.
En este caso, elegiré el formato de archivo con el que me sienta más cómodo para editarlo manualmente (o con un script)
En general YAML es lo mejor si hay que editar a mano.
Si lo editamos vía un script depende del programa que use.
Si no lo voy a editar me la trae al peiro!

---

El usuario deploy debe poder:
- Ver cualquier proyecto y sus cosas... y ejecutar trabajos... Pero no puede tocar nada!