#!/bin/bash

# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com


FILE=paths.out
FILE2=pro_paths.out
PH=$1  # pH value to estimate the protonation state in script_fishing_pka.sh
MUT_NUM=$2 #   Number of substitutions in mutations/listm.log file
###############################################################################
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
##########################################################################
cd optimizations

arg1=$(echo "${WORK_PATH}/${WORK_NAME}/optimizations")

chmod +x org_all.sh

./org_all.sh ${arg1} ${PDB_PATH} ${PDB_NAME} ${arg1} ${VMD_PATH} ${BABEL_PATH} ${MOPAC_PATH}

cp output/*.arc ${WORK_PATH}/${WORK_NAME}/mutations/
cp output/*.pdb ${WORK_PATH}/${WORK_NAME}/mutations/

echo "****** MHCBI says: ******"
echo "  Stage 1 finished..."
#########################################################################
echo "***Running Stage 2***"
echo
echo "You have ${MUT_NUM} amino acid substitutions in the ligand..."

cd ../mutations

arg2=$(echo "${WORK_PATH}/${WORK_NAME}/mutations")
name=$(awk -F '.pdb'  '{print $1}'  <<<  "${PDB_NAME}")

chmod +x org_mut.sh
########################################################################
#
./org_mut.sh ${arg2} ${name}_noW.pdb listm.log ${CHIMERA_PATH} ${MOPAC_PATH} ${MUT_NUM}
#######################################################################
cp -r tobe_charged ../calculations/

echo "****** MHCBI says: ******"
echo "  Stage 2 finished..."
##########################################################################
echo
echo "***Running Stage 3***"
echo
cd ../calculations

chmod +x org_calc.sh
#########################################################
#
./org_calc.sh ${PKA_PATH} ${MOPAC_PATH} ${PH}
########################################################
echo "****** MHCBI says: ******"
echo "  Stage 3 finished..."
echo
###########################################################################
cd ../
cp source/tester.sh .
#echo
#echo "****Checking test..."
#echo
##########################################
#
#./tester.sh
##########################################
#echo
