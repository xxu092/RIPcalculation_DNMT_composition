First use aa protein sequence to run hmmsearch with PF00145.hmm
```
module load hmmer

hmmsearch --domtblout Emaidomtble.out PF00145.hmm  Entomophaga_maimaiga_ARSEF_7190.v1.aa.fasta  > EmaiDNMT.hmmsearch
```
Then run hmmalign with PF00145.hmm on hit sequences
```
hmmalign PF00145.hmm allDNMTs4.fasta > allDNMTs4.fasta.stk
```
build MSA, build phylotree using iqtree
```
esl-reformat afa allDNMTs4.fasta.stk > allDNMTs4.hmmalign.fasaln


trimal -automated1 -in allDNMTs4.hmmalign.fasaln -out allDNMTs4.hmmalign.trim.fasaln
iqtree2 -s allDNMTs4.hmmalign.trim.fasaln  -nt AUTO -bb 1000 -alrt 1000 -redo
```
plot phylotree in R