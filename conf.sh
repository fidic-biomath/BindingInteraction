#!/bin/bash

#*************************************
# The MCH Binding Interaction (MHCBI) pipeline
# @author Carlos Andres Ortiz-Mahecha
#  (email: caraortizmah@gmail.com)
#  (email: caraortizmah@unal.edu.co)
# @comment:
#  This is the configuration pipeline through Shell Script, a straightforward to use it.
#*************************************


FILE=paths.log

if [ -f "$FILE" ]; then
	
	#Main path
	let cond=`grep -c "MHCBI path" paths.log`
	if [ ${cond} -eq 1 ]; then
		MHCBI_PATH=$(grep "MHCBI path" paths.log | cut -d':' -f2) # After this cut.. there is a non-empty string assigned in this variable
		if [[ -z "${MHCBI_PATH// }" ]] ; then # This ( ${param //} ) expands the param variable and replaces all matches of the pattern (a single space) with nothing
			echo "Pipeline path is empty"
		else
			echo "mhcbi_path finished" $MHCBI_PATH
		fi
	else
		echo "Pipeline path was not detected"
		echo "Something in paths.log would be wrong. Set all paths again"
	fi

	#Work directory
	let cond=`grep -c "Work path" paths.log`
	if [ ${cond} -eq 1 ]; then
		WORK_PATH=$(grep "Work path" paths.log | cut -d':' -f2)
		if [[ -z "${WORK_PATH// }" ]] ; then
			echo "Work directory is empty"
		else
			echo "work_path finished" $WORK_PATH
		fi
	else
		echo "Work directory was not detected"
		echo "Something in paths.log would be wrong. Set all paths again"
	fi

	#PDB structure path
	let cond=`grep -c "PDB path" paths.log`
	if [ ${cond} -eq 1 ]; then
		PDB_PATH=$(grep "PDB path" paths.log | cut -d':' -f2)
		if [[ -z "${PDB_PATH// }" ]] ; then
			echo "PDB structure path is empty"
		else
			echo "pdb_path finished" $PDB_PATH
		fi
	else
		echo "PDB structure path was not detected"
		echo "Something in paths.log would be wrong. Set all paths again"
	fi

	#PDB name
	let cond=`grep -c "PDB name" paths.log`
	if [ ${cond} -eq 1 ]; then
		PDB_NAME=$(grep "PDB name" paths.log | cut -d':' -f2)
		if [[ -z "${PDB_NAME// }" ]] ; then
			echo "PDB structure name is empty"
		else
			echo "pdb_name finished" $PDB_NAME
		fi
	else
		echo "PDB structure name was not detected"
		echo "Something in paths.log would be wrong. Set all paths again"
	fi

	#Work name
	let cond=`grep -c "Work name" paths.log`
	if [ ${cond} -eq 1 ]; then
		WORK_NAME=$(grep "Work name" paths.log | cut -d':' -f2)
		if [[ -z "${WORK_NAME// }" ]] ; then
			echo "To-do work name is empty"
			echo "Work name will be assigned as pdb structure name"
			WORK_NAME=$(echo "$PDB_NAME" | cut -d'.' -f1)
			echo "work_name finished" $WORK_NAME
		else
			echo "work_name finished" $WORK_NAME
		fi
	else
		echo "To-do work name was not detected"
		echo "Work name will be assigned as pdb structure name"
		WORK_NAME=$(echo "$PDB_NAME" | cut -d'.' -f1)
		echo "work_name finished" $WORK_NAME
	fi

	#Creating directories

	#mkdir -p $work_path
	#cp -r source/ $work_path
	
else
	echo "First of all set the list of directories"
	echo "(execute setup.sh and select option 1)"
	exit 1
fi
