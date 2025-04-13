#!/usr/bin/bash -l
#SBATCH -p epyc -n 1 -N 1 -c 4 --mem 64gb --out logs/McicRIPCALalign%A.log
conda activate ripcal
perl ../ripcal --command --type align --seq Massospora_cicadina.dna.modi.fasta  --gff mcictop5.gff3 
