#!/bin/bash
#Author: Carlos Andres Ortiz Mahecha
#caraortizmah@gmail.com

let input=0

while [ $input -ne 3 ]; 2> /dev/null
do
	echo "**** The MHCBI Pipeline ****"
	echo "Please select your option"
	echo "1 Set paths"
	echo "2 Set external program paths"
	echo "3 Configure pipeline"
	echo "4 End pipeline setup"
	echo " "
	echo " "
	read input
	case $input in
		1)
			echo "***Assigning paths***"
			echo " "
			./paths.sh
			echo "...going to the menu..."
			;;
		2)
			echo "***Assigning external program paths***"
			echo " "
			./pro_paths.sh
			;;
		3)
			echo "***Configuring program directories and folders***"
			echo " "
			./conf.sh
			echo "...going to the menu..."
			;;
		4)
			echo "  Closing pipeline... bye "
			exit 1
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
echo "end"
