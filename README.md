# 🚀 Azure Monitor & Application Insights Demo

Un entorno completo de demostración para Azure Monitor y Application Insights que incluye infraestructura como código, aplicaciones con telemetría integrada, y scripts de automatización.

## 📋 Descripción del Proyecto

Este proyecto demuestra las capacidades completas de Azure Monitor y Application Insights a través de:

- **Infraestructura como Código (ARM Templates)**: Despliegue automatizado de todos los recursos Azure
- **Aplicación Web con Telemetría**: Node.js + Express con Application Insights integrado  
- **Generación Automática de Carga**: Azure Functions para mantener tráfico constante
- **Alertas y Monitoreo**: Configuración completa de alertas proactivas
- **Scripts de Demostración**: Automatización para presentaciones en vivo

## 🏗️ Arquitectura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   App Service   │    │ Application     │    │  Log Analytics  │
│   (Node.js)     │───▶│   Insights      │───▶│   Workspace     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  SQL Database   │    │   Azure         │    │  Storage        │
│                 │    │   Functions     │    │  Account        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```


## ✨ Características

### 🎯 Aplicación de Demostración
- **Dashboard Interactivo**: Interfaz moderna con métricas en tiempo real
- **API RESTful**: Endpoints para generar diferentes tipos de telemetría
- **Simulación de Errores**: Generación controlada de excepciones
- **Pruebas de Carga**: Endpoints para testing de performance
- **Health Checks**: Monitoreo de estado automático

### 📊 Telemetría Completa
- **Request Tracking**: Todas las HTTP requests con timing
- **Exception Tracking**: Captura y análisis de errores
- **Dependency Tracking**: Monitoreo de llamadas externas
- **Custom Metrics**: Métricas de negocio específicas
- **Custom Events**: Eventos de aplicación personalizados

### 🚨 Alertas Configuradas
- **High Response Time**: Latencia > 2000ms
- **Error Rate**: Tasa de errores > 10%
- **High CPU Usage**: CPU > 80%

## 🚀 Inicio Rápido

### Prerrequisitos
- Azure CLI instalado y configurado
- PowerShell 5.1 o superior
- Suscripción de Azure activa

### 1. Clonar el Repositorio
```bash
git clone <repository-url>
cd azure-monitor-demo
```

### 2. Configurar Variables
```powershell
# Editar los parámetros en infra/main.parameters.json
$resourceGroup = "demo-monitor-rg"
$location = "North Europe"
```

### 3. Desplegar Infraestructura
```powershell
# Ejecutar el script de despliegue
.\scripts\deploy.ps1
```

### 4. Verificar Funcionamiento
```powershell
# Ejecutar pruebas del entorno
.\scripts\demo-final.ps1
```

## 📁 Estructura del Proyecto

```
azure-monitor-demo/
├── 📁 infra/                     # Infraestructura como Código
│   ├── main.json                 # ARM Template principal
│   └── main.parameters.json      # Parámetros de configuración
├── 📁 src/                       # Código fuente
│   ├── 📁 webapp-simple/         # Aplicación Node.js
│   │   ├── server.js             # Servidor Express con AI
│   │   ├── package.json          # Dependencias Node.js
│   │   └── web.config            # Configuración IIS
│   ├── 📁 web/                   # Aplicación .NET (alternativa)
│   └── 📁 loadtest/              # Azure Functions para carga
├── 📁 scripts/                   # Scripts de utilidad
│   ├── deploy.ps1               # Script de despliegue
│   ├── demo-final.ps1           # Script de demostración
│   └── generate-traffic.ps1     # Generador de tráfico
└── 📁 docs/                     # Documentación
    ├── DEMO-GUIDE.md            # Guía de demostración
    └── DEPLOYMENT.md            # Guía de despliegue
```

## 🎯 Endpoints de la Aplicación

### API Endpoints
- **GET /** - Dashboard principal con UI interactiva
- **GET /health** - Health check con métricas del sistema
- **GET /api/products** - API de productos con simulación de DB
- **GET /error** - Generación controlada de errores
- **GET /load?iterations=N** - Prueba de carga CPU
- **GET /memory?size=N** - Prueba de consumo de memoria
- **GET /dependencies** - Simulación de dependencias externas

### Telemetría Generada
Cada endpoint genera telemetría específica:
- Request timing y response codes
- Custom events para análisis de negocio
- Custom metrics para KPIs
- Exception tracking con contexto completo
- Dependency tracking simulado

## 📊 Monitoreo y Alertas

### Métricas Automáticas
- **HTTP Requests**: Conteo y timing de todas las requests
- **Response Times**: Latencia de aplicación
- **Error Rates**: Porcentaje de errores 4xx/5xx
- **CPU/Memory**: Uso de recursos del servidor
- **Dependencies**: Performance de llamadas externas

### Métricas Personalizadas
- `Health_Check_Duration`: Tiempo de health checks
- `Products_API_Duration`: Latencia de API de productos
- `Load_Test_Duration`: Duración de pruebas de carga
- `Memory_Usage_Delta`: Cambios en uso de memoria
- `Error_Count`: Conteo de errores por tipo

### Eventos Personalizados
- `HomePage_Visited`: Visitas al dashboard
- `Products_API_Called`: Llamadas a la API
- `Error_Generated`: Errores simulados
- `Load_Test_Started`: Inicio de pruebas de carga
- `Application_Started`: Arranque de la aplicación

## 🎪 Guía de Demostración

### Preparación (5 minutos)
1. Verificar que todos los recursos estén desplegados
2. Ejecutar `.\demo-final.ps1` para generar tráfico inicial
3. Abrir Azure Portal en Application Insights

### Demo en Vivo (15 minutos)
1. **Mostrar la aplicación funcionando** (3 min)
   - Navegar por el dashboard
   - Probar diferentes endpoints
   - Generar errores y carga

2. **Application Insights en tiempo real** (5 min)
   - Live Metrics Stream
   - Application Map
   - Performance metrics

3. **Análisis de telemetría** (4 min)
   - Exception tracking
   - Custom events y metrics
   - Log Analytics queries

4. **Alertas y monitoreo** (3 min)
   - Mostrar alertas configuradas
   - Explicar thresholds y acciones

## 💰 Estimación de Costos

Para un entorno de demostración (24 horas):
- **App Service (B1)**: ~$0.50/día
- **Application Insights**: ~$0.10/día  
- **SQL Database (Basic)**: ~$0.15/día
- **Storage Account**: ~$0.01/día
- **Total**: ~$0.76/día

## 🧹 Limpieza de Recursos

Para eliminar todos los recursos después de la demo:
```powershell
az group delete --name demo-monitor-rg --yes --no-wait
```

## 🔧 Solución de Problemas

### Aplicación no responde
```powershell
# Verificar estado
az webapp show --name <app-name> --resource-group <rg> --query "state"

# Reiniciar si es necesario
az webapp restart --name <app-name> --resource-group <rg>
```

### Sin datos en Application Insights
```powershell
# Generar tráfico de prueba
.\scripts\demo-final.ps1

# Verificar connection string
az webapp config appsettings list --name <app-name> --resource-group <rg>
```

## 📖 Documentación Adicional

- [Guía de Demostración](docs/DEMO-GUIDE.md)
- [Guía de Despliegue](docs/DEPLOYMENT.md)
- [Resumen Final](docs/DEMO-READY-FINAL.md)
- [Guía de Contribución](CONTRIBUTING.md)

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Fork el repositorio
2. Crear una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Crear un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

## 🏷️ Tags

`azure` `monitor` `application-insights` `telemetry` `demo` `arm-templates` `nodejs` `express` `infrastructure-as-code` `devops`

---

**Construido con ❤️ para demostrar las capacidades de Azure Monitor**
