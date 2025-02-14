#!/bin/bash

#*************************************
# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com
#
# @comment:
#  This is the setup for configuring external program paths and doing tests.
#*************************************

let input=0

while [ $input -ne 3 ]; 2> /dev/null
do
  echo "**********The MHCBI Setup**********"
  echo "Please select your option"
  echo "1 Set external program paths"
  echo "2 Test pipeline"
  echo "3 End pipeline setup"
  echo " "
  echo " "
  read input
  case $input in
    1)
      echo "***Assigning external program paths***"
      echo " "
      chmod +x pro_paths.sh
      echo "****Warning****"
      echo "Make sure that you have already installed the following linux text processing tools: "
      echo "  1. grep"
      echo "  2. cut"
      echo "  3. awk"
      echo "  4. gawk"
      echo "  4. sed"
      echo "  5. vim"
      echo "and the following specialized softwares such as: "
      echo "  6. Open Babel"
      echo "  7. VMD - Visual Molecular Dynamics"
      echo "  8. MOPAC - Molecular Orbital PACkage"
      echo "  9. UCSF Chimera"
      echo " 10. PROPKA 3.1"
      echo " 11. GAMESS - General Atomic and Molecular Electronic Structure System (optional)"
      echo " 12. python 2.7 or higher"
      echo " 13. Facio - GUI program for fragmenting molecules for FMO method (optional)"
      echo "****Warning****"
      count=0
      while [ $count -eq 0 ]
      do
      	read -p "Do you already install all of requierements? (Yes(Y/y)/No(N/n)): " answer
      	answer=${answer,,}

      	if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
          echo " *** "
      	  echo " "
          count=1
      	elif [ "$answer" == "no" ] || [ "$answer" == "n" ]; then
      	  echo "Please make sure that you have installed all of required programs prior to configure MHCBI pipeline"
      	  echo " bye..."
      	  exit 1;
      	else
      	  echo "Please enter again your answer - yes (y) or no (n)"
      	fi
      done
      echo "  "
      ./pro_paths.sh
    ;;
    2)
      echo "***Testing pipeline***"
      echo " "
      cd test
      chmod +x test_mhcbi.sh
      ./test_mhcbi.sh
      echo "...going to the menu..."
      echo " "
      echo
      cd ..
    ;;
    3)
      echo "In this directory ( "$PWD " ):"
      echo "For configuring work paths and running the pipeline type: ./pre-run.sh"
      echo "  Closing setup... bye "
      exit 1
    ;;
    *)
      echo "Sorry, you need to choose an option among 1 up to 3"
    ;;
    ''|*[!0-9]*)
      echo "Sorry, you need to choose a numerical option"
      let input=0
    ;;
  esac
done
echo "end"
