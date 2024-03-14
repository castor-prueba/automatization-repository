import os
import subprocess
import sys

# Estructura de carpetas del proyecto
folders = [
    '_1_routers',
    '_2_domin/schemas',
    '_2_domin/services',
    '_2_domin/utils',
    '_3_infrastructure/cross',
    '_3_infrastructure/persistence',
    '_3_infrastructure/procies',
    'test',
]

# Crear estructura de carpetas
for folder in folders:
    os.makedirs(folder, exist_ok=True)
    with open(os.path.join(folder, '__init__.py'), 'w') as init_file:
        init_file.close()  # Crear un archivo __init__.py en cada carpeta

print('Estructura de carpetas creada en el directorio actual.')


# Generar archivo básico de FastAPI
main_content = """from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)

"""

with open('main.py', 'w') as main_file:
    main_file.write(main_content)

print('Archivo main.py creado en el directorio actual. Tu proyecto FastAPI básico está listo.')

with open('main.py', 'w') as main_file:
    main_file.write(main_content)

print('Archivo main.py creado en el directorio actual. Tu proyecto FastAPI básico está listo.')


# Nombre del archivo .env
env_file_name = '.env'

# Contenido básico para el archivo .env
env_content = """
# Configuraciones de entorno
DATABASE_URL="tu_url_de_base_de_datos"
SECRET_KEY="tu_clave_secreta"
"""

# Crear y escribir el archivo .env en el directorio actual
with open(env_file_name, 'w') as env_file:
    env_file.write(env_content.strip())

print('Archivo .env creado en el directorio actual. Configura tus variables de entorno según sea necesario.')

# Nombre del archivo requirements.txt
requirements_file_name = 'requirements.txt'

# Dependencias a incluir en el archivo requirements.txt
dependencies = """
fastapi==0.100.0
python-dotenv==1.0.0
pydantic>=1.8.0,<2.0.0
uvicorn>=0.15.0,<0.16.0
boto3==1.28.85
aiohttp==3.9.1
python-jose==3.3.0
passlib==1.7.4
pytest==7.4.4
httpx==0.26.0
pytest-asyncio==0.23.3
PyJWT==2.8.0
"""

# Crear y escribir el archivo requirements.txt en el directorio actual
with open(requirements_file_name, 'w') as requirements_file:
    requirements_file.write(dependencies.strip())

print('Archivo requirements.txt creado en el directorio actual.')

# Nombre del archivo .gitignore
gitignore_file_name = '.gitignore'

# Contenido básico para el archivo .gitignore
gitignore_content = """
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# PEP 582; used by e.g. github.com/David-OConnor/pyflow
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/
"""

# Crear y escribir el archivo .gitignore en el directorio actual
with open(gitignore_file_name, 'w') as gitignore_file:
    gitignore_file.write(gitignore_content.strip())

print('Archivo .gitignore creado en el directorio actual. Configúralo según las necesidades de tu proyecto.')
