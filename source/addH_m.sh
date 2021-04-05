#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and     Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding ener    gy using semi-empirical quantum mechanical methods with explicit/implicit     solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com
 
# addH_m.sh 
#This program creates an input in mopac to add hydrogens in a molecule
########################################################################

arg="$1"
MOPAC="$2"

###################################################################################
if [ -z "$arg" ] || [ -z "$MOPAC" ] #execution of this program waits two additional arguments
then
  echo "It lacks one or several arguments to execute the script"
  echo "For instance: ./addH_m.sh molecule.pdb and MOPAC path"
  exit 1
else
  echo "Executing addH_m.sh over $arg in $PWD..." #This argument is an output pdb file from dowser execution
fi
###########################################################################
j="$(echo "$arg" | cut -d'.' -f1)"

printf " PDB ADD-H DEBUG AUX PDBOUT\n\n\n" > "$j".mop
awk 'NF=="12"{print $0}' "$arg" >> "$j".mop

mv "$arg" "$arg".old
##################################
#
${MOPAC} "$j".mop
##################################
mv "$j".pdb aux-"$arg"
