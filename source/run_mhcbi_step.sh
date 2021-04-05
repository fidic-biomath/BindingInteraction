#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

FILE=paths.out
FILE2=pro_paths.out
PH=$1  #  pH value to estimate the protonation state in script_fishing_pka.sh
MUT_NUM=$2  #   Number of substitutions in mutations/listm.log file
################################################################################3
if [ -f "$FILE" ]; then
  MHCBI_PATH=$(grep "1 " ${FILE} | cut -d':' -f2)
  PDB_PATH=$(grep "2 " ${FILE} | cut -d':' -f2)
  PDB_NAME=$(grep "3 " ${FILE} | cut -d':' -f2)
  WORK_PATH=$(grep "4 " ${FILE} | cut -d':' -f2)
  WORK_NAME=$(grep "5 " ${FILE} | cut -d':' -f2)
else
  echo "paths.out doesn't exist"
  echo "Configure the MHCBI pipeline executig setup.sh and select option 3)"
  exit 1
fi

if [ -f "$FILE2" ]; then
  MOPAC_PATH=$(grep "1 " ${FILE2} | cut -d':' -f2)
  PKA_PATH=$(grep "2 " ${FILE2} | cut -d':' -f2)
  VMD_PATH=$(grep "3 " ${FILE2} | cut -d':' -f2)
  GAMESS_PATH=$(grep "4 " ${FILE2} | cut -d':' -f2)
  BABEL_PATH=$(grep "5 " ${FILE2} | cut -d':' -f2)
  CHIMERA_PATH=$(grep "6 " ${FILE2} | cut -d':' -f2)
else
  echo "pro_paths.out doesn't exist"
  echo "Configure the MHCBI pipeline executig setup.sh and select option 3)"
  exit 1
fi
###################################################################################
let input=0
while [ $input -ne 5 ]; 2> /dev/null
do
  echo "**** Running MHCBI step by step ****"
  echo "Please select your option"
  echo "1. Stage 1: Optimizations"
  echo "2. Stage 2: Substitutions"
  echo "3. Stage 3: Calculations"
  echo "4. Brief running check"
  echo "5. End pipeline "
  echo " "
  echo " "
  read input
  case $input in
    ##################################################################################3
    1)
      echo "***Running Stage 1***"
      echo " "
      cd optimizations

      arg1=$(echo "${WORK_PATH}/${WORK_NAME}/optimizations")

      chmod +x org_all.sh
      ##############################################################################################
      #
      ./org_all.sh ${arg1} ${PDB_PATH} ${PDB_NAME} ${arg1} ${VMD_PATH} ${BABEL_PATH} ${MOPAC_PATH}
      ##############################################################################################
      cp output/*.arc ${WORK_PATH}/${WORK_NAME}/mutations/
      cp output/*.pdb ${WORK_PATH}/${WORK_NAME}/mutations/
      cd ..

      echo "****** MHCBI says: ******"
      echo "  Stage 1 finished..."
      ;;
    ################################################################################
    2)
      echo "***Running Stage 2***"
      echo
      echo "You have ${MUT_NUM} amino acid substitutions in the ligand..."
      if [[ ${MUT_NUM} -ne 0 ]];then
        cd mutations

        arg2=$(echo "${WORK_PATH}/${WORK_NAME}/mutations")
        name=$(awk -F '.pdb'  '{print $1}'  <<<  "${PDB_NAME}")

        chmod +x org_mut.sh
        #########################################################################################
        #
        ./org_mut.sh ${arg2} ${name}_noW.pdb listm.log ${CHIMERA_PATH} ${MOPAC_PATH} ${MUT_NUM}
        #########################################################################################
        cp -r tobe_charged ../calculations/
        cd ..
      else
         echo 
         echo "THE listm.log FILE DOES NOT HAVE AMINO ACID SUBSTITUTIONS !!!"
         echo " GO TO OPTION:   3. Stage 3: Calculations"
         echo
      fi
        echo "****** MHCBI says: ******"
        echo "  Stage 2 finished..."
        echo
      ;;
    #######################################################################################
    3)
      echo
      echo "***Running Stage 3***"
      echo " "

    # Asegurandome que la información del paso anterior (mutations) llegue a este paso,
    # en el caso de que MUT_NUM=0

      if [[ ${MUT_NUM} -eq 0 ]];then
        cd mutations
  
        arg2=$(echo "${WORK_PATH}/${WORK_NAME}/mutations")
        name=$(awk -F '.pdb'  '{print $1}'  <<<  "${PDB_NAME}")
  
        chmod +x org_mut.sh
        ########################################################################################
        #  
        ./org_mut.sh ${arg2} ${name}_noW.pdb listm.log ${CHIMERA_PATH} ${MOPAC_PATH} ${MUT_NUM}
        ########################################################################################
        cp -r tobe_charged ../calculations/
        cd ..
      fi
    #######################################################################################

      cd calculations

      chmod +x org_calc.sh
      #################################################
      #
      ./org_calc.sh ${PKA_PATH} ${MOPAC_PATH} ${PH}
      #################################################
      cd ..

      echo "****** MHCBI says: ******"
      echo "  Stage 3 finished..."
      ;;
    #####################################################################################
    4)
      echo "***Running brief check***"
      echo " "

      cp source/tester.sh .
      ##################
      #   
      ./tester.sh
      ##################
      ;;
    ###################################################################################
    5)
      echo "  Closing pipeline... bye "
      exit 1
      ;;
    ################################################################################3
    *)
      #clear
      echo "Sorry, you need to choose an option among 1 up to 5"
      ;;
    ##################################################################################
    ''|*[!0-9]*)
      #clear
      echo "Sorry, you need to choose a numerical option"
      let input=0
      ;;
  esac
done
