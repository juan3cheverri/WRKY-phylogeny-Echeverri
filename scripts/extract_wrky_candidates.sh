#!/bin/bash
set -euo pipefail

PROJECT="$HOME/WRKY-phylogeny-Echeverri"
RAW="$PROJECT/00_raw"
IDS="$PROJECT/01_ids"

mkdir -p "$IDS"

AT="$RAW/Athaliana_protein.fa"
OS="$RAW/Osativa_protein.fa"
ZM="$RAW/Zmays_protein.fa"

echo "Extrayendo headers WRKY de maiz..."
grep '^>' "$ZM" | grep -i 'WRKY' > "$IDS/Zmays_wrky_headers.txt"

echo "Extrayendo secuencias candidatas por motivo WRKY en Arabidopsis..."
awk '
BEGIN{RS=">"; ORS=""}
NR>1{
  rec=">"$0
  if (toupper(rec) ~ /WRKYGQK|WRKYGKK|WRKYGEK/) print rec
}
' "$AT" > "$IDS/Athaliana_wrky_candidates.fa"

echo "Extrayendo secuencias candidatas por motivo WRKY en arroz..."
awk '
BEGIN{RS=">"; ORS=""}
NR>1{
  rec=">"$0
  if (toupper(rec) ~ /WRKYGQK|WRKYGKK|WRKYGEK/) print rec
}
' "$OS" > "$IDS/Osativa_wrky_candidates.fa"

echo "Extrayendo secuencias candidatas por header WRKY en maiz..."
awk '
BEGIN{RS=">"; ORS=""}
NR>1{
  rec=">"$0
  header=substr(rec,1,index(rec,"\n")-1)
  if (header ~ /WRKY|wrky/) print rec
}
' "$ZM" > "$IDS/Zmays_wrky_candidates.fa"

echo ""
echo "Resumen:"
echo "Arabidopsis candidatos: $(grep -c '^>' "$IDS/Athaliana_wrky_candidates.fa")"
echo "Oryza candidatos: $(grep -c '^>' "$IDS/Osativa_wrky_candidates.fa")"
echo "Zea mays candidatos: $(grep -c '^>' "$IDS/Zmays_wrky_candidates.fa")"
