# 🛠️ Instrucciones Paso a Paso

## 📝 Antes de Empezar

**IMPORTANTE:** Ejecuta cada comando exactamente como se indica. Si un comando falla, lee el mensaje de error cuidadosamente antes de continuar.

**Formato de tu carpeta:** `iniciales_matricula`
- Ejemplo: María López Pérez, matrícula 1809139 → `mlopez_1809139`
- Ejemplo: Juan Carlos Rivera, matrícula 1712345 → `jcrivera_1712345`

---

## 📍 PARTE 1: Preparación y Estructura Principal

### Paso 1: Verificar ubicación inicial
```bash
pwd
# Anota tu ruta actual: ________________________
```

### Paso 2: Ir a tu carpeta personal
```bash
# Reemplaza con TU carpeta (ejemplo: mlopez_1809139)
cd TU_CARPETA_AQUI
pwd
# Debes estar en: .../bash-filesystem/TU_CARPETA
```

### Paso 3: Crear directorio principal del proyecto
```bash
mkdir data-engineering-project
ls
# Debes ver: data-engineering-project
```

### Paso 4: Entrar al proyecto
```bash
cd data-engineering-project
pwd
# Tu ruta ahora debe terminar en: /data-engineering-project
```

### Paso 5: Crear archivos raíz del proyecto
```bash
touch README.md
touch .gitignore
touch requirements.txt
ls -la
# Debes ver 3 archivos (usa -la para ver archivos ocultos como .gitignore)
```

### Paso 6: Crear directorios principales
```bash
mkdir data pipelines config tests logs docs notebooks scripts sql
ls
# Debes ver 9 directorios
```

---

## 📊 PARTE 2: Estructura de Datos (data/)

### Paso 7: Navegar a data y crear README
```bash
cd data
pwd
# Debes estar en: .../data-engineering-project/data
touch README.md
```

### Paso 8: Crear subdirectorios de data
```bash
mkdir raw staging processed
ls
# Debes ver: README.md, raw/, staging/, processed/
```

### Paso 9: Construir carpeta RAW
```bash
cd raw
touch README.md
touch customers.csv
touch transactions.json
touch products.csv
mkdir backup
ls
# Debes ver: 4 archivos + backup/
```

### Paso 10: Crear backups
```bash
cd backup
touch customers_backup.csv
touch transactions_backup.json
ls
# Debes ver 2 archivos
```

### Paso 11: Copiar archivo (práctica de CP)
```bash
# Copiar products.csv desde raw/ hacia backup/
cp ../products.csv ./products_backup.csv
ls
# Ahora debes tener 3 archivos de backup
```

### Paso 12: Navegar a staging
```bash
cd ../../staging
pwd
# Debes estar en: .../data/staging
```

### Paso 13: Crear archivos de staging
```bash
touch README.md
touch customers_cleaned.csv
touch transactions_validated.json
touch products_enriched.csv
mkdir quality_checks
```

### Paso 14: Crear archivos de quality checks
```bash
cd quality_checks
touch validation_report.txt
touch data_profile.json
ls
# Debes ver 2 archivos
```

### Paso 15: Ir a processed
```bash
cd ../../processed
pwd
# Debes estar en: .../data/processed
touch README.md
mkdir analytics reports ml_features
```

### Paso 16: Crear archivos de analytics
```bash
cd analytics
touch sales_summary.csv
touch customer_metrics.csv
ls
# Debes ver 2 archivos CSV
```

### Paso 17: Crear archivos de reports
```bash
cd ../reports
touch monthly_report.csv
touch executive_dashboard.json
ls
# Debes ver 2 archivos
```

### Paso 18: Crear archivos de ML features
```bash
cd ../ml_features
touch training_set.csv
touch feature_importance.json
ls
# Debes ver 2 archivos
```

---

## 🔧 PARTE 3: Pipelines (pipelines/)

### Paso 19: Volver a raíz e ir a pipelines
```bash
cd ~/bash-filesystem/TU_CARPETA/data-engineering-project/pipelines
# O también: cd ../../..
pwd
# Debes estar en: .../pipelines
```

### Paso 20: Crear estructura de pipelines
```bash
touch README.md
mkdir extract transform load
ls
# Debes ver: README.md, extract/, transform/, load/
```

### Paso 21: Scripts de EXTRACT
```bash
cd extract
touch __init__.py
touch extract_from_api.py
touch extract_from_database.py
touch extract_from_files.py
ls
# Debes ver 4 archivos Python
```

### Paso 22: Scripts de TRANSFORM
```bash
cd ../transform
touch __init__.py
touch clean_data.py
touch validate_data.py
touch enrich_data.py
touch aggregate_data.py
ls -1
# Lista vertical: debes ver 5 archivos
```

### Paso 23: Scripts de LOAD
```bash
cd ../load
touch __init__.py
touch load_to_warehouse.py
touch load_to_storage.py
ls
# Debes ver 3 archivos Python
```

---

## ⚙️ PARTE 4: Configuración (config/)

### Paso 24: Crear configuraciones
```bash
cd ../../config
pwd
# Debes estar en: .../config
touch README.md
touch database.yaml
touch pipeline.yaml
touch logging.yaml
mkdir environment
```

### Paso 25: Archivos de ambiente
```bash
cd environment
touch dev.env
touch prod.env
ls
# Debes ver 2 archivos .env
```

---

## ✅ PARTE 5: Tests (tests/)

### Paso 26: Crear tests
```bash
cd ../../tests
touch README.md
touch test_extract.py
touch test_transform.py
touch test_load.py
touch test_data_quality.py
ls
# Debes ver 5 archivos
```

---

## 📝 PARTE 6: Logs (logs/)

### Paso 27: Estructura de logs
```bash
cd ../logs
touch README.md
touch pipeline.log
touch errors.log
mkdir archive
```

### Paso 28: Logs archivados
```bash
cd archive
touch pipeline_2024_01.log
touch pipeline_2024_02.log
ls
# Debes ver 2 archivos de log archivados
```

### Paso 29: Práctica de MV (mover archivo)
```bash
# Crear un log temporal y moverlo a archive
cd ..
touch temp_old.log
ls
# Debes ver temp_old.log aquí
mv temp_old.log archive/pipeline_2024_03.log
ls archive/
# Ahora debe estar en archive/ con nuevo nombre
```

---

## 📚 PARTE 7: Documentación (docs/)

### Paso 30: Crear documentación
```bash
cd ../docs
touch README.md
touch architecture.md
touch data_dictionary.md
touch pipeline_flow.md
mkdir diagrams
```

### Paso 31: Crear diagramas
```bash
cd diagrams
touch data_flow.png
touch architecture.png
ls
# Debes ver 2 archivos .png
```

---

## 📓 PARTE 8: Notebooks (notebooks/)

### Paso 32: Crear notebooks
```bash
cd ../../notebooks
touch README.md
touch 01_exploratory_analysis.ipynb
touch 02_data_quality_check.ipynb
touch 03_feature_engineering.ipynb
ls
# Debes ver 4 archivos (1 README + 3 notebooks)
```

---

## 🛠️ PARTE 9: Scripts (scripts/)

### Paso 33: Scripts de utilidad
```bash
cd ../scripts
touch setup_environment.sh
touch run_pipeline.sh
touch cleanup_old_files.sh
ls -lh
# Debes ver 3 archivos .sh
```

---

## 🗄️ PARTE 10: SQL (sql/)

### Paso 34: Queries SQL
```bash
cd ../sql
touch README.md
touch create_tables.sql
touch insert_data.sql
mkdir queries
```

### Paso 35: Crear queries específicos
```bash
cd queries
touch sales_analysis.sql
touch customer_segmentation.sql
ls
# Debes ver 2 archivos .sql
```

---

## 🧹 PARTE 11: Limpieza (práctica de RM)

### Paso 36: Eliminar archivo de backup innecesario
```bash
cd ~/bash-filesystem/TU_CARPETA/data-engineering-project/data/raw/backup
ls
# Debes ver products_backup.csv
rm products_backup.csv
ls
# Ya NO debe aparecer products_backup.csv
```

### Paso 37: Intentar borrar directorio no vacío
```bash
cd ~/bash-filesystem/TU_CARPETA/data-engineering-project/data/raw
rmdir backup
# Debe dar error: "Directory not empty"
# Esto es CORRECTO - el directorio tiene archivos
```

### Paso 38: Verificar contenido antes de borrar
```bash
ls backup/
# Debes ver los 2 archivos de backup restantes
# NO borres este directorio - es parte de la estructura
```

---

## 🔍 PARTE 12: Verificación Final

### Paso 39: Ver estructura completa
```bash
cd ~/bash-filesystem/TU_CARPETA/data-engineering-project
tree -L 3
# O si no tienes tree:
find . -type d | sort
```

### Paso 40: Contar elementos
```bash
# Contar directorios
find . -type d | wc -l
# Debería dar: 28 directorios (incluyendo .)

# Contar archivos
find . -type f | wc -l
# Debería dar: 50 archivos
```

### Paso 41: Verificar archivos Python
```bash
find . -name "*.py" -type f
# Debes ver todos los scripts .py en pipelines/ y tests/
```

### Paso 42: Verificar archivos de configuración
```bash
find . -name "*.yaml" -o -name "*.env"
# Debes ver 4 archivos YAML y 2 archivos ENV
```

### Paso 43: Listar solo los README
```bash
find . -name "README.md"
# Debes ver 11 archivos README.md
```

---

## 🎓 PARTE 13: Comandos Avanzados (BONUS)

### Paso 44: Buscar archivos CSV
```bash
find . -name "*.csv" | wc -l
# ¿Cuántos archivos CSV creaste? ____
```

### Paso 45: Ver tamaño de directorios
```bash
du -sh */
# Muestra el tamaño de cada directorio principal
```

### Paso 46: Crear lista de inventario
```bash
ls -R > estructura_completa.txt
cat estructura_completa.txt
# Puedes ver tu estructura completa en este archivo
```

---

## ✅ CHECKLIST FINAL

Antes de subir tu trabajo, verifica:

- [ ] Estás en tu carpeta personal (`iniciales_matricula`)
- [ ] 28 directorios totales
- [ ] 50 archivos totales
- [ ] 11 archivos README.md
- [ ] 4 archivos .yaml en config/
- [ ] 12 archivos Python (.py)
- [ ] 2 archivos .env
- [ ] 4 archivos .sql
- [ ] 3 archivos .ipynb
- [ ] 3 archivos .sh
- [ ] products_backup.csv fue eliminado
- [ ] temp_old.log fue movido a archive

---

## 🧪 PARTE 14: Verificación Opcional Local

**OPCIONAL:** Puedes probar tu estructura localmente antes de subir:

### Paso 47: Correr tests locales (opcional)
```bash
# Vuelve a la raíz del repositorio
cd ~/bash-filesystem

# Corre el script de tests
chmod +x test_estructura.sh
./test_estructura.sh
```

Si ves: `🎉 ¡PERFECTO! Todos los tests pasaron` - ¡Excelente!

Si hay errores, léelos cuidadosamente y corrige lo que falta.

**NOTA:** Este paso es opcional. Los tests se ejecutarán **automáticamente** cuando crees tu Pull Request en GitHub.

---

## 🚀 PARTE 15: Subir tu Trabajo a GitHub

### Paso 48: Verificar cambios
```bash
cd ~/bash-filesystem
git status
# Debes ver tu carpeta en "Untracked files"
```

### Paso 49: Agregar archivos
```bash
git add TU_CARPETA/
# Reemplaza TU_CARPETA con tu carpeta real (ej: mlopez_1809139)
git status
# Ahora debes ver archivos en "Changes to be committed"
```

### Paso 50: Hacer commit
```bash
git commit -m "Completar estructura de Data Engineering Project - [TU NOMBRE]"
# Ejemplo: git commit -m "Completar estructura de Data Engineering Project - María López"
```

### Paso 51: Push a tu branch
```bash
git push origin estructura-TU-NOMBRE
# Ejemplo: git push origin estructura-maria-lopez
```

---

## 🎯 PARTE 16: Crear Pull Request y Tests Automáticos

### Paso 52: Ir a GitHub y crear PR

1. Ve al repositorio en GitHub: `https://github.com/upy-next-gen/bash-filesystem`
2. Verás un banner amarillo: **"estructura-TU-NOMBRE had recent pushes"**
3. Haz clic en el botón verde **"Compare & pull request"**
4. En el título escribe: `Práctica Bash - [Tu Nombre] - [Matrícula]`
6. En la descripción (opcional) puedes escribir: "Estructura completa de Data Engineering Project"
7. Haz clic en **"Create pull request"**

### Paso 53: Esperar Tests Automáticos ⚡

**¡Los tests se ejecutarán automáticamente!**

Una vez que crees el Pull Request verás:

1. Un check que dice: **"Some checks haven't completed yet"** 🟡
2. Espera 30-60 segundos
3. El check cambiará a:
   - ✅ **"All checks have passed"** - ¡Perfecto, tu estructura está correcta!
   - ❌ **"Some checks have failed"** - Hay errores, necesitas corregir

### Paso 54a: Si los Tests PASAN ✅

**¡Felicidades!** Tu estructura está perfecta. 

Ahora:
1. Espera a que el profesor revise tu PR
2. El profesor puede dejarte comentarios adicionales o hacer merge directamente
3. Una vez mergeado, ¡has completado la práctica!

### Paso 54b: Si los Tests FALLAN ❌

**No te preocupes**, es normal. Sigue estos pasos:

1. **Ver qué falló:**
   - En tu PR, haz clic en **"Details"** junto al check rojo
   - Verás exactamente qué archivos o directorios faltan

2. **Corregir en tu computadora:**
   ```bash
   # Ve a tu carpeta del proyecto
   cd ~/bash-filesystem/TU_CARPETA/data-engineering-project
   
   # Crea lo que falta según el error
   # Por ejemplo, si falta "data/raw/customers.csv":
   touch data/raw/customers.csv
   ```

3. **Subir la corrección:**
   ```bash
   # Vuelve a la raíz del repo
   cd ~/bash-filesystem
   
   # Agrega los cambios
   git add .
   
   # Haz commit
   git commit -m "Fix: agregar archivos faltantes"
   
   # Push (al mismo branch)
   git push origin estructura-TU-NOMBRE
   ```

4. **Los tests se ejecutan de nuevo automáticamente:**
   - Ve a tu PR en GitHub
   - Los tests comenzarán de nuevo automáticamente
   - Espera el resultado

5. **Repite hasta que pasen todos los tests** ✅

**IMPORTANTE:** NO crees un nuevo PR. Cada push a tu branch actualiza el PR automáticamente.

---

## 💡 Comandos Útiles para Debugging

```bash
# ¿Dónde estoy?
pwd

# ¿Qué hay aquí?
ls -la

# Buscar un archivo
find . -name "nombre_archivo"

# Ver contenido de archivo
cat nombre_archivo

# Volver al inicio del proyecto
cd ~/bash-filesystem/TU_CARPETA/data-engineering-project

# Contar directorios
find . -type d | wc -l

# Contar archivos
find . -type f | wc -l
```

---

## 🎉 ¡Listo!

Una vez que:
- ✅ Todos los tests pasen en GitHub Actions
- ✅ El profesor revise tu PR
- ✅ Se haga merge

**¡Habrás completado exitosamente la práctica!** 🚀

Has aprendido:
- Navegación en bash
- Crear estructuras complejas
- Usar Git y GitHub
- Trabajar con tests automáticos
- Organización profesional de proyectos de datos

---

**¿Dudas?** Pregunta en el canal de Slack o en Office Hours.

**¡Éxito en tu práctica! 💪**
