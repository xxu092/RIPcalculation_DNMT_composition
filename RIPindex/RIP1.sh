#!/usr/bin/bash -l
#SBATCH -p batch -n 1 -N 1 -c 4 --mem 16gb --out logs/RIP-1%A.log
module load bioperl
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/EmaiGene.fasta -o results/EmaiGeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/EmusGene.fasta -o results/EmusGeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/McicGene.fasta -o results/McicGeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/NC12Gene.fasta -o results/NC12GeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/Concogenes.fasta -o results/ConcoGeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/ConthGene.fasta -o results/ConthGeneRIP.bed -r bed

perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/EmaiTEs.fasta -o results/EmaiTERIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/EmusTEs.fasta -o results/EmusTERIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/McicTEs.fasta -o results/McicTERIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/NC12TEs.fasta -o results/NC12TERIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/ConcoTEs.fasta -o results/ConcoTERIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/ConthTEs.fasta -o results/ConthTERIP.bed -r bed