import subprocess
import sys

def is_dotnet_installed():
    """Verifica si el SDK de .NET Core está instalado."""
    try:
        subprocess.run(["dotnet", "--version"], check=True, stdout=subprocess.DEVNULL)
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        return False

def install_instructions():
    """Imprime las instrucciones de instalación del SDK de .NET Core para diferentes sistemas operativos."""
    print("El SDK de .NET Core no está instalado. Por favor, instálalo siguiendo las instrucciones para tu sistema operativo.")
    print("\nWindows:\nVisita https://dotnet.microsoft.com/download y sigue las instrucciones para Windows.")
    print("\nmacOS:\nPuedes usar Homebrew: 'brew install --cask dotnet-sdk'")
    print("\nLinux:\nVisita https://dotnet.microsoft.com/download y sigue las instrucciones para tu distribución de Linux específica.")
    print("\nUna vez instalado el SDK de .NET Core, vuelve a ejecutar este script.")

def main():
    if not is_dotnet_installed():
        install_instructions()
        sys.exit(1)
    
    # El código para crear el proyecto .NET va aquí.
    print("El SDK de .NET Core está instalado.")

if __name__ == "__main__":
    main()
