#!/usr/bin/bash -l
#SBATCH -p batch -n 1 -N 1 -c 4 --mem 16gb --out logs/RIPsummary%A.log

perl RIP_genome_summary.pl results/EmaiGeneRIP.bed
perl RIP_genome_summary.pl results/EmusGeneRIP.bed
perl RIP_genome_summary.pl results/McicGeneRIP.bed
perl RIP_genome_summary.pl results/NC12GeneRIP.bed
perl RIP_genome_summary.pl results/ConcoGeneRIP.bed
perl RIP_genome_summary.pl results/ConthGeneRIP.bed

perl RIP_genome_summary.pl results/EmaiTERIP.bed
perl RIP_genome_summary.pl results/EmusTERIP.bed
perl RIP_genome_summary.pl results/McicTERIP.bed
perl RIP_genome_summary.pl results/NC12TERIP.bed
perl RIP_genome_summary.pl results/ConcoTERIP.bed
perl RIP_genome_summary.pl results/ConthTERIP.bed