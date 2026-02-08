#!/bin/bash

# ============================================
# Script de Verificación de Estructura
# Curso: Introducción a la Ingeniería de Datos
# Profesor: Max Pinelo - UPY
# ============================================

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

PASSED=0
FAILED=0
TOTAL=0
STUDENT_FOLDER=""

# ============================================
# FUNCIONES DE TEST
# ============================================

test_file() {
    TOTAL=$((TOTAL + 1))
    local file="$1"
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓ PASS${NC}: Archivo $file"
        PASSED=$((PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}: Archivo $file NO existe"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

test_dir() {
    TOTAL=$((TOTAL + 1))
    local dir="$1"
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓ PASS${NC}: Directorio $dir"
        PASSED=$((PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}: Directorio $dir NO existe"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

test_not_exists() {
    TOTAL=$((TOTAL + 1))
    local item="$1"
    if [ ! -e "$item" ]; then
        echo -e "${GREEN}✓ PASS${NC}: $item fue eliminado correctamente"
        PASSED=$((PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}: $item NO fue eliminado (debería no existir)"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

test_file_count() {
    local dir=$1
    local expected=$2
    local actual=$(find "$dir" -type f 2>/dev/null | wc -l)
    TOTAL=$((TOTAL + 1))
    
    if [ "$actual" -eq "$expected" ]; then
        echo -e "${GREEN}✓ PASS${NC}: $dir tiene $expected archivos"
        PASSED=$((PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}: $dir tiene $actual archivos (esperados: $expected)"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

# ============================================
# HEADER
# ============================================

clear
echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}🧪 TESTS: Data Engineering Project${NC}"
echo -e "${CYAN}=============================================${NC}"
echo ""
echo -e "${YELLOW}Universidad Politécnica de Yucatán${NC}"
echo -e "${YELLOW}Introducción a la Ingeniería de Datos${NC}"
echo ""

# ============================================
# BUSCAR CARPETA DEL ESTUDIANTE
# ============================================

echo -e "${BLUE}📁 Buscando tu carpeta de estudiante...${NC}"
echo ""

# Buscar carpetas que coincidan con el patrón: iniciales_matricula
folders=$(find . -maxdepth 1 -type d -name "*_*" | grep -v "^\.$" | sed 's|^\./||')

if [ -z "$folders" ]; then
    echo -e "${RED}❌ ERROR: No se encontró ninguna carpeta con formato iniciales_matricula${NC}"
    echo ""
    echo "Formato esperado: iniciales_matricula"
    echo "Ejemplos: mlopez_1809139, jrivera_1712345"
    echo ""
    echo "Asegúrate de crear tu carpeta con el formato correcto."
    exit 1
fi

# Contar carpetas encontradas
folder_count=$(echo "$folders" | wc -l)

if [ $folder_count -gt 1 ]; then
    echo -e "${YELLOW}⚠️  Se encontraron múltiples carpetas:${NC}"
    echo "$folders"
    echo ""
    echo -e "${YELLOW}Por favor especifica cuál carpeta quieres probar:${NC}"
    select folder in $folders; do
        STUDENT_FOLDER="$folder"
        break
    done
else
    STUDENT_FOLDER="$folders"
fi

echo ""
echo -e "${GREEN}✓ Carpeta seleccionada: $STUDENT_FOLDER${NC}"
echo ""

# Verificar que existe data-engineering-project dentro
if [ ! -d "$STUDENT_FOLDER/data-engineering-project" ]; then
    echo -e "${RED}❌ ERROR: No se encuentra data-engineering-project/ dentro de $STUDENT_FOLDER${NC}"
    echo ""
    echo "Estructura esperada:"
    echo "$STUDENT_FOLDER/"
    echo "  └── data-engineering-project/"
    echo ""
    exit 1
fi

cd "$STUDENT_FOLDER/data-engineering-project" || exit 1

echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}Iniciando tests en: $STUDENT_FOLDER${NC}"
echo -e "${CYAN}=============================================${NC}"
echo ""

# ============================================
# TESTS: ROOT FILES
# ============================================

echo -e "${BLUE}📄 Testeando archivos raíz...${NC}"
test_file "README.md"
test_file ".gitignore"
test_file "requirements.txt"
echo ""

# ============================================
# TESTS: MAIN DIRECTORIES
# ============================================

echo -e "${BLUE}📁 Testeando directorios principales...${NC}"
test_dir "data"
test_dir "pipelines"
test_dir "config"
test_dir "tests"
test_dir "logs"
test_dir "docs"
test_dir "notebooks"
test_dir "scripts"
test_dir "sql"
echo ""

# ============================================
# TESTS: DATA STRUCTURE
# ============================================

echo -e "${BLUE}📊 Testeando estructura data/...${NC}"
test_file "data/README.md"
test_dir "data/raw"
test_dir "data/staging"
test_dir "data/processed"
echo ""

echo -e "${BLUE}📊 Testeando data/raw/...${NC}"
test_file "data/raw/README.md"
test_file "data/raw/customers.csv"
test_file "data/raw/transactions.json"
test_file "data/raw/products.csv"
test_dir "data/raw/backup"
test_file "data/raw/backup/customers_backup.csv"
test_file "data/raw/backup/transactions_backup.json"
echo ""

echo -e "${BLUE}📊 Testeando data/staging/...${NC}"
test_file "data/staging/README.md"
test_file "data/staging/customers_cleaned.csv"
test_file "data/staging/transactions_validated.json"
test_file "data/staging/products_enriched.csv"
test_dir "data/staging/quality_checks"
test_file "data/staging/quality_checks/validation_report.txt"
test_file "data/staging/quality_checks/data_profile.json"
echo ""

echo -e "${BLUE}📊 Testeando data/processed/...${NC}"
test_file "data/processed/README.md"
test_dir "data/processed/analytics"
test_dir "data/processed/reports"
test_dir "data/processed/ml_features"
test_file "data/processed/analytics/sales_summary.csv"
test_file "data/processed/analytics/customer_metrics.csv"
test_file "data/processed/reports/monthly_report.csv"
test_file "data/processed/reports/executive_dashboard.json"
test_file "data/processed/ml_features/training_set.csv"
test_file "data/processed/ml_features/feature_importance.json"
echo ""

# ============================================
# TESTS: PIPELINES
# ============================================

echo -e "${BLUE}🔧 Testeando estructura pipelines/...${NC}"
test_file "pipelines/README.md"
test_dir "pipelines/extract"
test_dir "pipelines/transform"
test_dir "pipelines/load"
echo ""

echo -e "${BLUE}🔧 Testeando pipelines/extract/...${NC}"
test_file "pipelines/extract/__init__.py"
test_file "pipelines/extract/extract_from_api.py"
test_file "pipelines/extract/extract_from_database.py"
test_file "pipelines/extract/extract_from_files.py"
echo ""

echo -e "${BLUE}🔧 Testeando pipelines/transform/...${NC}"
test_file "pipelines/transform/__init__.py"
test_file "pipelines/transform/clean_data.py"
test_file "pipelines/transform/validate_data.py"
test_file "pipelines/transform/enrich_data.py"
test_file "pipelines/transform/aggregate_data.py"
echo ""

echo -e "${BLUE}🔧 Testeando pipelines/load/...${NC}"
test_file "pipelines/load/__init__.py"
test_file "pipelines/load/load_to_warehouse.py"
test_file "pipelines/load/load_to_storage.py"
echo ""

# ============================================
# TESTS: CONFIG
# ============================================

echo -e "${BLUE}⚙️ Testeando estructura config/...${NC}"
test_file "config/README.md"
test_file "config/database.yaml"
test_file "config/pipeline.yaml"
test_file "config/logging.yaml"
test_dir "config/environment"
test_file "config/environment/dev.env"
test_file "config/environment/prod.env"
echo ""

# ============================================
# TESTS: TESTS
# ============================================

echo -e "${BLUE}✅ Testeando estructura tests/...${NC}"
test_file "tests/README.md"
test_file "tests/test_extract.py"
test_file "tests/test_transform.py"
test_file "tests/test_load.py"
test_file "tests/test_data_quality.py"
echo ""

# ============================================
# TESTS: LOGS
# ============================================

echo -e "${BLUE}📝 Testeando estructura logs/...${NC}"
test_file "logs/README.md"
test_file "logs/pipeline.log"
test_file "logs/errors.log"
test_dir "logs/archive"
test_file "logs/archive/pipeline_2024_01.log"
test_file "logs/archive/pipeline_2024_02.log"
test_file "logs/archive/pipeline_2024_03.log"
echo ""

# ============================================
# TESTS: DOCS
# ============================================

echo -e "${BLUE}📚 Testeando estructura docs/...${NC}"
test_file "docs/README.md"
test_file "docs/architecture.md"
test_file "docs/data_dictionary.md"
test_file "docs/pipeline_flow.md"
test_dir "docs/diagrams"
test_file "docs/diagrams/data_flow.png"
test_file "docs/diagrams/architecture.png"
echo ""

# ============================================
# TESTS: NOTEBOOKS
# ============================================

echo -e "${BLUE}📓 Testeando estructura notebooks/...${NC}"
test_file "notebooks/README.md"
test_file "notebooks/01_exploratory_analysis.ipynb"
test_file "notebooks/02_data_quality_check.ipynb"
test_file "notebooks/03_feature_engineering.ipynb"
echo ""

# ============================================
# TESTS: SCRIPTS
# ============================================

echo -e "${BLUE}🛠️ Testeando estructura scripts/...${NC}"
test_file "scripts/setup_environment.sh"
test_file "scripts/run_pipeline.sh"
test_file "scripts/cleanup_old_files.sh"
echo ""

# ============================================
# TESTS: SQL
# ============================================

echo -e "${BLUE}🗄️ Testeando estructura sql/...${NC}"
test_file "sql/README.md"
test_file "sql/create_tables.sql"
test_file "sql/insert_data.sql"
test_dir "sql/queries"
test_file "sql/queries/sales_analysis.sql"
test_file "sql/queries/customer_segmentation.sql"
echo ""

# ============================================
# TESTS: DELETION & MOVES
# ============================================

echo -e "${BLUE}🧹 Testeando eliminaciones y movimientos...${NC}"
test_not_exists "data/raw/backup/products_backup.csv"
test_not_exists "logs/temp_old.log"
echo ""

# ============================================
# TESTS: COUNTS
# ============================================

echo -e "${BLUE}📊 Testeando conteos...${NC}"

total_files=$(find . -type f 2>/dev/null | wc -l)
total_dirs=$(find . -type d 2>/dev/null | wc -l)

echo -e "${CYAN}Total archivos encontrados: $total_files (esperados: 50)${NC}"
echo -e "${CYAN}Total directorios encontrados: $total_dirs (esperados: 28)${NC}"

TOTAL=$((TOTAL + 2))
if [ "$total_files" -eq 50 ]; then
    echo -e "${GREEN}✓ PASS${NC}: Número correcto de archivos (50)"
    PASSED=$((PASSED + 1))
else
    echo -e "${RED}✗ FAIL${NC}: Número incorrecto de archivos (esperados: 50, encontrados: $total_files)"
    FAILED=$((FAILED + 1))
fi

if [ "$total_dirs" -eq 28 ]; then
    echo -e "${GREEN}✓ PASS${NC}: Número correcto de directorios (28)"
    PASSED=$((PASSED + 1))
else
    echo -e "${RED}✗ FAIL${NC}: Número incorrecto de directorios (esperados: 28, encontrados: $total_dirs)"
    FAILED=$((FAILED + 1))
fi

echo ""

# ============================================
# SUMMARY
# ============================================

echo -e "${CYAN}=============================================${NC}"
echo -e "${CYAN}📊 RESULTADOS FINALES${NC}"
echo -e "${CYAN}=============================================${NC}"
echo ""
echo -e "${BLUE}Carpeta del estudiante: ${YELLOW}$STUDENT_FOLDER${NC}"
echo ""
echo -e "Total de tests: ${MAGENTA}$TOTAL${NC}"
echo -e "${GREEN}Pasados: $PASSED${NC}"
echo -e "${RED}Fallidos: $FAILED${NC}"
echo ""

# Calculate percentage
if [ $TOTAL -gt 0 ]; then
    percentage=$((PASSED * 100 / TOTAL))
    echo -e "Porcentaje: ${CYAN}$percentage%${NC}"
    echo ""
fi

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}🎉 ¡PERFECTO! Todos los tests pasaron ✨${NC}"
    echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}Tu estructura está completa y correcta.${NC}"
    echo ""
    echo -e "${CYAN}Siguiente paso:${NC}"
    echo "1. Vuelve a la raíz del repo: cd ../.."
    echo "2. Haz commit: git add . && git commit -m 'Completar estructura'"
    echo "3. Push: git push origin tu-branch"
    echo "4. Crea tu Pull Request en GitHub"
    echo ""
    exit 0
else
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${RED}❌ Hay $FAILED errores en la estructura${NC}"
    echo -e "${RED}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}Revisa los tests fallidos arriba ⬆️${NC}"
    echo ""
    echo -e "${CYAN}Tips para debugging:${NC}"
    echo "• Lee cuidadosamente cada mensaje de error"
    echo "• Verifica nombres de archivos (case-sensitive)"
    echo "• Usa: find . -name 'nombre_archivo' para buscar"
    echo "• Usa: pwd para verificar dónde estás"
    echo "• Revisa INSTRUCCIONES.md paso por paso"
    echo ""
    exit 1
fi
