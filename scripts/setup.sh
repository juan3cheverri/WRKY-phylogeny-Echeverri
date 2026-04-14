#!/bin/bash
set -euo pipefail

PROJECT="$HOME/WRKY-phylogeny-Echeverri"

mkdir -p "$PROJECT"/{00_raw,01_ids,02_fasta,03_alignment,04_tree,scripts,logs}

echo "Proyecto ubicado en: $PROJECT"
echo "Estructura creada correctamente."

if command -v conda >/dev/null 2>&1; then
    echo "Conda detectado."
else
    echo "Conda no está disponible en esta terminal."
fi
