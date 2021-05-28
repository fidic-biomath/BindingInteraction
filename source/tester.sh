#!/bin/bash
#Author: FIDIC Biomathematics Group
#Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energyusing semi-empirical quantum mechanical methods with explicit/implicit solvent models. Submitted.
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

FILE=paths.out
FILE2=pro_paths.out
TEST_WORK_NAME=$1

#First level

echo
echo "##################################"
echo "  MHCBI scanning dirs and files..."
echo "##################################"
echo

if [ -f "$FILE" ]; then
  MHCBI_PATH=$(grep "1 " ${FILE} | cut -d':' -f2)
    PDB_PATH=$(grep "2 " ${FILE} | cut -d':' -f2)
    PDB_NAME=$(grep "3 " ${FILE} | cut -d':' -f2)
   WORK_PATH=$(grep "4 " ${FILE} | cut -d':' -f2)
   WORK_NAME=$(grep "5 " ${FILE} | cut -d':' -f2)
  echo -e "Running paths source found.....................................\e[1;32m passed \e[0m"
else
  echo "paths.out doesn't exist"
  echo -e "Running paths source found.....................................\e[1;31m failded \e[0m"
  exit 1
fi

if [ -f "$FILE2" ]; then
  MOPAC_PATH=$(grep "1 " ${FILE2} | cut -d':' -f2)
  PKA_PATH=$(grep "2 " ${FILE2} | cut -d':' -f2)
  VMD_PATH=$(grep "3 " ${FILE2} | cut -d':' -f2)
  GAMESS_PATH=$(grep "4 " ${FILE2} | cut -d':' -f2)
  BABEL_PATH=$(grep "5 " ${FILE2} | cut -d':' -f2)
  CHIMERA_PATH=$(grep "6 " ${FILE2} | cut -d':' -f2)
  echo -e "External program paths source found............................\e[1;32m passed \e[0m"
else
  echo "pro_paths.out doesn't exist"
  echo -e "External program paths source found............................\e[1;31m failded \e[0m"
  exit 1
fi
#####################################
  echo "1st Stage directory folder"
#####################################
if [ -d "optimizations" ]; then
  echo -e "Optimizations folder created...................................\e[1;32m passed \e[0m"
else
  echo -e "Optimizations folder created...................................\e[1;31m failed \e[0m"
fi
#####################################
  echo "2nd Stage directory folder"
#####################################
if [ -d "mutations" ]; then
  echo -e "Mutations folder created.......................................\e[1;32m passed \e[0m"
else
  echo -e "Mutations folder created.......................................\e[1;31m failed \e[0m"
fi
#####################################
  echo "3rd Stage directory folder"
#####################################
if [ -d "calculations" ]; then
  echo -e "Calculations folder created....................................\e[1;32m passed \e[0m"
else
  echo -e "Calculations folder created....................................\e[1;31m failed \e[0m"
fi

#Second level

#current_dir="$(echo "${WORK_PATH}/${WORK_NAME}")"

#if [ "${current_dir}" = "$PWD" ]; then
#  echo "Directory: "${current_dir}
#  echo -e "Stage 1: work directory found..................................\e[1;32m passed \e[0m"
#else
#  echo -e "Stage 1: work directory found..................................\e[1;31m failed \e[0m"
#fi
##########################
cd optimizations
var="$(echo "${PDB_NAME}" | cut -d'.' -f1)"
###########################
#if [ -d ${var} ]; then
#  echo -e "Stage 1: work folder found.....................................\e[1;32m passed \e[0m"
#else
#  echo -e "Stage 1: work folder found.....................................\e[1;31m failed \e[0m"
#fi

cd ${var}

if [ -d "original" ]; then
  echo -e "Stage 1.1: Initial PDB structure found.........................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.1: Initial PDB structure found.........................\e[1;31m failed \e[0m"
fi

if [ -d "dowser" ]; then
  echo -e "Stage 1.2: Dowser work folder found............................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.2: Dowser work folder found............................\e[1;31m failed \e[0m"
fi

if [ -d "2nd_step" ]; then
  echo -e "Stage 1.3: 2nd step found......................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.3: 2nd step found......................................\e[1;31m failed \e[0m"
fi

cd 2nd_step

if [ -e "final_step.pdb" ]; then
  echo -e "Stage 1.4: Dowser procedure completed..........................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.4: Dowser procedure completed..........................\e[1;31m failed \e[0m"
fi

if [ -e "pdbformopac_final_step.pdb" ]; then
  echo -e "Stage 1.5: 2nd step completed..................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.5: 2nd step completed..................................\e[1;31m failed \e[0m"
fi

cd ..

if [ -d "3rd_step" ]; then
  echo -e "Stage 1.6: 3rd step found......................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.6: 3rd step found......................................\e[1;31m failed \e[0m"
fi

cd 3rd_step

if [ -e "molpdbw.pdb" ]; then
  echo -e "Stage 1.7: Dowser output as input found........................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.7: Dowser output as input found........................\e[1;31m failed \e[0m"
fi

if [ -e "molpdbw_H.mop" ]; then
  echo -e "Stage 1.8: Mopac input for adding hydrogens found..............\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.8: Mopac input for adding hydrogens found..............\e[1;31m failed \e[0m"
fi

if [ -e "molpdbw_H.arc" ]; then
  echo -e "Stage 1.9: Mopac input completed...............................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.9: Mopac input completed...............................\e[1;31m failed \e[0m"
fi

cd ..

if [ -d "4th_step" ]; then
  echo -e "Stage 1.10: 4th step found.....................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.10: 4th step found.....................................\e[1;31m failed \e[0m"
fi

cd 4th_step

if [ -e "input_OptH.mop" ]; then
  echo -e "Stage 1.11: Mopac input for optimizing hydrogens found.........\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.11: Mopac input for optimizing hydrogens found.........\e[1;31m failed \e[0m"
fi

if [ -e "input_OptH.arc" ]; then
  echo -e "Stage 1.12: Mopac output hydrogen optimization completed.......\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.12: Mopac output hydrogen optimization completed.......\e[1;31m failed \e[0m"
fi

cd ..

if [ -d "5th_step" ]; then
  echo -e "Stage 1.13: 5th step found.....................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.13: 5th step found.....................................\e[1;31m failed \e[0m"
fi

cd 5th_step

if [ -e "input_Optall.mop" ]; then
  echo -e "Stage 1.14: Mopac input for all-atom optimizing found..........\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.14: Mopac input for all-atom optimizing found..........\e[1;31m failed \e[0m"
fi

if [ -e "input_Optall.arc" ]; then
  echo -e "Stage 1.15: Mopac output all-atom optimization completed.......\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.15: Mopac output all-atom optimization completed.......\e[1;31m failed \e[0m"
fi

cd ..

if [ -d "6th_step" ]; then
  echo -e "Stage 1.16: 6th step found.....................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.16: 6th step found.....................................\e[1;31m failed \e[0m"
fi

cd 6th_step

if [ -e "org_coord.pdb" ]; then
  echo -e "Stage 1.17: Final PDB structure with no water molecules found..\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.17: Final PDB structure with no water molecules found..\e[1;31m failed \e[0m"
fi

if [ -e "org_coord.arc" ]; then
  echo -e "Stage 1.18: MOPAC no-water output found........................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.18: MOPAC no-water output found........................\e[1;31m failed \e[0m"
fi

cd ../../

if [ -d "output" ]; then
  echo -e "Stage 1.19: Overall output stage 1 found.......................\e[1;32m passed \e[0m"
else
  echo -e "Stage 1.19: Overall output stage 1 found.......................\e[1;31m failed \e[0m"
fi

##########################################################################################
# STAGE 2
#########################################################################################
cd ../mutations
##############################
if [ -e "listm.log" ]; then
  echo -e "Stage 2.1: to-be-substituted residue list found................\e[1;32m passed \e[0m"
else
  echo -e "Stage 2.1: to-be-substituted residue list found................\e[1;31m failed \e[0m"
fi
##################################
if [ -e "res_charges.pdb" ]; then
  echo -e "Stage 2.2: Residues charged found..............................\e[1;32m passed \e[0m"
else
  echo -e "Stage 2.2: Residues charged found..............................\e[1;31m failed \e[0m"
fi
##########################################
if [ -e "chimera_mut_${var}.py" ]; then
  echo -e "Stage 2.3: Chimera python script found.........................\e[1;32m passed \e[0m"
else
  echo -e "Stage 2.3: Chimera python script found.........................\e[1;31m failed \e[0m"
fi
#################################
if [ -d "tobe_charged" ]; then
  echo -e "Stage 2.4: Overall output found................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 2.4: Overall output found................................\e[1;31m failed \e[0m"
fi

###########################################################
# Test if the listm.log file has mutations 
MUT_NUM=`awk 'BEGIN{i=0} $1!="#"{i++} END{print i}' listm.log`
############################################################
cd tobe_charged
let num=1
let num=$(ls *.pdb | wc -l)

if [[ ${MUT_NUM} -ne 0 ]];then
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 2.5: Substituted PDB structures found....................\e[1;33m incomplete \e[0m"
  elif [ "${num}" -eq "0" ]; then
  echo -e "Stage 2.5: Substituted PDB structures found....................\e[1;31m failed \e[0m"
  else
  echo -e "Stage 2.5: Substituted PDB structures found....................\e[1;32m passed \e[0m"
  fi
else
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 2.5: One PDB structure found.............................\e[1;32m passed \e[0m"
  else
  echo -e "Stage 2.5: One PDB structure found.............................\e[1;31m failed \e[0m"
  fi 
fi

#################################
let num=1
let num=$(ls *.arc | wc -l)

if [[ ${MUT_NUM} -ne 0 ]];then
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 2.6: Substituted MOPAC ouputs found......................\e[1;33m incomplete \e[0m"
  elif [ "${num}" -eq "0" ]; then
  echo -e "Stage 2.6: Substituted MOPAC ouputs found......................\e[1;31m failed \e[0m"
  else
  echo -e "Stage 2.6: Substituted MOPAC ouputs found......................\e[1;32m passed \e[0m"
  fi
else
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 2.6: One MOPAC ouputs found..............................\e[1;32m passed \e[0m"
  else
  echo -e "Stage 2.6: One MOPAC ouputs found..............................\e[1;31m failed \e[0m"
  fi
fi
##################################
# STAGE 3
###################################
cd ../../calculations

if [ -d "tobe_charged" ]; then
  echo -e "Stage 3.1: Overall input found.................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 3.1: Overall input found.................................\e[1;31m failed \e[0m"
fi
##################################
cd tobe_charged

let num=$(ls *.arc | wc -l)

if [[ ${MUT_NUM} -ne 0 ]];then
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 3.2: Substituted MOPAC ouputs found......................\e[1;33m incomplete \e[0m"
  elif [ "${num}" -eq "0" ]; then
  echo -e "Stage 3.2: Substituted MOPAC ouputs found......................\e[1;31m failed \e[0m"
  else
  echo -e "Stage 3.2: Substituted MOPAC ouputs found......................\e[1;32m passed \e[0m"
  fi
else
  if [ "${num}" -eq "1" ]; then
  echo -e "Stage 3.2: One MOPAC ouputs found..............................\e[1;32m passed \e[0m"
  else
  echo -e "Stage 3.2: One MOPAC ouputs found..............................\e[1;31m failed \e[0m"
  fi
fi

cd ..

if [ -d "final_pdbs" ]; then
  echo -e "Stage 3.3: Overall output found................................\e[1;32m passed \e[0m"
else
  echo -e "Stage 3.3: Overall output found................................\e[1;31m failed \e[0m"
fi
#########################
cd final_pdbs
########################
let num2=$(expr $(ls *.pdb | wc -l) / 3)

if [ "${num}" -eq "${num2}" ]; then
  echo -e "Stage 3.4: Overal substituted and charged PDB structures found.\e[1;32m passed \e[0m"
elif [ "${num2}" -eq "0" ]; then
  echo -e "Stage 3.4: Overal substituted and charged PDB structures found.\e[1;31m failed \e[0m"
else
  echo -e "Stage 3.4: Overal substituted and charged PDB structures found.\e[1;33m incomplete \e[0m"
fi
############################################################################################
cd ../../
#################################################################################
  echo
  echo "###########################"
  echo "  MOPAC results scanning..."
  echo "###########################"
  echo

#grep -H "NORMALLY" optimizations/*/*.out   | awk '{print $1,$3,$4,$5}'
grep -H "NORMALLY" optimizations/*/*/*.out | awk '{print $1," * ",$3,$4,$5," * "}'
if [[ ${MUT_NUM} -ne 0 ]];then
grep -H "NORMALLY" mutations/*/*.out       | awk '{print $1," * ",$3,$4,$5," * "}'
#grep -H "NORMALLY" mutations/*/*/*.out     | awk '{print $1,$3,$4,$5}'
fi
grep -H "NORMALLY" calculations/*/*.out    | awk '{print $1," * ",$3,$4,$5," * "}'
grep -H "NORMALLY" calculations/*/*/*.out  | awk '{print $1," * ",$3,$4,$5," * "}'

let subtotal1=$(grep "NORMALLY" */*/*.out | wc -l)
let subtotal2=$(grep "NORMALLY" */*/*/*.out | wc -l)

total=$( echo "3 + 2*${MUT_NUM} + 1 + ${MUT_NUM} + 3 + 3*${MUT_NUM}" | bc )

  echo -e "Total MOPAC results passed ... \e[1;32m $(($subtotal1+$subtotal2)) of $total \e[0m"

#grep -H "ABNORMALLY" optimizations/*/*.out   | awk '{print $1,$3,$4,$5}'
grep -H "ABNORMALLY" optimizations/*/*/*.out | awk '{print $1," * ",$3,$4,$5," * "}'
if [[ ${MUT_NUM} -ne 0 ]];then
grep -H "ABNORMALLY" mutations/*/*.out       | awk '{print $1," * ",$3,$4,$5," * "}'
#grep -H "ABNORMALLY" mutations/*/*/*.out     | awk '{print $1,$3,$4,$5}'
fi
grep -H "ABNORMALLY" calculations/*/*.out    | awk '{print $1," * ",$3,$4,$5," * "}'
grep -H "ABNORMALLY" calculations/*/*/*.out  | awk '{print $1," * ",$3,$4,$5," * "}'

let subtotal1=$(grep "ABNORMALLY" */*/*.out | wc -l)
let subtotal2=$(grep "ABNORMALLY" */*/*/*.out | wc -l)

  echo -e "Total MOPAC results failed ... \e[1;31m $(($subtotal1+$subtotal2)) of $total \e[0m"
  echo

################################################################
# BINDING ENERGY RESULTS
###############################################################
echo "###############################"  
echo "        MOPAC SQM (PM7)        "
echo "     BINDING ENERGY RESULTS    "
echo "              for              "
cd calculations/be_outputs
BE_OUTPUT_FILES=$(ls | wc -l)
if [[ ${BE_OUTPUT_FILES} -ne 0 ]];then

  let num_c=$(ls C_*.arc 2>&- | wc -l)
  let num_r=$(ls R_*.arc 2>&- | wc -l)
  let num_l=$(ls L_*.arc 2>&- | wc -l)

  NUM_CALCS=$( echo "($num_c + $num_r + ${num_l})" | bc)
  NUM_CALCS_EXPECTED=$( echo "(${MUT_NUM} + 1)*3" | bc)
  #echo "NUM_CALCS=${NUM_CALCS} of NUM_CALCS_EXPECTED=${NUM_CALCS_EXPECTED}"
  if [[ ${NUM_CALCS} -eq ${NUM_CALCS_EXPECTED} ]];then

    if [[ ${MUT_NUM} -eq 0 ]];then 
      echo "$num_c complex ($num_r receptor and $num_l ligand)"
    else
      echo "$num_c complexes ($num_r receptors and $num_l ligands)"
    fi
    echo "###############################"
    echo
    ##############################

    C_noW_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' C_noW.arc)
    L_noW_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' L_noW.arc)
    R_noW_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' R_noW.arc)

    #echo "C_noW_ENERGY=${C_noW_ENERGY} kcal/mol L_noW_ENERGY=${L_noW_ENERGY} kcal/mol R_noW_ENERGY=${R_noW_ENERGY} kcal/mol"
    CRL_BINDING_ENERGY=$( echo "${C_noW_ENERGY} - ${L_noW_ENERGY} - ${R_noW_ENERGY}" | bc )
    echo "    Complex binding energy = ${CRL_BINDING_ENERGY} kcal/mol"
    if [[ ${MUT_NUM} -ne 0 ]];then

      for i in $(awk '$1!="#"{print $1}' ../../mutations/listm.log)
      do
        C_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' C_${i}_2A.arc)
        L_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' L_${i}_2A.arc)
        R_ENERGY=$(awk '$1=="HEAT" && $2=="OF" && $3=="FORMATION" {print $5}' R_${i}_2A.arc)
 
        #echo "C_ENERGY=${C_ENERGY} kcal/mol L_ENERGY=${L_ENERGY} kcal/mol R_ENERGY=${R_ENERGY} kcal/mol"
        BINDING_ENERGY=$( echo "${C_ENERGY} - ${L_ENERGY} - ${R_ENERGY}" | bc )
        echo "${i} Complex binding energy = ${BINDING_ENERGY} kcal/mol"
      done
    fi
    # FOR tester.sh on test evaluation
    if [ ! -z "${TEST_WORK_NAME}" ];then
      if [ "${TEST_WORK_NAME}" = "1bx2shortened" ];then
        echo 
        echo "EXPECTED VALUES..."
        echo "    Complex binding energy = -56.99344 kcal/mol"
        echo "P02 Complex binding energy = -51.69986 kcal/mol"
        echo "P06 Complex binding energy = -33.75998 kcal/mol"
        echo
      fi
      if [ "${TEST_WORK_NAME}" = "3oxsstraight" ];then
         echo 
         echo "EXPECTED VALUES..."
         echo "    Complex binding energy = -124.68161 kcal/mol"
         echo "P02 Complex binding energy = -112.13525 kcal/mol"
         echo "P06 Complex binding energy = -120.46074 kcal/mol"
         echo 
      fi
    fi
  else
    echo "NUM_CALCS=${NUM_CALCS} of NUM_CALCS_EXPECTED=${NUM_CALCS_EXPECTED}"
    echo "You don't have the expected number of files in calculations/be_outputs dir."
    echo "MHCBI has any problem with the final MOPAC calculations."
    echo "Please, review any problem MHCBI had in the Stage 3."
  fi
else
  echo "You don't have any file in calculations/be_outputs dir."
  echo "MHCBI has any problem with the final MOPAC calculations."
  echo "Please, review any problem MHCBI had in the Stage 3."
fi
##############
cd ../..
##############
if [ -d "fmo-calculations" ];then
  if [ -d "fmo-calculations/fmo_molecules" ];then
    cd fmo-calculations/fmo_molecules
    FMO_CALCULATIONS_FILES=$(ls | wc -l)
    if [[ ${FMO_CALCULATIONS_FILES} -ne 0 ]];then
      echo
      echo "###############################"  
      echo "   GAMESS SQM (FMO-DFT-B)      "
      echo "   BINDING ENERGY RESULTS      "
      echo "           for                 "

      let num_c=$(ls C_*.log 2>&- | wc -l)
      let num_r=$(ls R_*.log 2>&- | wc -l)
      let num_l=$(ls L_*.log 2>&- | wc -l)
 
      NUM_CALCS=$( echo "($num_c + $num_r + ${num_l})" | bc)
      NUM_CALCS_EXPECTED=$( echo "(${MUT_NUM} + 1)*3" | bc)
      #echo "NUM_CALCS=${NUM_CALCS} of NUM_CALCS_EXPECTED=${NUM_CALCS_EXPECTED}"
      if [[ ${NUM_CALCS} -eq ${NUM_CALCS_EXPECTED} ]];then
 
        if [[ ${MUT_NUM} -eq 0 ]];then
          echo "$num_c complex ($num_r receptor and $num_l ligand)"
        else
          echo "$num_c complexes ($num_r receptors and $num_l ligands)"
        fi
        echo "###############################"
        echo
        ##############################
 
        C_noW_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' C_noW.log)
        L_noW_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' L_noW.log)
        R_noW_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' R_noW.log)
  
        #echo "C_noW_ENERGY=${C_noW_ENERGY} kcal/mol L_noW_ENERGY=${L_noW_ENERGY} kcal/mol R_noW_ENERGY=${R_noW_ENERGY} kcal/mol"
        CRL_BINDING_ENERGY=$( echo "${C_noW_ENERGY} - ${L_noW_ENERGY} - ${R_noW_ENERGY}" | bc )
        echo "    Complex binding energy = ${CRL_BINDING_ENERGY} kcal/mol"
        if [[ ${MUT_NUM} -ne 0 ]];then
 
          for i in $(awk '$1!="#"{print $1}' ../../mutations/listm.log)
          do
            C_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' C_${i}_2A.log)
            L_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' L_${i}_2A.log)
            R_ENERGY=$(awk '$1=="Free" && $2=="unco+D" && $3="energy" && $5="solvent=" {print $6}' R_${i}_2A.log)
 
            #echo "C_ENERGY=${C_ENERGY} kcal/mol L_ENERGY=${L_ENERGY} kcal/mol R_ENERGY=${R_ENERGY} kcal/mol"
            BINDING_ENERGY=$( echo "${C_ENERGY} - ${L_ENERGY} - ${R_ENERGY}" | bc )
            echo "${i} Complex binding energy = ${BINDING_ENERGY} kcal/mol"
          done
        fi
        # FOR tester.sh on test evaluation
        if [ ! -z "${TEST_WORK_NAME}" ];then
          if [ "${TEST_WORK_NAME}" = "1bx2shortened" ];then
            echo 
            echo "EXPECTED VALUES..."
            echo "    Complex binding energy = -.333481843 kcal/mol"
            echo "P02 Complex binding energy = -.325955749 kcal/mol"
            echo "P06 Complex binding energy = -.303522621 kcal/mol"
            echo
          fi
          if [ "${TEST_WORK_NAME}" = "3oxsstraight" ];then
            echo 
            echo "EXPECTED VALUES..."
            echo "    Complex binding energy = ???????? kcal/mol"
            echo "P02 Complex binding energy = ???????? kcal/mol"
            echo "P06 Complex binding energy = ???????? kcal/mol"
            echo 
          fi
        fi

      else
        echo "NUM_CALCS=${NUM_CALCS} of NUM_CALCS_EXPECTED=${NUM_CALCS_EXPECTED}"
        echo "You don't have the expected number of files in fmo-calculations/fmo_molecules"
      fi

    else
      echo "You don't have any file in fmo-calculations/fmo_molecules"
    fi 
  else
    echo "The fmo-calculations/fmo_molecules don't exist..."
  fi
else
  echo
  echo "There are not GAMESS calculations..."
fi
##############
echo
echo "Resume finished"
