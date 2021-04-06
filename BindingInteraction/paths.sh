#!/bin/bash

#*************************************
# The MCH Binding Interaction (MHCBI) pipeline
# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

#  This is the configuration pipeline through Shell Script, a straightforward to use it.
#*************************************

echo "**********Setting work paths**********"

read -p "Enter the pdb structure path : " pdb_path
read -p "Enter the pdb structure name : " pdb_name
read -p "Enter the to-do work path : " work_dir
read -p "Enter the name of your work : " work_name

cat << EOF > paths.log
***List of directories:
----You can change paths only modifying this file
!!!!Do not remove other parts of this file
***PATHS
PDB path : $pdb_path
PDB name : $pdb_name
Work path : $work_dir
Work name : $work_name
***
EOF
