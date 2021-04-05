#!/bin/bash

#  Author: FIDIC Biomathematics Group
#  Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

# ./script_arc_to_pdb_s.sh
#This program converts a .arc file into a .mop file using arguments in the name
##########################################################################

arg="$1"
##########################################################################
if [ -z "$arg" ] # cheking if the argument is in the execution of the script
then
  echo "It lacks one argument to execute the script"
  echo "For instance: ./script_arc_to_pdb_s.sh file.arc"
  exit 1
else
  echo "Executing script_arc_to_pdb_s.sh over $arg to get pdb file in $PWD..."
fi
###########################################################################
j="$(echo "$arg" | cut -d'.' -f1)" # removing the extension of the file
[ -e "$j".pdb ] && rm "$j".pdb # Delete a $j pdb file while that file exist
awk 'NF=="12"{if ($5=="A" || $5=="B" || $5=="P" || $5=="V") printf "ATOM%7d%-2s%3s %1s%4d%12.3f%8.3f%8.3f  1.00  0.00%12s\n",$2,substr($0,16,6),$4,$5,$6,$7,$9,$11,substr($1,1,1)}' "$arg" >> "$j".pdb
# rewriting the $j arc file into a .pdb according to the pdb format
