# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto Azure Monitor Demo!

## 🚀 Cómo Contribuir

### 1. Fork y Clone
```bash
git fork https://github.com/your-repo/azure-monitor-demo
git clone https://github.com/your-username/azure-monitor-demo
cd azure-monitor-demo
```

### 2. Crear una Rama
```bash
git checkout -b feature/nueva-funcionalidad
```

### 3. Hacer Cambios
- Mantén el código limpio y documentado
- Sigue las convenciones de naming existentes
- Actualiza documentación si es necesario

### 4. Testear
```powershell
# Ejecutar tests locales
.\scripts\demo-final.ps1
```

### 5. Commit y Push
```bash
git add .
git commit -m "feat: descripción de la nueva funcionalidad"
git push origin feature/nueva-funcionalidad
```

### 6. Crear Pull Request
- Describe los cambios realizados
- Incluye screenshots si aplica
- Referencia issues relacionados

## 📋 Checklist para Pull Requests

- [ ] Código testeado localmente
- [ ] Documentación actualizada
- [ ] Sin información sensible (passwords, keys, etc.)
- [ ] Commit messages claros
- [ ] No hay archivos temporales o logs

## 🏷️ Convenciones

### Commit Messages
- `feat:` nueva funcionalidad
- `fix:` corrección de bugs
- `docs:` cambios en documentación
- `refactor:` refactoring de código
- `test:` agregar o modificar tests

### Código
- Usar nombres descriptivos para variables y funciones
- Comentar código complejo
- Mantener funciones pequeñas y enfocadas

## 🛠️ Configuración de Desarrollo

### Prerrequisitos
- Azure CLI
- PowerShell 5.1+
- Git
- Editor de código (VS Code recomendado)

### Configuración Inicial
```bash
# Instalar extensiones recomendadas para VS Code
code --install-extension ms-vscode.azure-tools
code --install-extension ms-vscode.powershell
```

¡Gracias por contribuir! 🎉
