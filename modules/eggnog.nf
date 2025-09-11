#!/usr/bin/env nextflow

process EGGNOG {
    label "eggnog_mapper_v2"
    container "brunoholiva/eggnog_v2:latest"
    publishDir "results/eggnog", mode: "copy"
    containerOptions '-u $(id -u):$(id -g)'

    input:
    path fasta_file
    path eggnog_db_dir

    output:
    path "${fasta_file.baseName}_eggnog"

    script:
    """
    mkdir ${fasta_file.baseName}_eggnog
    emapper.py \
    --itype genome \
    --genepred prodigal \
    -i ${fasta_file} \
    -o ${fasta_file.baseName} \
    --data_dir ${eggnog_db_dir} \
    -m mmseqs \
    --cpu 0 \
    --output_dir ${fasta_file.baseName}_eggnog
    """
}