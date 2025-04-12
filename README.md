To calculate RIPindex, first get fasta file of the regions
```
module load bedtools
bedtools getfasta -fi genome/GCA_001566745.1_Conidiobolus_coronatus_NRRL28638_genomic.fna -bed GeneBed/ConcoGene.bed -fo GeneFasta/Concogenes.fasta
bedtools getfasta -fi genome/Conidiobolus_coronatus_NRRL_28638.Conco1.v1.fasta -bed TEBed/ConcoTE.bed -fo TEFasta/ConcoTEs.fasta
```
and calculate RIPindex
```
module load bioperl
perl RIP_index_calculation.pl -t CRI -m 100 -i GeneFasta/Concogenes.fasta -o results/ConcoGeneRIP.bed -r bed
perl RIP_index_calculation.pl -t CRI -m 100 -i TEFasta/ConcoTEs.fasta -o results/ConcoTERIP.bed -r bed
```
and do RIPsummary
```
perl RIP_genome_summary.pl results/ConcoGeneRIP.bed
perl RIP_genome_summary.pl results/ConcoTERIP.bed
```

