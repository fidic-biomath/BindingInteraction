#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

# org_calc.sh
#This program manages all script from the single point calculation part in the BindingInteraction pipeline.

PROPKA="$1"
MOPAC="$2"
PH=$3

#######################################################################
if [ -z "$PROPKA" ] || [ -z "$MOPAC" ]
then
  echo "It lacks one argument to execute the script"
  echo "For instance: ./org_calc.sh propka 3.1 and MOPAC paths"
  exit 1
else
  echo "Running org_calc.sh script in $PWD ... "
fi
########################################################################

###########################
#
./exec_pka.sh ${PROPKA}
#############################
#
./script_fishing_pka.sh ${PH}
##################################
#
./script_H_charges.sh ${MOPAC}
##################################
echo "Single point calculation script finished"
