#!/usr/bin/bash -l
#SBATCH -p epyc -n 1 -N 1 -c 4 --mem 64gb --out logs/EmaiRIPCALalign%A.log
conda activate ripcal

perl ../ripcal --command --type align --seq Entomophaga_maimaiga_var_ARSEF_7190.fasta --gff emaitop5.gff3 
