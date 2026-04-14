#!/bin/bash
set -euo pipefail

PROJECT="$HOME/WRKY-phylogeny-Echeverri"
FASTA="$PROJECT/02_fasta/WRKY_all_species.fa"
ALIGN_DIR="$PROJECT/03_alignment"
TREE_DIR="$PROJECT/04_tree"

mkdir -p "$ALIGN_DIR" "$TREE_DIR"

ALN="$ALIGN_DIR/WRKY_all_species_aligned.fa"

echo "Activando ambiente phylo..."
source /home/juan/yes/etc/profile.d/conda.sh
conda activate phylo

echo "Iniciando alineamiento con MAFFT..."
mafft --auto "$FASTA" > "$ALN"

echo "Alineamiento terminado:"
ls -lh "$ALN"

echo "Construyendo arbol con IQ-TREE..."
cd "$TREE_DIR"
iqtree2 -s "$ALN" -m MFP -bb 1000 -alrt 1000 -nt AUTO

echo ""
echo "Analisis terminado. Archivos generados en:"
echo "$TREE_DIR"
ls -lh "$TREE_DIR"
