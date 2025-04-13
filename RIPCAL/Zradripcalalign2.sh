#!/usr/bin/bash -l
#SBATCH -p epyc -n 1 -N 1 -c 4 --mem 64gb --out logs/zradRIPCALalign%A.log
conda activate ripcal
perl ../ripcal --command --type align --seq Zoophthora_radicans_ATCC_208865_v1.fasta  --gff zradtop5.gff3 
