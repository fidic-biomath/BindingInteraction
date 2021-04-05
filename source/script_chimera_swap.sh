#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

# ./script_chimera_swap.sh
#This program executes a script without graphic environment

py="$1"
tag="$2"
CHIMERA="$3"
#########################################################################################
if [ -z "$py" ] || [ -z "$tag"  ] || [ -z "$CHIMERA" ]
then
  echo "It lacks one or several arguments to execute the script"
  echo "For instance: ./script_chimera_swap.sh name_chimera_script pdbs_main_name and Chimera path"
  exit 1
else
  echo "Running ./script_chimera_swap.sh script in $PWD ... "
fi
########################################################################################
#execution of chimera without graphic environment
${CHIMERA} --nogui --script "$py" > script_chimera_swap.log 2>&1
#######################################################################################
for i in `ls "$tag"-*.pdb`
do
  sed -i 's/HETATM/ATOM  /g' "$i" #replacing HETATM by ATOM
done
