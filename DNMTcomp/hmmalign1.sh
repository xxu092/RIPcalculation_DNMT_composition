#!/usr/bin/bash -l 
#SBATCH -p short -n 1 -N 1 -c 32 --mem 64gb --out logs/hmmalign%A.log
module load hmmer/3
module load trimal
module load IQ-TREE
hmmalign PF00145.hmm allDNMTs4.fasta > allDNMTs4.fasta.stk
esl-reformat afa allDNMTs4.fasta.stk > allDNMTs4.hmmalign.fasaln


trimal -automated1 -in allDNMTs4.hmmalign.fasaln -out allDNMTs4.hmmalign.trim.fasaln

iqtree2 -s allDNMTs4.hmmalign.trim.fasaln  -nt AUTO -bb 1000 -alrt 1000 -redo