#!/bin/bash
set -euo pipefail

PROJECT="/content/WRKY-phylogeny-Echeverri"

mkdir -p "$PROJECT"/{00_raw,01_ids,02_seqtk,03_blast,04_alignment,05_iqtree,logs,scripts,figures}

echo "Proyecto ubicado en: $PROJECT"
echo "Carpetas creadas correctamente."

ls -la "$PROJECT"
