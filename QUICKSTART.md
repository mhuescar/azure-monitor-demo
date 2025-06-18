# 📋 Azure Monitor Demo - Quick Start Guide

Este documento te ayudará a levantar el entorno de demostración en menos de 15 minutos.

## ⚡ Setup Express (TL;DR)

```powershell
# 1. Clonar y configurar
git clone https://github.com/tu-usuario/azure-monitor-demo.git
cd azure-monitor-demo

# 2. Configurar Azure CLI
az login
az account set --subscription "tu-subscription-id"

# 3. Desplegar todo
.\scripts\deploy.ps1

# 4. Verificar funcionamiento
.\scripts\demo-final.ps1

# 5. Abrir demo
# URL: Se mostrará al final del deployment
# Azure Portal: portal.azure.com > Resource Groups > demo-monitor-rg
```

## 🎯 Para la Demo

### URLs Importantes
- **App Web**: `https://app-[unique-id].azurewebsites.net`
- **Health Check**: `https://app-[unique-id].azurewebsites.net/health`
- **API Productos**: `https://app-[unique-id].azurewebsites.net/api/products`
- **Generar Error**: `https://app-[unique-id].azurewebsites.net/error`

### Azure Portal
1. **Application Insights** → Live Metrics (impresionante en vivo)
2. **Application Map** → Muestra dependencias visuales
3. **Performance** → Análisis de latencia
4. **Failures** → Tracking de errores
5. **Alerts** → 3 alertas preconfiguradas

### Script de Tráfico
```powershell
# Generar tráfico durante la demo
.\scripts\generate-traffic.ps1
```

## 🚨 Si Algo Sale Mal

```powershell
# Reiniciar aplicación
az webapp restart --name app-[unique-id] --resource-group demo-monitor-rg

# Ver logs
az webapp log tail --name app-[unique-id] --resource-group demo-monitor-rg

# Limpiar todo
az group delete --name demo-monitor-rg --yes --no-wait
```

## 💰 Costos
- **Total estimado**: ~$0.76/día
- **Para 1 demo de 1 hora**: ~$0.03

## 📞 Soporte
- 📖 [Documentación completa](docs/)
- 🐛 [Reportar issues](../../issues)
- 💬 [Discusiones](../../discussions)

---
🎉 **¡En 15 minutos tendrás una demo impresionante de Azure Monitor!**
