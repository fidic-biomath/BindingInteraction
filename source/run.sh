#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protei    n binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

FILE=paths.out

if [ -f "$FILE" ]; then
  WORK_PATH=$(grep "4 " ${FILE} | cut -d':' -f2)
  WORK_NAME=$(grep "5 " ${FILE} | cut -d':' -f2)
else
  echo "paths.out doesn't exist"
  echo "Configure the MHCBI pipeline executig setup.sh and select option 3)"
  exit 1
fi

count=0
while [ $count -eq 0 ]
do
  read -p "Did you already set the mutations list? (Yes(Y/y)/No(N/n)): " answer
  answer=${answer,,}

  if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
    echo " *** "
    echo " "
    count=1
  elif [ "$answer" == "no" ] || [ "$answer" == "n" ]; then
    echo "The MHCBI will open vim editor for writing the mutation list from the new proyect."
    echo "Exit the pipeline if you want to write the mutation list with an editor of your preference"
    echo " "

    count1=0
    while [ $count1 -eq 0 ]
    do

      read -p "If you want to use vim editor ---type c to continue--- otherwise ---type x to exit pipeline--- : " answer1
      answer1=${answer1,,}

      if [ "$answer1" == "c" ]; then
        echo " *** "
        echo " "
        cd ${WORK_PATH}/${WORK_NAME}/
        < /dev/tty vim -o mutations/listm.log #open file using vim without returning errors if execution goes wrong
        count1=1
      elif [ "$answer1" == "x" ]; then
        echo " "
        echo " "
        echo "Go to mutations folder in this directory and modify listm.log file following instructions inside"
        echo " bye..."
        count1=1
        exit 1;
      else
        echo "Please enter again your answer - continue (c) or exit (x)"
      fi
# Introducir una prueba de errores del archivo mutations/listm.log
    done

    echo " bye..."

  else
    echo "Please enter again your answer - yes (y) or no (n)"
  fi
done

###########################################################
# Test if the listm.log file has mutations 
MUT_NUM=`awk 'BEGIN{i=0} $1!="#"{i++} END{print i}' mutations/listm.log`
############################################################

count=0
while [ $count -eq 0 ]
do
  read -p "What pH value are you going to use to estimate the protonation state? (e.g.: 7.0): " PH
  re='^[0-9]+([.][0-9]+)?$'
  if ! [[ ${PH} =~ $re ]] ; then
    echo "error: Not a number" >&2
  else
    read -p "Is the pH value you are going to use to estimate the protonation state  ${PH}  ? yes (y) or no (n): " CORRECT
    if [ "$CORRECT" == "y" ]; then
      count=1
    fi
  fi
done

let input=0

while [ "$input" -ne 4 ]; 2> /dev/null
do
  echo "**** The MHCBI Pipeline ****"
  echo "Please select your option"
  echo "1. Run MHCBI in a single step"
  echo "2. Run MHCBI step by step"
  echo "3. End running pipeline"
  echo "4. Optional running (GAMESS)"
  echo " "
  echo " "
  read input
  case $input in
    1)
      echo "***Running MHCBI in a single step***"
      echo " "
      cd ${WORK_PATH}/${WORK_NAME}/
      cp source/run_mhcbi.sh .
      chmod +x run_mhcbi.sh
      ./run_mhcbi.sh ${PH} ${MUT_NUM}
      echo "...going to the menu..."
      rm -f run_mhcbi.sh
      ;;
    2)
      echo "***Assigning external program paths***"
      echo " "
      cd ${WORK_PATH}/${WORK_NAME}/
      cp source/run_mhcbi_step.sh .
      chmod +x run_mhcbi_step.sh
      ./run_mhcbi_step.sh ${PH} ${MUT_NUM}
      echo "...going to the menu..."
      rm -f run_mhcbi_step.sh
      ;;
    3)
      echo "  Closing pipeline... bye "
      exit 1
      ;;
    4)
      echo "***Running calculation with GAMESS***"
      echo " "
      cd ${WORK_PATH}/${WORK_NAME}/
      cp source/run_fmogamess.sh .
      chmod +x run_fmogamess.sh
      ./run_fmogamess.sh
      echo "...going to the menu..."
      rm -f run_fmogamess.sh
      ;;
    *)
      #clear
      echo "Sorry, you need to choose an option among 1 up to 4"
      ;;
    ''|*[!0-9]*)
      #clear
      echo "Sorry, you need to choose a numerical option"
      let input=0
      ;;
  esac
done
