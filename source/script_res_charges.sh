#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating pept    ide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

cd tobe_charged/

awk '$1=="ATOM"{if ($4=="ASP" || $4=="GLU" || $4=="ARG" || $4=="LYS" || $4=="HIS") {printf "%s %3d %s\n", $4, $6, $5 }}' res_charges.pdb | sort | uniq | awk 'BEGIN{i=1} {printf "%2d. %s\n", i++, $0}' > residues_charges

#using uniq -c, there is a additional column with the numer of repetition of the printed sentence
#the second awk is only for assinging number at the begining of each row in res_charges

cd ..
