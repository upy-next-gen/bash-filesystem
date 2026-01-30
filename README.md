# 🏗️ Práctica: Data Engineering Project - Navegación en Bash

## 📚 Curso
**Introducción a la Ingeniería de Datos**  
Universidad Politécnica de Yucatán (UPY)  
Profesor: Max Pinelo

---

## 🎯 Objetivo

Aprender a navegar y crear estructuras de directorios en bash, desarrollando un **"mapa mental"** del sistema de archivos mediante la construcción de la estructura de un proyecto real de Data Engineering.

Al finalizar esta práctica dominarás los comandos esenciales de bash y entenderás cómo se organiza un proyecto profesional de datos.

---

## 📂 Estructura que Crearás

Construirás una estructura completa de 28 directorios y 50 archivos que replica un proyecto real de Data Engineering:

```
tu-carpeta/
└── data-engineering-project/
    ├── data/                    # Datos en 3 capas (Bronze-Silver-Gold)
    ├── pipelines/               # Scripts ETL (Extract-Transform-Load)
    ├── config/                  # Configuraciones
    ├── tests/                   # Pruebas automatizadas
    ├── logs/                    # Bitácoras
    ├── docs/                    # Documentación
    ├── notebooks/               # Jupyter notebooks
    ├── scripts/                 # Scripts de utilidad
    └── sql/                     # Queries SQL
```

---

## 🚀 Instrucciones

### Paso 1: Clona el Repositorio

Clona el repositorio a tu computadora:
```bash
git clone https://github.com/upy-next-gen/bash-filesystem.git
cd bash-filesystem
```

### Paso 2: Crea tu Branch

Crea un branch con tu nombre:

```bash
git checkout -b estructura-TU-NOMBRE
# Ejemplo: git checkout -b estructura-maria-lopez
```

### Paso 3: Crea tu Carpeta Personal

**IMPORTANTE:** Crea una carpeta con el formato: `iniciales_matricula`

**Formato:** Primera letra de tu nombre + apellido + underscore + matrícula

**Ejemplos:**
- Maximiliano Pinelo, matrícula 1809139 → `mpinelo_1809139/`
- María López García, matrícula 2012345 → `mlopez_2012345/`
- Juan Carlos Pérez, matrícula 1998765 → `jcperez_1998765/`

```bash
# Reemplaza con tus datos
mkdir iniciales_matricula
cd iniciales_matricula
```

**📝 Ejemplo completo:**
```bash
mkdir mpinelo_1809139
cd mpinelo_1809139
```

### Paso 4: Sigue las Instrucciones Detalladas

Dentro de tu carpeta, sigue **TODAS** las instrucciones del archivo [`INSTRUCCIONES.md`](INSTRUCCIONES.md).

Este archivo contiene **50 pasos** que te guiarán para:
- Crear toda la estructura de directorios
- Crear todos los archivos necesarios
- Practicar TODOS los comandos de bash
- Usar: `pwd`, `cd`, `ls`, `mkdir`, `rmdir`, `touch`, `cp`, `mv`, `rm`

### Paso 5: (Opcional) Prueba Localmente

**Opcional pero recomendado:** Puedes probar tu estructura antes de subir:

```bash
# Vuelve a la raíz del repositorio
cd ../..

# Corre los tests
chmod +x test_estructura.sh
./test_estructura.sh
```

**Nota:** No es obligatorio ejecutar los tests localmente. Los tests se ejecutarán **automáticamente** cuando crees tu Pull Request en GitHub.

### Paso 6: Sube tu Trabajo

```bash
git add .
git commit -m "Completar estructura de Data Engineering Project - [TU NOMBRE]"
git push origin estructura-TU-NOMBRE
```

### Paso 7: Crea un Pull Request

1. Ve al repositorio en GitHub: https://github.com/upy-next-gen/bash-filesystem
2. Verás un botón **"Compare & pull request"** - haz clic
3. En el título del PR escribe: `Práctica Bash - [Tu Nombre] - [Matrícula]`
4. Haz clic en **"Create pull request"**

### Paso 8: Espera los Tests Automáticos ⚡

**¡Los tests se ejecutarán automáticamente!**

Una vez que crees el Pull Request:
1. GitHub Actions ejecutará `test_estructura.sh` automáticamente
2. Verás un check ✅ verde si todo está bien
3. Verás un ❌ rojo si hay errores

**Si los tests fallan:**
1. Haz clic en "Details" para ver qué falló
2. Lee los errores cuidadosamente
3. Corrige en tu computadora
4. Haz commit y push de nuevo
5. Los tests se volverán a ejecutar automáticamente

**No necesitas crear un nuevo PR** - los cambios en tu branch actualizan el PR automáticamente.

---

## ✅ Criterios de Éxito

Para que tu práctica sea considerada completa, debes cumplir:

- [ ] Carpeta personal con formato correcto: `iniciales_matricula/`
- [ ] 28 directorios creados correctamente
- [ ] 50 archivos creados correctamente
- [ ] Archivo `products_backup.csv` eliminado (de `data/raw/backup/`)
- [ ] Archivo `temp_old.log` movido a `logs/archive/` como `pipeline_2024_03.log`
- [ ] **Todos los tests pasan en GitHub Actions** ✅ (80+ tests)
- [ ] Pull Request creado con título correcto

---

## 📋 Comandos que Practicarás

Durante esta práctica usarás todos estos comandos:

| Comando | Descripción | Ejemplo |
|---------|-------------|---------|
| `pwd` | Mostrar directorio actual | `pwd` |
| `cd [dir]` | Cambiar de directorio | `cd ~/Documents` |
| `ls [options]` | Listar contenido | `ls -la` |
| `mkdir [dir]` | Crear directorio | `mkdir proyecto` |
| `mkdir -p [path]` | Crear estructura completa | `mkdir -p a/b/c` |
| `rmdir [dir]` | Eliminar directorio vacío | `rmdir carpeta` |
| `touch [file]` | Crear archivo | `touch README.md` |
| `cp [src] [dst]` | Copiar archivo | `cp file.txt backup.txt` |
| `mv [src] [dst]` | Mover/renombrar | `mv old.txt new.txt` |
| `rm [file]` | Eliminar archivo | `rm archivo.txt` |
| `rm -rf [dir]` | Eliminar directorio y contenido | `rm -rf carpeta/` |

---

## 🗂️ Arquitectura del Proyecto

### Capas de Datos (Medallion Architecture)

Tu proyecto sigue la arquitectura **Bronze → Silver → Gold**:

```
data/
├── raw/          # 🥉 Bronze: Datos crudos sin procesar
├── staging/      # 🥈 Silver: Datos limpios y validados
└── processed/    # 🥇 Gold: Datos listos para análisis
```

### Pipeline ETL

```
pipelines/
├── extract/      # 📥 Extracción de datos
├── transform/    # 🔧 Transformación y limpieza
└── load/         # 📤 Carga a destino final
```

---

## 🤖 Tests Automáticos

### ¿Cómo Funcionan?

Cuando creas tu Pull Request, GitHub Actions ejecuta automáticamente:

1. **Búsqueda de tu carpeta** - Encuentra tu carpeta `iniciales_matricula/`
2. **Validación de estructura** - Verifica que existan todos los directorios
3. **Validación de archivos** - Verifica que existan todos los archivos
4. **Validación de eliminaciones** - Verifica que eliminaste lo correcto
5. **Validación de movimientos** - Verifica que moviste archivos correctamente
6. **Conteo total** - Cuenta 28 dirs y 50 archivos

### ¿Qué Verás?

En tu Pull Request aparecerá:

- ✅ **Verde** = Todos los tests pasaron - ¡Perfecto!
- ❌ **Rojo** = Algunos tests fallaron - Necesitas corregir
- 🟡 **Amarillo** = Tests en progreso - Espera unos segundos

### Si los Tests Fallan

Haz clic en **"Details"** junto al check rojo para ver:
- Qué archivos faltan
- Qué directorios faltan
- Qué archivos no se eliminaron
- Número exacto de elementos encontrados vs esperados

---

## 🆘 Ayuda y Recursos

### ¿Perdido? Usa estos comandos

```bash
# ¿Dónde estoy?
pwd

# ¿Qué hay aquí?
ls -la

# ¿Dónde está ese archivo?
find . -name "archivo.txt"

# Ver toda tu estructura
tree data-engineering-project/
# O si no tienes tree:
find data-engineering-project/ -type d | sort
```

### Rutas Especiales en Bash

| Símbolo | Significado |
|---------|-------------|
| `~` | Tu home directory |
| `.` | Directorio actual |
| `..` | Directorio padre (un nivel arriba) |
| `/` | Raíz del sistema |

### Tips Importantes

1. **Usa Tab para autocompletar** - Escribe las primeras letras y presiona Tab
2. **Usa las flechas ↑ ↓** - Para navegar por comandos anteriores
3. **Lee los errores** - Los mensajes de error te dicen qué salió mal
4. **Verifica con `ls`** - Después de cada paso, lista para verificar

---

## 🐛 Troubleshooting

### "Directory not empty" al hacer rmdir
```bash
# rmdir solo funciona con carpetas vacías
# Primero elimina el contenido o usa:
rm -rf directorio/
```

### "No such file or directory"
```bash
# Verifica que estás en el directorio correcto
pwd
# Y que el archivo/carpeta exista
ls -la
```

### Los tests fallan en GitHub
```bash
# 1. Haz clic en "Details" en el Pull Request
# 2. Lee BIEN el mensaje de error
# 3. Corrige en tu computadora
# 4. Haz git add, commit y push
# 5. Los tests se ejecutarán automáticamente de nuevo
```

### No veo el botón de tests en mi PR
```bash
# Asegúrate de que GitHub Actions esté habilitado:
# 1. Ve a tu repositorio en GitHub
# 2. Click en "Settings" > "Actions" > "General"
# 3. Selecciona "Allow all actions and reusable workflows"
```

---

## 📊 Estadísticas del Proyecto

- **Total de directorios:** 28
- **Total de archivos:** 50
- **Archivos Python (.py):** 12
- **Archivos de configuración (.yaml, .env):** 6
- **Archivos SQL (.sql):** 4
- **Notebooks (.ipynb):** 3
- **Scripts Shell (.sh):** 3
- **Archivos README.md:** 11

---

## 🎓 Lo que Aprenderás

Después de completar esta práctica habrás aprendido:

1. ✅ Navegar con confianza en el sistema de archivos Unix/Linux
2. ✅ Crear estructuras complejas de directorios
3. ✅ Manipular archivos (crear, copiar, mover, eliminar)
4. ✅ Entender la organización de un proyecto profesional de datos
5. ✅ Usar rutas absolutas y relativas
6. ✅ Aplicar la arquitectura Medallion (Bronze-Silver-Gold)
7. ✅ Comprender el flujo ETL en Data Engineering
8. ✅ Trabajar con Git y GitHub para control de versiones
9. ✅ Usar GitHub Actions para tests automáticos
