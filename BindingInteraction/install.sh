#!/bin/bash

#*************************************
# The MCH Binding Interaction (MHCBI) pipeline
# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models. subm    itted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com

#  This is the installation pipeline through Shell Script.
#*************************************

echo "**********Installation**********"
echo "Your current installation directory is "$PWD
echo " "

while :
do
  read -p "Do you want to use it as MHCBI path name? (Yes(Y/y)/No(N/n)) " answer
  answer=${answer,,}

  if [ -z "${answer}" ]; then
  	echo "Empty answer, please enter again your answer - yes (y) or no (n)"
  elif [ $answer == "yes" ] || [ $answer == "y" ]; then
    echo " "
    pipeline_path=$PWD
    break
  elif [ $answer == "no" ] || [ $answer == "n" ]; then
    echo " "
    read -p "Enter the MHCBI path name : " pipeline_path
    break
  else
    echo "Please enter again your answer - yes (y) or no (n)"
  fi

done

if [ "$pipeline_path" != "$PWD" ]; then

	git=$PWD
	echo "***Creating folders..."
	mkdir -p $pipeline_path
	cd $pipeline_path
	mkdir -p MHCBI
	cd MHCBI
  rm -f MHCBI_uninstalled.readme
  cp $git/README.md .
	cp $git/BindingInteraction/setup.sh .
  cp $git/BindingInteraction/paths.sh .
	cp $git/BindingInteraction/pro_paths.sh .
	cp $git/BindingInteraction/conf.sh .
  cp $git/BindingInteraction/pre-run.sh .
	cp $git/BindingInteraction/uninstall.sh .
	chmod +x *.sh
	cp -r $git/source .
  cp -r $git/misc .
	cp -r $git/test .
	#cp source/pre-run.sh .
	#cp source/organizer.sh .
	echo "Go to the new directory"
	echo "Type cd "$pipeline_path"/MHCBI/"

else

  echo "***No additional operations were needed..."
  rm -f MHCBI_uninstalled.readme
  cd BindingInteraction/
  mv -f setup.sh ../
  mv -f paths.sh ../
  mv -f pro_paths.sh ../
  mv -f conf.sh ../
  mv -f pre-run.sh ../
  mv -f uninstall.sh ../
  cd ../
  chmod +x *.sh
  #cp source/pre-run.sh .
	echo "Stay in the same directory: "$PWD

fi
