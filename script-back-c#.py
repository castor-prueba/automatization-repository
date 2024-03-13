import subprocess
import os

def create_dotnet_project(project_type, project_name):
    # Crear el proyecto .NET
    subprocess.run(["dotnet", "new", project_type, "-o", project_name], check=True)
    print(f"Proyecto {project_type} '{project_name}' creado.")

def create_folders(project_name, folders):
    # Crear una estructura de carpetas dentro del proyecto
    for folder in folders:
        path = os.path.join(project_name, folder)
        os.makedirs(path, exist_ok=True)
        print(f"Carpeta '{folder}' creada en '{project_name}'.")

def main():
    project_name = "MiProyectoAspNet"
    project_type = "webapp"  # Puedes cambiar esto por otro tipo de proyecto, como 'console', 'classlib', etc.

    folders = [  # Estructura de carpetas personalizada dentro del proyecto
        "Servicios",
        "Modelos",
        "Interfaces",
        # Agrega más carpetas según sea necesario
    ]

    create_dotnet_project(project_type, project_name)
    create_folders(project_name, folders)

    # Opcional: Restaurar dependencias y ejecutar el proyecto
    os.chdir(project_name)  # Cambiar al directorio del proyecto
    subprocess.run(["dotnet", "restore"], check=True)  # Restaurar dependencias
    subprocess.run(["dotnet", "run"], check=True)  # Ejecutar el proyecto

if __name__ == "__main__":
    main()
