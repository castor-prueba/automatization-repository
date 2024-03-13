import os
import subprocess
import sys

# Estructura de carpetas del proyecto
folders = [
    'app',
    'app/models',
    'app/schemas',
    'app/crud',
    'app/api',
    'app/api/endpoints',
    'app/core',
    'app/db',
]

# Crear estructura de carpetas
for folder in folders:
    os.makedirs(folder, exist_ok=True)
    with open(os.path.join(folder, '__init__.py'), 'w') as init_file:
        init_file.close()  # Crear un archivo __init__.py en cada carpeta

print('Estructura de carpetas creada en el directorio actual.')


# Generar archivo básico de FastAPI
main_content = """from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}
"""

with open('main.py', 'w') as main_file:
    main_file.write(main_content)

print('Archivo main.py creado en el directorio actual. Tu proyecto FastAPI básico está listo.')

with open('main.py', 'w') as main_file:
    main_file.write(main_content)

print('Archivo main.py creado en el directorio actual. Tu proyecto FastAPI básico está listo.')
