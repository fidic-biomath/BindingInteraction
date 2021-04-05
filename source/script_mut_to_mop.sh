#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

#This program creates an input for optimizing restrictively the substituted residue

tag="$1"
arc="$2"
listm="$3"
MOPAC="$4"
MUT_NUM="$5"
#################################################################################################
if [ -z "$tag" ] || [ -z "$arc"  ] || [ -z "$listm" ] || [ -z "$MOPAC" ]
then
  echo "It lacks one or several arguments to execute the script"
  echo "For instance: ./script_mut_to_mop.sh main_name, arc_file, mutation_list and MOPAC path"
  exit 1
else
  echo "Running ./script_mut_to_mop.sh script in $PWD ..."
fi
#################################################################################################
if [[ ${MUT_NUM} -ne 0 ]];then
  for i in `ls -d mutation_*/ | grep "/" | cut -d':' -f1` #for all folders
  do

    j="$(echo "${i#*_}" | cut -d'/' -f1)" # cutting in the '_' and returning the second part of the name, in that case the number of the residue
    cp "$arc" "$i" #copying coordinates
    cp script_joincoorspdb_to_mop.sh "$i" #copying script
    cd "$i"
    ###############################
    # executing script that use original coordinates (.arc file) and the mono-substituted residue (.pdb file) 
    # to create a .mop file
    ./script_joincoorspdb_to_mop.sh "$tag"_"$j".pdb "$arc" "$tag" "$listm" 
    ###############################
    cd ..
  done
fi
###################################################################################################
mkdir -p tobe_charged
cp "$tag"_noW.pdb tobe_charged/
cp "$tag"_noW.arc tobe_charged/
######################################################################
if [[ ${MUT_NUM} -ne 0 ]];then
cp res_charges.pdb tobe_charged/
  echo "optimizing around 2 Angstroms"

  for i in `ls -d mutation_*/ | grep "/" | cut -d':' -f1` # for all folders
  do

    j="$(echo "${i#*_}" | cut -d'/' -f1)" # for all .mop files created before
    cd "$i"
    ###############################
    # executing mopac in all files
    ${MOPAC} "$tag"_"$j"_2A.mop 
    ###############################

    cp "$tag"_"$j"_2A.pdb ../tobe_charged/
    cp "$tag"_"$j"_2A.arc ../tobe_charged/
    cd ..
  done
fi
