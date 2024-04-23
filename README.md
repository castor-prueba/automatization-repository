# Automatización de Proyecto con Git Actions

Este proyecto utiliza workflows en Git Actions para automatizar la creación de proyectos en .Net, Python y Angular en Git Hub, con la arquitectura orientada al dominio. A continuación se detallan los workflows disponibles y los parámetros que se pueden configurar.

## Workflows Disponibles

### 1. Workflow de Desarrollo Continuo (Continuous Integration)

Este workflow se activa cada que se corre manualmente mediante la ejecución del workflow y realiza las siguientes acciones:

- Creación de un repositorio privado con el nombre del proyecto
- Creación del proyecto con una arquitectura y/o un grupo de carpetas previamente creadas 
- commit inicial del proyecto con los cambios de arquitectura realizados
- Push al repositorio inicalmente creado, con las configuraciones y creaciones iniciales

### Para mas detalle de los pipeline:

- [Pipeline .Net6 ](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/net6.yml)
- [Angular](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/angular.yml)
- [Python with fastApi ](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/python-architecture-domain.yml)


### Proceso de ejecución de los workflow
Aproximadamente la ejecución de los workflows demoran unos 2 minutos. Para ver la ejecición hay que actualizar la pagina, y si damos click el vamos a ver el paso a paso de la creación

- [Pipeline .Net6 ](https://github.com/castor-prueba/automatization-repository/actions/workflows/net6.yml)
- [Angular](https://github.com/castor-prueba/automatization-repository/actions/workflows/angular.yml)
- [Python with fastApi ](https://github.com/castor-prueba/automatization-repository/actions/workflows/python-architecture-domain.yml)

 #### Ejecución

- La ejecución se activa mediante la opción de Run workflow y se ingresa los parametros necesarios para su creación:

![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/e637139b-cc6e-48ab-ae33-f5cc78605240)

- Agregar los parametros y ejecutarlo:
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/29508967-36a1-4ab3-86cc-be9f0cc1aa43)

- Proceso de ejecución:
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/5afea1a9-b061-48bd-a710-98615173b032)

- Stage o escenarios que se ejecutan, en este caso es solo uno
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/88d2a736-924a-4293-8062-ec95e4f3e1a3)

 - Los pasos de la ejecución
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/6607e17d-70f8-41de-9bca-a307aac62efa)

Si en la creación no tuvo ningun problema, en los action ejecutados nos mostrara una palomita verde
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/f3a003af-0a32-4c0b-aab6-44da322511f7)

### Documentación de Git Action
- [Git Action](https://docs.github.com/es/actions)


## Activación de action para la creacion de proyecto .Net6
- [Workflow Creación project .Net6](https://github.com/castor-prueba/automatization-repository/actions/workflows/net6.yml)



#### Parámetros:
- **repo_name**: Nombre del nuevo repositorio.
- **name_solution**: Nombre de la solución del proyecto.
- **name_project**: Nombre del proyecto dentro de la solución.
- **private**: Indica si el repositorio debe ser privado (`true`/`false`).




### 




### 2. Workflow de Despliegue Automatizado (Continuous Deployment)

Este workflow se activa al hacer merge a la rama `main` y despliega automáticamente la aplicación en el entorno de producción. Las acciones incluyen:

- Generación de artefactos de despliegue.
- Configuración de variables de entorno.
- Despliegue en el servidor de producción.

## Configuración de Parámetros

El proyecto permite configurar los siguientes parámetros en el archivo de configuración de Git Actions (`workflow.yml`):

- **Ambiente de Despliegue:** Permite seleccionar el ambiente de despliegue (desarrollo, prueba, producción).
- **Variables de Entorno:** Configuración de variables específicas para cada ambiente (ejemplo: URL de la base de datos, claves de API).
- **Notificaciones:** Configuración de notificaciones por correo electrónico o mensajería instantánea.

## Guía de Uso

Para utilizar este proyecto en otros equipos, sigue los siguientes pasos:

1. Clona el repositorio en tu entorno local.
2. Configura los parámetros necesarios en el archivo `workflow.yml` según tus requisitos.
3. Realiza los cambios necesarios en el código base y realiza commits en la rama correspondiente.
4. Haz push a la rama para activar el workflow de Desarrollo Continuo.
5. Realiza merge a la rama `main` para activar el workflow de Despliegue Automatizado en el ambiente de producción.
