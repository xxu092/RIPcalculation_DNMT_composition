#!/usr/bin/bash -l
#SBATCH -p batch -N 1 -n 1 -c 4 --mem 24gb --out logs/getfasta%A.log

module load bedtools
bedtools getfasta -fi genome/GCA_001566745.1_Conidiobolus_coronatus_NRRL28638_genomic.fna -bed GeneBed/ConcoGene.bed -fo GeneFasta/Concogenes.fasta
bedtools getfasta -fi genome/GCA_025603075.1_Conth1_genomic.fna -bed GeneBed/Conth1Gene.bed -fo GeneFasta/ConthGene.fasta
bedtools getfasta -fi genome/Entomophaga_maimaiga_var_ARSEF_7190.fasta -bed GeneBed/EmaiGene1.bed -fo GeneFasta/EmaiGene.fasta
bedtools getfasta -fi genome/Entomophthora_muscae_UCB.scaffolds.fa -bed GeneBed/EmusGene1.bed -fo GeneFasta/EmusGene.fasta
bedtools getfasta -fi genome/GCF_000182925.2_NC12_genomic.fna -bed GeneBed/NC12Gene1.bed -fo GeneFasta/NC12Gene.fasta
bedtools getfasta -fi genome/Massospora_cicadina.dna.fasta -bed GeneBed/McicGene2.bed -fo GeneFasta/McicGene.fasta