# 🌳 Estructura Visual del Proyecto

Este archivo muestra cómo debe verse tu estructura completa.

## Estructura Completa

```
tu_carpeta/                                # Ejemplo: mlopez_1809139/
└── data-engineering-project/
    ├── README.md
    ├── .gitignore
    ├── requirements.txt
    │
    ├── data/
    │   ├── README.md
    │   ├── raw/                           # 📦 Bronze Layer - Datos crudos
    │   │   ├── README.md
    │   │   ├── customers.csv
    │   │   ├── transactions.json
    │   │   ├── products.csv
    │   │   └── backup/
    │   │       ├── customers_backup.csv
    │   │       └── transactions_backup.json
    │   │
    │   ├── staging/                       # 🔄 Silver Layer - Datos en proceso
    │   │   ├── README.md
    │   │   ├── customers_cleaned.csv
    │   │   ├── transactions_validated.json
    │   │   ├── products_enriched.csv
    │   │   └── quality_checks/
    │   │       ├── validation_report.txt
    │   │       └── data_profile.json
    │   │
    │   └── processed/                     # ✨ Gold Layer - Datos finales
    │       ├── README.md
    │       ├── analytics/
    │       │   ├── sales_summary.csv
    │       │   └── customer_metrics.csv
    │       ├── reports/
    │       │   ├── monthly_report.csv
    │       │   └── executive_dashboard.json
    │       └── ml_features/
    │           ├── training_set.csv
    │           └── feature_importance.json
    │
    ├── pipelines/                         # 🔧 ETL: Extract-Transform-Load
    │   ├── README.md
    │   ├── extract/
    │   │   ├── __init__.py
    │   │   ├── extract_from_api.py
    │   │   ├── extract_from_database.py
    │   │   └── extract_from_files.py
    │   ├── transform/
    │   │   ├── __init__.py
    │   │   ├── clean_data.py
    │   │   ├── validate_data.py
    │   │   ├── enrich_data.py
    │   │   └── aggregate_data.py
    │   └── load/
    │       ├── __init__.py
    │       ├── load_to_warehouse.py
    │       └── load_to_storage.py
    │
    ├── config/                            # ⚙️ Configuraciones
    │   ├── README.md
    │   ├── database.yaml
    │   ├── pipeline.yaml
    │   ├── logging.yaml
    │   └── environment/
    │       ├── dev.env
    │       └── prod.env
    │
    ├── tests/                             # ✅ Pruebas automatizadas
    │   ├── README.md
    │   ├── test_extract.py
    │   ├── test_transform.py
    │   ├── test_load.py
    │   └── test_data_quality.py
    │
    ├── logs/                              # 📝 Registros de ejecución
    │   ├── README.md
    │   ├── pipeline.log
    │   ├── errors.log
    │   └── archive/
    │       ├── pipeline_2024_01.log
    │       ├── pipeline_2024_02.log
    │       └── pipeline_2024_03.log
    │
    ├── docs/                              # 📚 Documentación
    │   ├── README.md
    │   ├── architecture.md
    │   ├── data_dictionary.md
    │   ├── pipeline_flow.md
    │   └── diagrams/
    │       ├── data_flow.png
    │       └── architecture.png
    │
    ├── notebooks/                         # 📓 Jupyter Notebooks
    │   ├── README.md
    │   ├── 01_exploratory_analysis.ipynb
    │   ├── 02_data_quality_check.ipynb
    │   └── 03_feature_engineering.ipynb
    │
    ├── scripts/                           # 🛠️ Scripts utilitarios
    │   ├── setup_environment.sh
    │   ├── run_pipeline.sh
    │   └── cleanup_old_files.sh
    │
    └── sql/                               # 🗄️ Queries SQL
        ├── README.md
        ├── create_tables.sql
        ├── insert_data.sql
        └── queries/
            ├── sales_analysis.sql
            └── customer_segmentation.sql
```

---

## 📊 Conteo de Elementos

- **Directorios:** 28 (incluyendo el directorio raíz)
- **Archivos:** 50
- **Archivos README.md:** 11
- **Archivos Python (.py):** 12
- **Archivos YAML (.yaml):** 4
- **Archivos ENV (.env):** 2
- **Archivos SQL (.sql):** 4
- **Archivos Notebook (.ipynb):** 3
- **Archivos Shell (.sh):** 3
- **Archivos CSV:** 9
- **Archivos JSON:** 5

---

## 🎯 Propósito de Cada Carpeta

### 📦 data/
Almacena todos los datos del proyecto en 3 capas (Bronze-Silver-Gold):
- **raw/** - Datos sin procesar tal como llegan
- **staging/** - Datos en proceso de limpieza
- **processed/** - Datos listos para análisis

### 🔧 pipelines/
Contiene los scripts que procesan los datos:
- **extract/** - Extrae datos de fuentes externas
- **transform/** - Limpia, valida y transforma
- **load/** - Carga datos al destino final

### ⚙️ config/
Archivos de configuración del proyecto:
- Variables de entorno
- Configuraciones de base de datos
- Parámetros del pipeline

### ✅ tests/
Pruebas automatizadas del código:
- Asegura que el código funciona correctamente
- Previene errores

### 📝 logs/
Registros de ejecución:
- Ayuda a debuggear problemas
- Mantiene historial de actividad

### 📚 docs/
Documentación técnica:
- Explica cómo funciona el proyecto
- Facilita el mantenimiento

### 📓 notebooks/
Jupyter notebooks para análisis:
- Exploración de datos
- Visualizaciones
- Experimentación

### 🛠️ scripts/
Scripts de automatización:
- Setup de ambiente
- Tareas de mantenimiento

### 🗄️ sql/
Queries de bases de datos:
- Creación de tablas
- Análisis de datos

---

## 💡 Verificación Rápida

Para verificar tu estructura rápidamente:

```bash
# Contar directorios (debe dar 28)
find . -type d | wc -l

# Contar archivos (debe dar 50)
find . -type f | wc -l

# Listar todos los README (debe dar 11)
find . -name "README.md"

# Verificar archivos Python (debe dar 12)
find . -name "*.py" | wc -l
```

---

**¡Esta es la estructura profesional que estarás creando! 🚀**
