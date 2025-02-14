#!/bin/bash

#  Author: FIDIC Biomathematics Group
#  Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
#  Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

# exec_pka.sh
#This program executes propka3.1 in all pdb from "tobe_charged" folder.

PROPKA="$1"

#######################################################
if [ -z "$PROPKA" ]
then
  echo "It lacks one argument to execute the script"
  echo "For instance: ./exec_pka.sh propka 3.1 path"
  exit 1
else
  echo "Running ./exec_pka.sh script in $PWD ..."
fi
#########################################################

cd tobe_charged/
mv res_charges.pdb res_charges.aux-pdb

for i in `ls *.pdb`
do
   j="$(echo "$i" | cut -d'.' -f1)"
   mkdir -p $j
   mv $i $j/
   cd $j
   echo "execution of propka3.1 over $i"
   #####################
   #
   ${PROPKA} $i > tmp
   ######################
   #   Warning: When using the -d option, pKa values based on 'swapped' interactions
   #       will be writting to the output .pka file
   ${PROPKA} -d $i > tmp
   #######################
   rm tmp   # propka writes the output to a file named *.pka
   cd ..
done
cd ..
