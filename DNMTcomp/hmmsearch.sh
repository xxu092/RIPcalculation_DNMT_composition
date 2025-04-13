#!/usr/bin/bash -l
#SBATCH -p batch -n 1 -N 1 --mem 16gb --out logs/hmmsearch%A.log
module load hmmer

hmmsearch --domtblout Emaidomtble.out PF00145.hmm  Entomophaga_maimaiga_ARSEF_7190.v1.aa.fasta  > EmaiDNMT.hmmsearch
hmmsearch --domtblout Emusdomtble.out PF00145.hmm  Entomophthora_muscae_UCB.v2.aa.fasta  > EmusDNMT.hmmsearch
hmmsearch --domtblout Mcicdomtble.out PF00145.hmm  Massospora_cicadina_MCPNR19.v3.aa.fasta  > McicDNMT.hmmsearch
hmmsearch --domtblout Zraddomtble.out PF00145.hmm  Zoophthora_radicans_ATCC_208865.aa.fasta  > ZradDNMT.hmmsearch
