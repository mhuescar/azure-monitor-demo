# 🎯 Guía para Demo de Azure Monitor - Inicio Inmediato

## ✅ Recursos Desplegados
- ✅ Resource Group: `demo-monitor-rg`
- ✅ App Service: `app-bwkinh757hlog`
- ✅ Application Insights: `appi-[unique-id]`
- ✅ Log Analytics Workspace: `log-[unique-id]`
- ✅ SQL Database: `sql-[unique-id]` / `sqldb-[unique-id]`
- ✅ Alertas configuradas (3 alertas)

## 🚀 Comenzar Demo AHORA (sin esperar código)

### 1. **Abrir Azure Portal**
```
https://portal.azure.com/#@/resource/subscriptions//resourceGroups/demo-monitor-rg/overview
```

### 2. **Mostrar Infraestructura Desplegada**
- Mostrar todos los recursos en el Resource Group
- Explicar la arquitectura: App Service + Application Insights + SQL + Storage

### 3. **Demostrar Application Insights (YA disponible)**
1. Click en el recurso `Application Insights`
2. Ir a **"Live Metrics"** - funciona inmediatamente
3. Mostrar métricas básicas del servidor
4. Ir a **"Application Map"** - muestra dependencias
5. Explorar **"Performance"** - métricas de infraestructura

### 4. **Azure Monitor - Métricas de Infraestructura**
1. Desde App Service → **"Metrics"**
2. Agregar métricas:
   - CPU Percentage
   - Memory Percentage  
   - Http Requests
   - Response Time
3. Crear gráficos en tiempo real

### 5. **Alertas Preconfiguradas**
1. Ir a **"Monitor"** → **"Alerts"**
2. Mostrar las 3 alertas ya configuradas:
   - High Response Time (>5s)
   - High Error Rate (>10%)
   - High CPU Usage (>80%)

## 🔧 Una vez que la App esté lista

### URLs de la Aplicación:
- **Principal**: https://app-bwkinh757hlog.azurewebsites.net
- **Swagger**: https://app-bwkinh757hlog.azurewebsites.net/swagger
- **Health**: https://app-bwkinh757hlog.azurewebsites.net/api/health
- **Products**: https://app-bwkinh757hlog.azurewebsites.net/api/products
- **Errores**: https://app-bwkinh757hlog.azurewebsites.net/api/simulate-error
- **Carga CPU**: https://app-bwkinh757hlog.azurewebsites.net/api/load-test
- **Memoria**: https://app-bwkinh757hlog.azurewebsites.net/api/memory-test

### Generar Tráfico:
```powershell
.\generate-traffic.ps1
```

## 📊 Puntos Clave para la Demo

### Application Insights:
- ✅ **Live Metrics**: Tiempo real
- ✅ **Application Map**: Visualización de dependencias
- ✅ **Performance**: Análisis de rendimiento
- ✅ **Failures**: Gestión de errores
- ✅ **Logs**: Consultas KQL avanzadas

### Azure Monitor:
- ✅ **Metrics Explorer**: Métricas personalizadas
- ✅ **Alertas**: Notificaciones automáticas
- ✅ **Workbooks**: Reportes interactivos
- ✅ **Dashboards**: Visualización ejecutiva

## 🎪 Flujo de Demo (15-20 min)

1. **Intro** (2 min): Mostrar arquitectura desplegada
2. **Live Metrics** (3 min): Tiempo real + generar tráfico
3. **Application Map** (2 min): Dependencias visuales
4. **Performance** (3 min): Análisis de latencia
5. **Alertas** (2 min): Configuración y triggers
6. **Logs/KQL** (3 min): Consultas avanzadas
7. **Métricas Custom** (2 min): Crear dashboards
8. **Q&A** (2 min): Preguntas del cliente

## ⚡ Comandos de Emergencia

Si algo falla, puedes generar métricas básicas:
```powershell
# Verificar recursos
az resource list -g "demo-monitor-rg" --output table

# Ver métricas de App Service
az monitor metrics list --resource "/subscriptions/[sub-id]/resourceGroups/demo-monitor-rg/providers/Microsoft.Web/sites/app-bwkinh757hlog" --metric "CpuPercentage"

# Restart App Service si es necesario
az webapp restart -g "demo-monitor-rg" -n "app-bwkinh757hlog"
```

---
🎉 **¡Ya tienes todo listo para impresionar al cliente!**
