To do alignment based RIPindex analysis, first extract sequences of TE family from Repeatmasker result
```
rmOut2Fasta.pl -fasta Entomophaga_maimaiga_var_ARSEF_7190.fasta -out Emai1435.fasta.out > Emai1435.rmout.fasta
rmOut2Fasta.pl -fasta Entomophaga_maimaiga_var_ARSEF_7190.fasta -out Emai1953.fasta.out > Emai1953.rmout.fasta
rmOut2Fasta.pl -fasta Entomophaga_maimaiga_var_ARSEF_7190.fasta -out Emai2184.fasta.out > Emai2184.rmout.fasta
rmOut2Fasta.pl -fasta Entomophaga_maimaiga_var_ARSEF_7190.fasta -out Emai2374.fasta.out > Emai2374.rmout.fasta
rmOut2Fasta.pl -fasta Entomophaga_maimaiga_var_ARSEF_7190.fasta -out Emai2499.fasta.out > Emai2499.rmout.fasta
```
change sequence names
``` 
 awk '/^>/{gsub(/[ ()]/, "_"); gsub("__", "_"); sub("_$", ""); print} !/^>/{print}' Emai1435.rmout.fasta > Emai1435modi.rmout.fasta
 ```
 Now do mmseqs to cluster similar sequences
 ```
  mmseqs createdb Emai1435.rmout.fasta Emai1435
  mkdir tmp
  mmseqs cluster Emai1435 Emai1435_clu tmp --cov-mode 2
  mmseqs createtsv Emai1435 Emai1435 Emai1435_mode2_clu Emai1435_mode2_clu.tsv
  
  awk '{print $1}' Emai1435_mode2_clu.tsv |sort | uniq -c | sort -k1,1nr > Emai1435_mode2_clusters.tsv
  1187 Chr02:61698275-61705136__TE_00001435_LTR:1-5103_orient=+
  grep "Chr02:61698275-61705136__TE_00001435_LTR:1-5103_orient=+" Emai1435_mode2_clu.tsv | awk '{print $2}' > Emai1435cluloc.tsv
  ```
  now repeat for other families
  ```
  
  awk '/^>/{gsub(/[ ()]/, "_"); gsub("__", "_"); sub("_$", ""); print} !/^>/{print}' Emai1953.rmout.fasta > Emai1953modi.rmout.fasta
  mmseqs createdb Emai1953modi.rmout.fasta Emai1953
  mmseqs createtsv Emai1953 Emai1953 Emai1953_mode2_clu Emai1953_mode2_clu.tsv
  awk '{print $1}' Emai1953_mode2_clu.tsv |sort | uniq -c | sort -k1,1nr > Emai1953_mode2_clusters.tsv
  185 Chr06:8241529-8248666__TE_00001953_INT:1-6796_orient=-
  grep "Chr06:8241529-8248666__TE_00001953_INT:1-6796_orient=-" Emai1953_mode2_clu.tsv | awk '{print}' > Emai1953cluloc.tsv
  
  awk '/^>/{gsub(/[ ()]/, "_"); gsub("__", "_"); sub("_$", ""); print} !/^>/{print}' Emai2184.rmout.fasta > Emai2184modi.rmout.fasta 
  cd ..
  awk '/^>/{gsub(/[ ()]/, "_"); gsub("__", "_"); sub("_$", ""); print} !/^>/{print}' Emai2374.rmout.fasta > Emai2374modi.rmout.fasta 
  awk '/^>/{gsub(/[ ()]/, "_"); gsub("__", "_"); sub("_$", ""); print} !/^>/{print}' Emai2499.rmout.fasta > Emai2499modi.rmout.fasta 
  #2184 only has 55 sequences just do RIPCAL on all sequences
  
  #2374 has 6874 sequences, need clustering
  mmseqs createdb Emai2374modi.rmout.fasta Emai2374
  mmseqs createtsv Emai2374 Emai2374 Emai2374_mode2_clu Emai2374_mode2_clu.tsv
  #2499 has 2703 sequences needs clustering
  mmseqs createdb Emai2499modi.rmout.fasta Emai2499
  mmseqs createtsv Emai2499 Emai2499 Emai2499_mode2_clu Emai2499_mode2_clu.tsv
  make a new folder to do all this 
 ```
 Make top5 family similar element location file
 ``` 
  1133 Chr29:424742-432141__TE_00002374:2-7435_orient=+
  105 Chr14:21761725-21764802__TE_00002499:2-3010_orient=+
  cat Emai2374_mode2_clu.tsv Emai2499_mode2_clu.tsv >Emai2374_2499_mode2_clu.tsv
  awk '{print $1}' Emai2374_2499_mode2_clu.tsv |sort | uniq -c | sort -k1,1nr > Emai2374_2499_mode2_clusters.tsv
  grep -E "Chr02:61698275-61705136__TE_00001435_LTR:1-5103_orient=+|Chr06:8241529-8248666__TE_00001953_INT:1-6796_orient=-|Chr29:424742-432141__TE_00002374:2-7435_orient=+|Chr14:21761725-21764802__TE_00002499:2-3010_orient=+" Emaitop5_mode2_clu.tsv |awk '{print $2}' > Emaitop5clulocV2.tsv
  ```
  
