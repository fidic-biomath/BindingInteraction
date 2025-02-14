#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

dir="$1"
name="$2"
listm="$3"
###########################################################################
if [ -z "$dir" ] || [ -z "$name" ] || [ -z "$listm" ]
then
  echo "It lacks one or several arguments to execute this script"
  echo "For instance: ./mutmaker.sh path, name_pdb and list_mutations"
  exit 1
else
  echo "Running ./mutmaker.sh script in $PWD ..."
  echo "Creating a chimera script "
fi
###########################################################################

cat << EOF > script_chimera_mut.py
# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

#This python program calls some routines in chimera to creates the substitutions using Dunbrack library

import os, sys
from chimera import runCommand as rc # use 'rc' as shorthand for runCommand
from chimera import replyobj # for emitting status messages

# change to folder with data files
os.chdir("$dir")

EOF

let linen=$(grep -n "Begin" "$listm" | cut -d ":" -f1) #detecting the line number of the search
let linen=$linen+4 # line position of the features

llist_name=$(awk -v x=$linen 'NF=="4" && NR>=x {print $1}' "$listm") #specific search using as filter NF and NR and returning first column
listu=$(echo "$llist_name" | sort -u) #removing duplicates

tag="$(awk -F '_noW'  '{print $1}'  <<<  "$name")"

for i in $listu
do
  printf "rc (\"open $name\") #1)\n" >> script_chimera_mut.py
  awk -v x=$linen -v y=$i 'NR>=x {if ($1==y) {printf "rc (\"swapaa %s #0:%s.%s\") #2)\n", $2, $3, $4}}' "$listm"  >> script_chimera_mut.py
  printf "rc (\"write format pdb 0 ${tag}-${i}.pdb\") #3)\n" >> script_chimera_mut.py
  printf "rc (\"close #0\") #4)\n\n" >> script_chimera_mut.py
done

printf "rc (\"open $name\") #1)\n" >> script_chimera_mut.py
printf "rc (\"select #0: .P za<8\") #5)\n" >> script_chimera_mut.py
printf "rc (\"write selected format pdb 0 res_charges.pdb\") #3)\n" >> script_chimera_mut.py
printf "rc (\"close #0\") #4)\n\n" >> script_chimera_mut.py

cat << EOF >> script_chimera_mut.py
#------------
#1) opening the original geometry
#2) swapping a residue
#3) writing the new format
#4) closing .pdb file
#5) selecting 8-Angstrom radii from chain P (ligand)

EOF

mv script_chimera_mut.py chimera_mut_"$tag".py
