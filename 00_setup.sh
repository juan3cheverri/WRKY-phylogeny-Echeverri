#!/bin/bash
set -e

echo "Actualizando paquetes..."
apt-get update -qq

echo "Instalando herramientas básicas..."
apt-get install -y wget curl unzip git ncbi-blast+ seqtk muscle iqtree

echo "Verificando instalaciones..."
blastp -version || true
seqtk 2>&1 | head -n 2 || true
muscle -version || true
iqtree2 -version || true

echo "Setup completado."
