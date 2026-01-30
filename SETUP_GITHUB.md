# 🔧 Guía de Configuración del Repositorio (Para el Profesor)

Esta guía te ayudará a configurar el repositorio en GitHub para que los tests automáticos funcionen correctamente.

---

## 📋 Checklist Rápido

- [ ] Crear repositorio en GitHub
- [ ] Subir archivos del proyecto
- [ ] Habilitar GitHub Actions
- [ ] Configurar branch protection (opcional)
- [ ] Probar que los tests funcionen
- [ ] Compartir repo con estudiantes

---

## 🚀 Paso 1: Crear el Repositorio en GitHub

### 1.1 Crear Nuevo Repositorio

1. Ve a [GitHub](https://github.com)
2. Haz clic en el botón **"+"** (arriba derecha) → **"New repository"**
3. Configura:
   - **Repository name:** `practica-bash-data-engineering` (o el nombre que prefieras)
   - **Description:** "Práctica de navegación en Bash y estructura de proyectos de Data Engineering"
   - **Visibility:** Public (para que estudiantes puedan hacer fork)
   - ✅ **Add a README file:** NO (ya tienes uno)
   - ✅ **Add .gitignore:** NO (ya tienes uno)
   - **Choose a license:** MIT (opcional)
4. Haz clic en **"Create repository"**

### 1.2 Subir los Archivos Iniciales

En tu terminal local:

```bash
# Navega a donde guardaste los archivos de la práctica
cd /ruta/donde/descargaste/archivos

# Inicializa git
git init

# Agrega todos los archivos
git add .

# Haz el primer commit
git commit -m "Initial commit: Configurar práctica de Bash"

# Conecta con tu repositorio en GitHub (reemplaza TU-USUARIO)
git remote add origin https://github.com/TU-USUARIO/practica-bash-data-engineering.git

# Renombra la branch a main (si es necesario)
git branch -M main

# Sube los archivos
git push -u origin main
```

---

## ⚙️ Paso 2: Configurar GitHub Actions

### 2.1 Verificar que Actions Esté Habilitado

1. Ve a tu repositorio en GitHub
2. Haz clic en **"Settings"** (arriba)
3. En el menú lateral, haz clic en **"Actions"** → **"General"**
4. En **"Actions permissions"**, selecciona:
   - ✅ **"Allow all actions and reusable workflows"**
5. Guarda los cambios

### 2.2 Verificar el Workflow

El archivo `.github/workflows/test-estructura.yml` debe estar en tu repositorio.

Para verificar:
```bash
# En tu terminal local
ls -la .github/workflows/
# Debes ver: test-estructura.yml
```

Si no está, asegúrate de que subiste la carpeta `.github/`:
```bash
git add .github/
git commit -m "Add GitHub Actions workflow"
git push
```

### 2.3 Probar que el Workflow Funciona

**Opción A: Crear un PR de prueba**

1. Crea una carpeta de ejemplo:
   ```bash
   mkdir prueba_profesor_1234
   cd prueba_profesor_1234
   # Sigue algunos pasos de INSTRUCCIONES.md para crear estructura básica
   ```

2. Haz commit y push a un nuevo branch:
   ```bash
   git checkout -b test-workflow
   git add .
   git commit -m "Test: verificar workflow"
   git push origin test-workflow
   ```

3. En GitHub, crea un Pull Request desde `test-workflow` hacia `main`
4. Deberías ver que GitHub Actions comienza a ejecutarse automáticamente
5. Puedes cerrar este PR después de verificar

**Opción B: Ver los workflows**

1. Ve a tu repositorio en GitHub
2. Haz clic en la pestaña **"Actions"**
3. Deberías ver el workflow: **"Test Estructura de Directorios"**

---

## 🛡️ Paso 3: Configurar Branch Protection (Opcional pero Recomendado)

Esto evita que se acepten PRs con tests fallidos.

### 3.1 Configurar Reglas

1. Ve a **Settings** → **Branches**
2. En **"Branch protection rules"**, haz clic en **"Add branch protection rule"**
3. Configura:
   - **Branch name pattern:** `main`
   - ✅ **Require a pull request before merging**
   - ✅ **Require status checks to pass before merging**
     - Busca y selecciona: **"test-estructura"**
   - ✅ **Require branches to be up to date before merging**
4. Haz clic en **"Create"** o **"Save changes"**

**Resultado:** Ahora los estudiantes NO podrán mergear sus PRs si los tests fallan.

---

## 👥 Paso 4: Compartir con Estudiantes

### 4.1 Instrucciones para Estudiantes

Comparte el link del repositorio con tus estudiantes:
```
https://github.com/TU-USUARIO/practica-bash-data-engineering
```

Pídeles que:
1. Hagan **Fork** del repositorio
2. Sigan las instrucciones en `README.md`

### 4.2 Verificar Permisos

Asegúrate de que el repositorio sea **Public** para que los estudiantes puedan hacer fork:

1. Ve a **Settings** → **General**
2. En **"Danger Zone"**, verifica que dice **"Change repository visibility"**
3. Si está en Private, cámbialo a Public

---

## 📊 Paso 5: Revisar Pull Requests de Estudiantes

### 5.1 Ver PRs Pendientes

1. Ve a la pestaña **"Pull requests"** en tu repositorio
2. Verás todos los PRs de estudiantes

### 5.2 Revisar un PR

Para cada PR verás:

**✅ Tests pasaron (verde):**
- El estudiante completó correctamente la estructura
- Puedes hacer merge o dejar feedback adicional

**❌ Tests fallaron (rojo):**
- Haz clic en **"Details"** para ver qué falló
- Deja un comentario explicando qué debe corregir
- El estudiante puede corregir y push de nuevo (tests se ejecutan automáticamente)

**🟡 Tests en progreso (amarillo):**
- Espera unos segundos a que terminen

### 5.3 Ver Detalles de los Tests

1. Haz clic en el PR del estudiante
2. Haz clic en **"Checks"** (arriba)
3. Haz clic en **"Test Estructura de Directorios"**
4. Verás el output completo del script `test_estructura.sh`

### 5.4 Descargar la Estructura del Estudiante

Si quieres ver la estructura visualmente:

1. En el PR, haz clic en **"Checks"**
2. Busca **"Artifacts"** al final
3. Descarga **"estructura-arbol"**
4. Es un archivo `.txt` con el árbol completo del proyecto del estudiante

---

## 🧪 Paso 6: Probar el Script Localmente (Opcional)

Si quieres probar el script de tests en tu propia computadora:

```bash
# Clona tu repositorio
git clone https://github.com/TU-USUARIO/practica-bash-data-engineering.git
cd practica-bash-data-engineering

# Crea una carpeta de prueba
mkdir test_profesor_1234
cd test_profesor_1234

# Sigue algunos pasos de INSTRUCCIONES.md
# ...

# Vuelve a raíz y corre tests
cd ..
chmod +x test_estructura.sh
./test_estructura.sh
```

---

## 🔧 Troubleshooting

### Los Actions no se ejecutan

**Problema:** Creas un PR pero no ves que se ejecuten los tests.

**Solución:**
1. Verifica que Actions esté habilitado (Paso 2.1)
2. Verifica que el archivo `.github/workflows/test-estructura.yml` exista
3. Haz push a cualquier branch para activar el workflow

### Los tests fallan con "script not found"

**Problema:** GitHub Actions no encuentra `test_estructura.sh`

**Solución:**
1. Verifica que `test_estructura.sh` está en la raíz del repo
2. Verifica que tiene permisos de ejecución:
   ```bash
   chmod +x test_estructura.sh
   git add test_estructura.sh
   git commit -m "Fix: add execute permission to test script"
   git push
   ```

### Los estudiantes no pueden hacer fork

**Problema:** Los estudiantes no ven el botón "Fork"

**Solución:**
1. El repositorio debe ser **Public**
2. Ve a Settings → General → Danger Zone → Change visibility → Public

### Los tests siempre pasan o siempre fallan

**Problema:** El script no detecta bien las estructuras

**Solución:**
1. Verifica que el script `test_estructura.sh` tenga el código correcto
2. Prueba localmente con una estructura de prueba
3. Revisa los logs en GitHub Actions

---

## 📝 Archivo de Ejemplo: .github/workflows/test-estructura.yml

El archivo debe verse así:

```yaml
name: Test Estructura de Directorios

on:
  pull_request:
    branches: [ main ]
  push:
    branches-ignore:
      - main

jobs:
  test-estructura:
    runs-on: ubuntu-latest
    
    steps:
    - name: 📥 Checkout código
      uses: actions/checkout@v3
      
    - name: 🔍 Verificar estructura de directorios
      run: |
        echo "🧪 Ejecutando tests de estructura..."
        chmod +x test_estructura.sh
        ./test_estructura.sh
      
    - name: 📊 Generar reporte de árbol
      if: success()
      run: |
        echo "📊 Generando reporte de estructura..."
        sudo apt-get update -qq
        sudo apt-get install -y tree
        
        for folder in */data-engineering-project; do
          if [ -d "$folder" ]; then
            student_folder=$(dirname "$folder")
            echo "=== Estructura de $student_folder ===" >> estructura-arbol.txt
            tree -L 4 "$folder" >> estructura-arbol.txt
            echo "" >> estructura-arbol.txt
          fi
        done
        
    - name: 📤 Subir reporte como artifact
      if: always()
      uses: actions/upload-artifact@v3
      with:
        name: estructura-arbol
        path: estructura-arbol.txt
        if-no-files-found: ignore
```

---

## 📊 Estadísticas que Podrás Ver

En cada PR verás:
- ✅ Tests pasados (ej: 80/80)
- ❌ Tests fallidos (ej: 75/80)
- 📁 Número de directorios encontrados (esperado: 28)
- 📄 Número de archivos encontrados (esperado: 50)
- 📊 Porcentaje de éxito (ej: 94%)

---

## 🎯 Resumen

**Flujo completo:**

1. **Tú (profesor):**
   - Creas repo en GitHub
   - Subes archivos
   - Habilitas GitHub Actions
   - Compartes link con estudiantes

2. **Estudiantes:**
   - Hacen fork
   - Crean su branch
   - Siguen INSTRUCCIONES.md
   - Hacen commit/push
   - Crean Pull Request

3. **GitHub Actions (automático):**
   - Se ejecutan tests
   - Muestran resultado ✅ o ❌

4. **Tú (profesor):**
   - Revisas PRs
   - Das feedback si es necesario
   - Haces merge cuando tests pasen

---

## 💡 Tips Adicionales

### Ver todos los PRs de una vez
```bash
# En tu repo, filtra por status
# PRs con tests pasando: label:success
# PRs con tests fallando: label:failure
```

### Exportar calificaciones
Puedes usar la API de GitHub para obtener estadísticas automáticamente o simplemente revisar manualmente cada PR.

### Comunicación con estudiantes
- Deja comentarios en líneas específicas del código si encuentras algo
- Usa emoji para hacer el feedback más amigable ✅❌💡
- Menciona al estudiante con @usuario para notificarle

---

**¡Listo! Tu repositorio está configurado para recibir las prácticas de tus estudiantes con tests automáticos.** 🎓✨

Si tienes preguntas o problemas, revisa la sección de Troubleshooting arriba.
