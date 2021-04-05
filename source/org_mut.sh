#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

dir="$1"
name="$2"
listm="$3"
CHIMERA="$4"
MOPAC="$5"
MUT_NUM="$6"
#######################################################################################################
if [ -z "$dir" ] || [ -z "$name" ] || [ -z "$listm" ] || [ -z "$CHIMERA" ] || [ -z "$MOPAC" ]
then
  echo "It lacks one or several arguments to execute this script: "
  echo "1. Mutation work path"
  echo "2. PDB name"
  echo "3. List of substitutions (mutations)"
  echo "4. Chimera executable path"
  echo "5. MOPAC executable path"
  echo "Please go to https://github.com/fidic-biomath/BindingInteraction for checking source code"
  exit 1
else
  echo "Running ./org_mut.sh script in $PWD ..."
fi
######################################################################################################
tag=$(awk -F '_noW'  '{print $1}'  <<<  "$name")

./mutmaker.sh "$dir" "$name" "$listm"
./script_chimera_swap.sh chimera_mut_"$tag".py "$tag" ${CHIMERA}
./script_H_mut.sh "$tag" "$listm" ${MOPAC}
./script_mut_to_mop.sh "$tag" "$tag"_noW.arc "$listm" ${MOPAC} ${MUT_NUM}
./script_res_charges.sh

echo "Mutation script finished"
