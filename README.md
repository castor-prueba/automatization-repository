# Automatización de Proyecto con Git Actions

Este proyecto utiliza workflows en Git Actions para automatizar la creación de proyectos en .Net, Python y Angular, con la arquitectura orientada al dominio. A continuación se detallan los workflows disponibles y los parámetros que se pueden configurar.

## Workflows Disponibles

### 1. Workflow de Desarrollo Continuo (Continuous Integration)

Este workflow se activa cada que se corre manualmente mediante la ejecución del workflow y realiza las siguientes acciones:

- Creación de un repositorio privado con el nombre del proyecto
- Creación del proyecto con una arquitectura y/o un grupo de carpetas previamente creadas 
- commit inicial del proyecto con los cambios de arquitectura realizados
- Push al repositorio inicalmente creado, con las configuraciones y creaciones iniciales

### Para mas detalle de los git actión y de los pipeline:

- [Pipeline .Net6 ](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/net6.yml)
- [Angular](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/angular.yml)
- [Python with fastApi ](https://github.com/castor-prueba/automatization-repository/blob/main/.github/workflows/python-architecture-domain.yml)

#### Parámetros:
- **repo_name**: Nombre del nuevo repositorio.
- **name_solution**: Nombre de la solución del proyecto.
- **name_project**: Nombre del proyecto dentro de la solución.
- **private**: Indica si el repositorio debe ser privado (`true`/`false`).


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
