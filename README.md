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

- Si en la creación no tuvo ningun problema, en los action ejecutados nos mostrara una palomita verde
  
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/f3a003af-0a32-4c0b-aab6-44da322511f7)

- Por ultimo en los repositorios de la compañia se mostrara el repositorio creado
  
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/1b665044-be53-44db-95cc-97824d278839)
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/f351b99c-17bc-4b71-89d7-248914b339a4)


### Documentación de Git Action
- [Git Action](https://docs.github.com/es/actions)


## Proyecto .Net6
- [Workflow Creación project .Net6](https://github.com/castor-prueba/automatization-repository/actions/workflows/net6.yml)
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/48ef1e79-855e-4135-bf5e-beb6f1474cc6)


#### Parámetros:
- **Nombre del nuevo repositorio**: Nombre del repositorio que se va a crear.
- **Nombre de la solución**: Nombre de la solución del proyecto de .Net o del Dominio.
- **Nombre del proyecto**: Es el nombre que va a llevar en cada una de las capas.
- **private**: Indica si el repositorio debe ser privado (`true`/`false`).

## Proyecto Angular
- [Workflow Creación project .Net6](https://github.com/castor-prueba/automatization-repository/actions/workflows/net6.yml)
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/744ba534-a8c5-47a4-b5da-514a9edbd1a7)
#### Parámetros:
- **Nombre del nuevo repositorio**: Nombre del repositorio que se va a crear.
- **Proyecto frontend**: Nombre del proeycto de angular.
- **private**: Indica si el repositorio debe ser privado (`true`/`false`).

## Proyecto Python con Fast APi
![image](https://github.com/castor-prueba/automatization-repository/assets/163158964/03546947-b398-461f-9afe-c2c3288a72c6)
#### Parámetros:
- **Nombre del nuevo repositorio**: Nombre del repositorio que se va a crear.
- **private**: Indica si el repositorio debe ser privado (`true`/`false`).

