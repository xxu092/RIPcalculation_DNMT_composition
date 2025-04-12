#!/usr/bin/bash -l
#SBATCH -p batch -N 1 -n 1 -c 4 --mem 24gb --out logs/getfasta%A.log

module load bedtools
bedtools getfasta -fi genome/Conidiobolus_coronatus_NRRL_28638.Conco1.v1.fasta -bed TEBed/ConcoTE.bed -fo TEFasta/ConcoTEs.fasta
bedtools getfasta -fi genome/Conidiobolus_thromboides_FSU_785.Conth1.v1.sorted.fasta -bed TEBed/merged.conth.rmout.bed -fo TEFasta/ConthTEs.fasta
bedtools getfasta -fi genome/Entomophaga_maimaiga_var_ARSEF_7190.fasta -bed TEBed/merged.emai.rmout.bed -fo TEFasta/EmaiTEs.fasta
bedtools getfasta -fi genome/Entomophthora_muscae_UCB.scaffolds.fa -bed TEBed/merged.emus.rmout.bed -fo TEFasta/EmusTEs.fasta
bedtools getfasta -fi genome/GCF_000182925.2_NC12_genomic.fna -bed TEBed/merged.NC12.rmout.bed -fo TEFasta/NC12TEs.fasta
bedtools getfasta -fi genome/Massospora_cicadina.dna.fasta -bed TEBed/merged.mcic.rmout.bed -fo TEFasta/McicTEs.fasta