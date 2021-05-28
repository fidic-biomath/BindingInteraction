# Program execution (short test)

```
Please select your option
1. Configure FMO folders
2. Prepare running GAMESS execution command
3. Run MHCBI FMO
4. End running pipeline
```
______
Option 1
```
*** Configuring folders for FMO calculations ***
 
 
**** Note ***
All 3rd stage results are in PDB format at FMO-calculations folder
Use GUI Facio for creating GAMESS inputs under Fragment Molecular Orbital (FMO) method
*** MHCBI says ***
  
**All input GAMESS that you create using Facio must be placed in  (WORK_DIR)/fmo-calculations/fmo_molecules/**
  
 
  All folders were organized

...going to the menu...
```
**File paths (short test example):**
```
$ ls fmo-calculations/input_pdbs/
C_noW.pdb  C_P02_2A.pdb  C_P06_2A.pdb  L_noW.pdb  L_P02_2A.pdb  L_P06_2A.pdb  R_noW.pdb  R_P02_2A.pdb  R_P06_2A.pdb

$ ls fmo-calculations/fmo_molecules/
C_noW.inp  C_P02_2A.inp  C_P06_2A.inp  L_noW.inp  L_P02_2A.inp  L_P06_2A.inp  R_noW.inp  R_P02_2A.inp  R_P06_2A.inp
```
_______
Option 2
```
*** Preparing GAMESS execution command* **
 
Creating a FMO script 
The absolute GAMESS path name is  /usr/local/GAMESS/rungms
Do you want to declare some options for GAMESS execution? type (Yes(Y/y), otherwise (No(N/n)): y
 *** 
 
Options depends on your GAMESS customization level (read that in your own GAMESS installation). 
A standard option could be: 00 8 where 00 is the installed GAMESS version number 
and 8 the cpu cores number
 
Enter options for your GAMESS running: 
 
 exec_fmo.sh has been created
 
 
...going to the menu...
```
______
Option 3
```
*** Running input GAMESS ***
 
Did you complete all three running stages? If you really finished all stages 
type (Yes(Y/y), otherwise (No(N/n)): y
 *** 
 
Did you perform GAMESS inputs using GUI Facio? type (Yes(Y/y) or (No(N/n)): y
 *** 
 
Creating a chimera script 
Executing script_dftb_inp.sh over C_noW.inp
Executing script_dftb_inp.sh over C_P02_2A.inp
Executing script_dftb_inp.sh over C_P06_2A.inp
Executing script_dftb_inp.sh over L_noW.inp
Executing script_dftb_inp.sh over L_P02_2A.inp
Executing script_dftb_inp.sh over L_P06_2A.inp
Executing script_dftb_inp.sh over R_noW.inp
Executing script_dftb_inp.sh over R_P02_2A.inp
Executing script_dftb_inp.sh over R_P06_2A.inp
cp C_noW.inp /scrgamess/C_noW.F05
unset echo
setenv OUTPUT /scrgamess/C_noW.F06
setenv PUNCH /scrgamess/C_noW.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x C_noW -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp C_P02_2A.inp /scrgamess/C_P02_2A.F05
unset echo
setenv OUTPUT /scrgamess/C_P02_2A.F06
setenv PUNCH /scrgamess/C_P02_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x C_P02_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp C_P06_2A.inp /scrgamess/C_P06_2A.F05
unset echo
setenv OUTPUT /scrgamess/C_P06_2A.F06
setenv PUNCH /scrgamess/C_P06_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x C_P06_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp L_noW.inp /scrgamess/L_noW.F05
unset echo
setenv OUTPUT /scrgamess/L_noW.F06
setenv PUNCH /scrgamess/L_noW.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x L_noW -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp L_P02_2A.inp /scrgamess/L_P02_2A.F05
unset echo
setenv OUTPUT /scrgamess/L_P02_2A.F06
setenv PUNCH /scrgamess/L_P02_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x L_P02_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp L_P06_2A.inp /scrgamess/L_P06_2A.F05
unset echo
setenv OUTPUT /scrgamess/L_P06_2A.F06
setenv PUNCH /scrgamess/L_P06_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x L_P06_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp R_noW.inp /scrgamess/R_noW.F05
unset echo
setenv OUTPUT /scrgamess/R_noW.F06
setenv PUNCH /scrgamess/R_noW.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x R_noW -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp R_P02_2A.inp /scrgamess/R_P02_2A.F05
unset echo
setenv OUTPUT /scrgamess/R_P02_2A.F06
setenv PUNCH /scrgamess/R_P02_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x R_P02_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
cp R_P06_2A.inp /scrgamess/R_P06_2A.F05
unset echo
setenv OUTPUT /scrgamess/R_P06_2A.F06
setenv PUNCH /scrgamess/R_P06_2A.F07
unset echo
/usr/local/GAMESS/ddikick.x /usr/local/GAMESS/gamess.00.x R_P06_2A -ddi 1 1 111.111.1.2:cpus=1 -scr /scrgamess
unset echo
ls: No match.
ls: No match.
ls: No match.
****** MHCBI says: ******
  All GAMESS calculations were performed
 
...going to the menu...```
___________________________________
