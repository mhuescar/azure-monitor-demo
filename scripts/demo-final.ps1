# Demo Final - Azure Monitor & Application Insights
# Script para demostrar todas las capacidades del entorno de monitoreo

Write-Host "🚀 DEMO: Azure Monitor & Application Insights" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

$baseUrl = "https://app-bwkinh757hlog.azurewebsites.net"
$resourceGroup = "demo-monitor-rg"

# 1. Verificar estado de la aplicación
Write-Host "1. 📊 Verificando estado de la aplicación..." -ForegroundColor Yellow
try {
    $health = Invoke-RestMethod -Uri "$baseUrl/health" -Method Get -TimeoutSec 10
    Write-Host "   ✅ Aplicación: SALUDABLE" -ForegroundColor Green
    Write-Host "   ⏱️  Uptime: $([math]::Round($health.uptime, 2)) segundos" -ForegroundColor Green
    Write-Host "   💾 Memoria: $([math]::Round($health.memory.heapUsed / 1MB, 2)) MB" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error verificando salud: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host ""

# 2. Probar API de productos
Write-Host "2. 🛍️  Probando API de productos..." -ForegroundColor Yellow
try {
    $products = Invoke-RestMethod -Uri "$baseUrl/api/products" -Method Get -TimeoutSec 10
    Write-Host "   ✅ API funcionando: $($products.count) productos disponibles" -ForegroundColor Green
    Write-Host "   📦 Productos: $($products.data | ForEach-Object { $_.name } | Join-String -Separator ', ')" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error en API: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# 3. Generar telemetría de errores
Write-Host "3. 🔥 Generando errores para telemetría..." -ForegroundColor Yellow
$errorCount = 0
for ($i = 1; $i -le 3; $i++) {
    try {
        Invoke-RestMethod -Uri "$baseUrl/error" -Method Get -TimeoutSec 5 | Out-Null
    } catch {
        $errorCount++
        Write-Host "   ✅ Error $i generado correctamente (HTTP 500)" -ForegroundColor Green
    }
}
Write-Host "   📊 Total errores generados: $errorCount" -ForegroundColor Green

Write-Host ""

# 4. Prueba de carga
Write-Host "4. ⚡ Ejecutando prueba de carga..." -ForegroundColor Yellow
try {
    $loadResult = Invoke-RestMethod -Uri "$baseUrl/load?iterations=10000" -Method Get -TimeoutSec 20
    Write-Host "   ✅ Prueba de carga completada" -ForegroundColor Green
    Write-Host "   ⏱️  Duración: $($loadResult.duration) ms" -ForegroundColor Green
    Write-Host "   🔢 Iteraciones: $($loadResult.iterations)" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error en prueba de carga: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# 5. Prueba de memoria
Write-Host "5. 💾 Ejecutando prueba de memoria..." -ForegroundColor Yellow
try {
    $memResult = Invoke-RestMethod -Uri "$baseUrl/memory?size=2000000" -Method Get -TimeoutSec 15
    Write-Host "   ✅ Prueba de memoria completada" -ForegroundColor Green
    Write-Host "   📈 Memoria allocada: $([math]::Round($memResult.allocatedSize / 1MB, 2)) MB" -ForegroundColor Green
    Write-Host "   📊 Diferencia heap: $([math]::Round($memResult.memoryDifference.heapUsed / 1MB, 2)) MB" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error en prueba de memoria: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# 6. Prueba de dependencias
Write-Host "6. 🔗 Ejecutando prueba de dependencias..." -ForegroundColor Yellow
try {
    $depResult = Invoke-RestMethod -Uri "$baseUrl/dependencies" -Method Get -TimeoutSec 15
    Write-Host "   ✅ Prueba de dependencias completada" -ForegroundColor Green
    Write-Host "   🎯 Dependencias simuladas:" -ForegroundColor Green
    foreach ($dep in $depResult.dependencies) {
        Write-Host "      - $($dep.name): $([math]::Round($dep.duration, 2)) ms" -ForegroundColor Cyan
    }
} catch {
    Write-Host "   ❌ Error en prueba de dependencias: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""

# 7. Generar tráfico sostenido
Write-Host "7. 🌊 Generando tráfico sostenido..." -ForegroundColor Yellow
$successCount = 0
$totalRequests = 10
for ($i = 1; $i -le $totalRequests; $i++) {
    try {
        Invoke-RestMethod -Uri "$baseUrl/health" -Method Get -TimeoutSec 5 | Out-Null
        $successCount++
        if ($i % 3 -eq 0) {
            Write-Host "   📊 $i/$totalRequests requests completados..." -ForegroundColor Cyan
        }
    } catch {
        Write-Host "   ⚠️  Request $i falló" -ForegroundColor Yellow
    }
    Start-Sleep -Milliseconds 500
}
Write-Host "   ✅ Tráfico completado: $successCount/$totalRequests requests exitosos" -ForegroundColor Green

Write-Host ""

# 8. Información del entorno
Write-Host "8. 📋 Información del entorno de monitoreo:" -ForegroundColor Yellow
Write-Host "   🌐 URL de la aplicación: $baseUrl" -ForegroundColor Cyan
Write-Host "   📊 Application Insights: insights-bwkinh757hlog" -ForegroundColor Cyan
Write-Host "   📁 Resource Group: $resourceGroup" -ForegroundColor Cyan
Write-Host "   📍 Región: North Europe" -ForegroundColor Cyan

Write-Host ""

# 9. Enlaces útiles
Write-Host "9. 🔗 Enlaces útiles para la demo:" -ForegroundColor Yellow
Write-Host "   🌐 Aplicación Web: $baseUrl" -ForegroundColor Cyan
Write-Host "   📊 Health Check: $baseUrl/health" -ForegroundColor Cyan
Write-Host "   🛍️  API Productos: $baseUrl/api/products" -ForegroundColor Cyan
Write-Host "   🔥 Generar Error: $baseUrl/error" -ForegroundColor Cyan
Write-Host "   ⚡ Prueba de Carga: $baseUrl/load?iterations=5000" -ForegroundColor Cyan
Write-Host "   💾 Prueba de Memoria: $baseUrl/memory?size=1000000" -ForegroundColor Cyan
Write-Host "   🔗 Prueba de Dependencias: $baseUrl/dependencies" -ForegroundColor Cyan

Write-Host ""
Write-Host "✅ DEMO COMPLETADO EXITOSAMENTE" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host "📌 Próximos pasos para la presentación:" -ForegroundColor White
Write-Host "   1. Abrir Azure Portal -> Application Insights 'insights-bwkinh757hlog'" -ForegroundColor White
Write-Host "   2. Revisar métricas en tiempo real (Live Metrics)" -ForegroundColor White
Write-Host "   3. Verificar errores capturados (Failures)" -ForegroundColor White
Write-Host "   4. Revisar performance (Performance)" -ForegroundColor White
Write-Host "   5. Verificar alertas configuradas (Alerts)" -ForegroundColor White
Write-Host "   6. Mostrar logs y queries en Log Analytics" -ForegroundColor White

Write-Host ""
Write-Host "🎯 La aplicación está generando telemetría completa para la demo!" -ForegroundColor Green
