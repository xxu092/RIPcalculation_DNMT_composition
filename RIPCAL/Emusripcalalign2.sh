#!/usr/bin/bash -l
#SBATCH -p epyc -n 1 -N 1 -c 4 --mem 64gb --out logs/EmusRIPCALalign%A.log
conda activate ripcal
perl ../ripcal --command --type align --seq Entomophthora_muscae_UCB.scaffolds.fa  --gff emustop5.gff3 
