#!/bin/bash

#  Author: FIDIC Biomathematics Group
#  Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and     Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
#  Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

# ./script_arc_auxmop.sh
#This program converts a .arc file into a .mop file using arguments in the name
##########################################################################

arg="$1" # .arc file
res="$2" # mutation
arg2="$3" #option
##########################################################################
if  ! [[ -z "$arg" && -z "$res" ]] && [ -z "$arg2" ] # confirming the existence of the three arguments
then
  echo "It lacks one or several arguments to execute the script"
  echo "For instance: ./script_arc_auxmop.sh file.arc A11 neutral" # an example about of the execution
  exit 1
else
  echo "Executing script_arc_auxmop.sh over $arg and mutation $res with $arg2 option in $PWD..."
fi
##########################################################################
printf "   PM6-D3H4X LET 1SCF MOZYME EPS=78.4 GNORM=20 PDBOUT HTML CUTOFF=6\n\n\n" > Opt_"$res"_"$arg2".mop

awk 'BEGIN{i=1} NF=="12"{if ($5=="A" || $5=="B" || $5=="P") printf "  %6s%7d%-2s%3s %1s%5s%13.8f%13.8f%13.8f\n",$1,$2,substr($0,16,6),$4,$5,$6,$7,$9,$11}' "$arg" >> Opt_"$res"_"$arg2".mop
