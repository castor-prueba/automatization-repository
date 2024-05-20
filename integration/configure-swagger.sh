#!/bin/bash

# Variables
SOLUTION_DIR=$1
PROJECT_NAME=$2

# Navegar al directorio de la función
cd "$SOLUTION_DIR/01.$PROJECT_NAME.Api/$PROJECT_NAME.Function"

# Agregar paquete Swashbuckle
dotnet add package Swashbuckle.AspNetCore

# Crear archivo Startup.cs
cat <<EOL > Startup.cs
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Reflection;

[assembly: FunctionsStartup(typeof($PROJECT_NAME.Function.Startup))]

namespace $PROJECT_NAME.Function
{
    public class Startup : FunctionsStartup
    {
        public override void Configure(IFunctionsHostBuilder builder)
        {
            builder.Services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "$PROJECT_NAME API", Version = "v1" });
                var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                var xmlPath = System.IO.Path.Combine(System.AppContext.BaseDirectory, xmlFile);
                c.IncludeXmlComments(xmlPath);
            });
        }
    }
}
EOL

# Crear archivo FunctionExtensions.cs
cat <<EOL > FunctionExtensions.cs
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Linq;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Hosting;

namespace $PROJECT_NAME.Function
{
    public class FunctionExtensions : IWebJobsStartup
    {
        public void Configure(IWebJobsBuilder builder)
        {
            builder.AddSwashbuckle(Assembly.GetExecutingAssembly());
        }
    }
}
EOL
