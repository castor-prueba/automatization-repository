#!/bin/bash

# Variables
SOLUTION_DIR=$1
PROJECT_NAME=$2

# Navegar al directorio de la función
cd "$SOLUTION_DIR/01.$PROJECT_NAME.Api/$PROJECT_NAME.Function"

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

# Crear archivo Function1.cs
cat <<EOL > Function1.cs
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace $PROJECT_NAME.Function
{
    public class Function1
    {
        private readonly ILogger<Function1> _logger;

        public Function1(ILogger<Function1> logger)
        {
            _logger = logger;
        }

        [Function("Function1")]
        public IActionResult Run([HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequest req)
        {
            _logger.LogInformation("C# HTTP trigger function processed a request.");
            return new OkObjectResult("Welcome to Azure Functions!");
        }
    }
}
EOL

# Crear archivo SwaggerStartup.cs
cat <<EOL > SwaggerStartup.cs
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Middleware;
using Microsoft.Azure.Functions.Worker.Pipeline;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using System.Threading.Tasks;

var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults(workerApp =>
    {
        workerApp.UseMiddleware<SwaggerMiddleware>();
    })
    .ConfigureServices(services =>
    {
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

public class SwaggerMiddleware : IFunctionsWorkerMiddleware
{
    public async Task Invoke(FunctionContext context, FunctionExecutionDelegate next)
    {
        if (context.FunctionDefinition.Name == "swagger.json")
        {
            var response = context.GetHttpResponseData();
            if (response != null)
            {
                response.Headers.Add("Content-Type", "application/json");
                response.Body = new MemoryStream(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(SwaggerGenerator.GenerateSwagger())));
                context.SetHttpResponseData(response);
            }
        }

        await next(context);
    }
}
EOL
