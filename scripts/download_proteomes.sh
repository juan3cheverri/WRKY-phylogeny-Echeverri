#!/bin/bash
set -euo pipefail

PROJECT="$HOME/WRKY-phylogeny-Echeverri"
RAW="$PROJECT/00_raw"

mkdir -p "$RAW"

AT="$RAW/Athaliana_protein.fa"
OS="$RAW/Osativa_protein.fa"
ZM="$RAW/Zmays_protein.fa"

echo "Descargando proteomas en: $RAW"

if [[ ! -s "$AT" ]]; then
    echo "Descargando Arabidopsis thaliana..."
    curl -L -o "$AT" \
    "https://raw.githubusercontent.com/UniversidadEAFIT/compubiol_course/refs/heads/master/Athaliana_167_protein_primaryTranscriptOnly.fa"
else
    echo "Arabidopsis ya existe, se omite descarga."
fi

if [[ ! -s "$OS" ]]; then
    echo "Descargando Oryza sativa..."
    curl -L -o "$OS" \
    "https://raw.githubusercontent.com/UniversidadEAFIT/compubiol_course/refs/heads/master/Osativa_204_protein_primaryTranscriptOnly.fa"
else
    echo "Oryza ya existe, se omite descarga."
fi

if [[ ! -s "$ZM" ]]; then
    echo "Descargando Zea mays..."
    curl -L -o "${ZM}.gz" \
    "https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-62/fasta/zea_mays/pep/Zea_mays.Zm-B73-REFERENCE-NAM-5.0.pep.all.fa.gz"
    gunzip -f "${ZM}.gz"
else
    echo "Zea mays ya existe, se omite descarga."
fi

echo ""
echo "Conteo de secuencias:"
for f in "$AT" "$OS" "$ZM"; do
    echo "$(basename "$f"): $(grep -c '^>' "$f") secuencias"
done
