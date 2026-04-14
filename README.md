# WRKY phylogeny in Arabidopsis, rice, and maize

Proyecto de filogenia de la familia génica **WRKY** usando secuencias de:

- *Arabidopsis thaliana*
- *Oryza sativa*
- *Zea mays*

El flujo de trabajo identifica secuencias candidatas WRKY a partir de proteomas, genera un conjunto combinado de secuencias, realiza alineamiento múltiple y construye un árbol filogenético de máxima verosimilitud.

## Estructura del proyecto

```text
WRKY-phylogeny-Echeverri/
├── 00_raw/                    # proteomas crudos (no versionados)
├── 01_ids/                    # candidatos WRKY por especie
├── 02_fasta/                  # FASTA combinado
├── 03_alignment/              # alineamiento múltiple
├── 04_tree/
│   └── final/                 # resultados finales del árbol
├── scripts/                   # scripts del workflow
├── .gitignore
└── README.md

