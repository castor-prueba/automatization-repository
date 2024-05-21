#!/bin/bash

# Variables
SOLUTION_DIR=$1
PROJECT_NAME=$2

# Función para capitalizar la primera letra de cada palabra
capitalize() {
  echo "$1" | sed -E 's/(^|-)([a-z])/\U\2/g'
}

# Convertir el nombre del proyecto
NAME_PROJECT_CAPITALIZED="$(capitalize "$PROJECT_NAME")Function"
cd ..
ls -la 
pwd

# Navegar al directorio de la función
cd "$SOLUTION_DIR/01.$PROJECT_NAME.Api/$NAME_PROJECT_CAPITALIZED.Function"

# Ejecutar el script de configuración de Swagger ubicado en la carpeta 've'

echo "********************************************CONFIGURE_SWAGGER******************************************"

# Agregar paquete Swashbuckle
dotnet add package Swashbuckle.AspNetCore

# Crear archivo Program.cs
cat <<EOL > Program.cs
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;

var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .ConfigureServices(services =>
    {
        services.AddApplicationInsightsTelemetryWorkerService();
        services.ConfigureFunctionsApplicationInsights();
        services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc("v1", new OpenApiInfo { Title = "$PROJECT_NAME API", Version = "v1" });
            var xmlFile = $"{System.Reflection.Assembly.GetExecutingAssembly().GetName().Name}.xml";
            var xmlPath = System.IO.Path.Combine(System.AppContext.BaseDirectory, xmlFile);
            c.IncludeXmlComments(xmlPath);
        });
    })
    .Build();

host.Run();
EOL

# Crear archivo ${NAME_PROJECT_CAPITALIZED}.cs
cat <<EOL > SwaggerFunction.cs
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace $PROJECT_NAME.Function
{
    public class ${NAME_PROJECT_CAPITALIZED}
    {
        private readonly ILogger<${NAME_PROJECT_CAPITALIZED}> _logger;

        public ${NAME_PROJECT_CAPITALIZED}(ILogger<${NAME_PROJECT_CAPITALIZED}> logger)
        {
            _logger = logger;
        }

        [Function("Swagger")]
        public IActionResult Run([HttpTrigger(AuthorizationLevel.Anonymous, "get")] HttpRequest req)
        {
            _logger.LogInformation("Serving Swagger UI");
            return new RedirectResult("/swagger");
        }
    }
}
EOL
echo "*********************************Final***************************"
ls-la 
echo "Swagger configuration completed."
