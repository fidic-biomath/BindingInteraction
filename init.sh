#!/bin/bash

#*************************************
# The MCH Binding Interaction (MHCBI) pipeline
# Author: FIDIC Biomathematics Group
# Citation: Ortiz-Mahecha CA, Agudelo WA, Patarroyo MA, Patarroyo ME and Suarez CF. MHCBI: a pipeline for calculating peptide-protein binding energy using     semi-empirical quantum mechanical methods with explicit/implicit solvent models. submitted
# Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com
#***************************************
# @comment:
#  This is the initial program enabling installation, setup, and running.
#*************************************

#****************************************************************************************
#******   The Major Histocompatibility Complex Binding Interaction  pipeline       ******
#******                                                                            ******
#******           This pipeline has been developed by                              ******
#******                                                                            ******
#******               FIDIC Biomathematics Group                                   ******
#******                                                                            ******
#****** Further info:  https://github.com/fidic-biomath/BindingInteraction         ******
#****************************************************************************************

echo "**************************************************************"
echo "|||               Welcome to The MHCBI pipeline            |||"
echo "|||                                                        |||"
echo "||| Further info:                                          |||"
echo "|||   https://github.com/fidic-biomath/BindingInteraction  |||"
echo "|||                                                        |||"
echo "**************************************************************"

mv BindingInteraction/install.sh .
mv BindingInteraction/clean.sh .
chmod +rx *.sh
echo "****** MHCBI says: ******"
echo "  Starting pipeline "
./install.sh

echo ""
echo "Once you are in the MHCBI path"
echo "  Type ./setup.sh"
