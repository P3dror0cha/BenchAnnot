# BenchAnnot

A Nextflow pipeline to run genome annotation on FASTA assemblies.

## Purpose

- Orchestrate annotation tools and produce reproducible results for benchmarking and downstream analysis.

## Inputs

- Put FASTA files (`.fna`) in the `data/` directory.

## Outputs

- Per-sample annotation directories under `results/module/sample>_module/`, where `module` is the tool used and `sample` is the genome used.

## Requirements

- Nextflow
- Docker
- Specific databases

## Modules

- `modules/prokka.nf` — Prokka 1.14.6 ([GitHub](https://github.com/tseemann/prokka), [Docker Image](https://hub.docker.com/r/staphb/prokka))
- `modules/bakta.nf` — Bakta 1.11.3 ([GitHub](https://github.com/oschwengers/bakta), [Docker Image](https://hub.docker.com/r/oschwengers/bakta))
- `modules/eggnog.nf` — eggnog-mapper-v2 2.1.13 ([GitHub](https://github.com/eggnogdb/eggnog-mapper), [Docker Image](https://hub.docker.com/r/brunoholiva/eggnog_v2))

## Parameters

Some modules require specific database directories to be provided as parameters:

- **Bakta**: Requires Bakta database version 6.  
  Download from [Zenodo](https://zenodo.org/records/14916843), extract, and provide the absolute path using:  
  `--bakta_db_dir /absolute/path/to/bakta/db`

- **EggNog Mapper**: Requires EggNog database files.  
  Download both `mmseqs.tar.gz` and `eggnog.db.gz` from [EggNog](http://eggnog6.embl.de/download/emapperdb-5.0.2/) (as recommended for genome assemblies), extract, and provide the absolute path using:  
  `--eggnog_db_dir /absolute/path/to/eggnog/db`

**Example run command:**
```
nextflow run main.nf --bakta_db_dir /absolute/path/to/bakta/db --eggnog_db_dir /absolute/path/to/eggnog/db
```