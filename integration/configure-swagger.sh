#!/bin/bash

# Variables
SOLUTION_DIR=$1
PROJECT_NAME=$2

# Navegar al directorio de la función
cd "$SOLUTION_DIR/01.$PROJECT_NAME.Api/$PROJECT_NAME.Function"

ls -la 
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

