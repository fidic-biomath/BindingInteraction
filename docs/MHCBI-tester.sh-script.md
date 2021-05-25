At the end of running pipeline, you can execute `tester.sh` script to obtain a summary information about the all calculations.

Below is an example of the script output for `1bx2shortened` test (for run this test, you ...)

```
##################################
  MHCBI scanning dirs and files...
##################################

cut: the delimiter must be a single character
Try 'cut --help' for more information.
Running paths source found..................................... passed 
External program paths source found............................ passed 
1st Stage directory folder
Optimizations folder created................................... passed 
2nd Stage directory folder
Mutations folder created....................................... passed 
3rd Stage directory folder
Calculations folder created.................................... passed 
Stage 1.1: Initial PDB structure found......................... passed 
Stage 1.2: Dowser work folder found............................ passed 
Stage 1.3: 2nd step found...................................... passed 
Stage 1.4: Dowser procedure completed.......................... passed 
Stage 1.5: 2nd step completed.................................. passed 
Stage 1.6: 3rd step found...................................... passed 
Stage 1.7: Dowser output as input found........................ passed 
Stage 1.8: Mopac input for adding hydrogens found.............. passed 
Stage 1.9: Mopac input completed............................... passed 
Stage 1.10: 4th step found..................................... passed 
Stage 1.11: Mopac input for optimizing hydrogens found......... passed 
Stage 1.12: Mopac output hydrogen optimization completed....... passed 
Stage 1.13: 5th step found..................................... passed 
Stage 1.14: Mopac input for all-atom optimizing found.......... passed 
Stage 1.15: Mopac output all-atom optimization completed....... passed 
Stage 1.16: 6th step found..................................... passed 
Stage 1.17: Final PDB structure with no water molecules found.. passed 
Stage 1.18: MOPAC no-water output found........................ passed 
Stage 1.19: Overall output stage 1 found....................... passed 
Stage 2.1: to-be-substituted residue list found................ passed 
Stage 2.2: Residues charged found.............................. passed 
Stage 2.3: Chimera python script found......................... passed 
Stage 2.4: Overall output found................................ passed 
Stage 2.5: Substituted PDB structures found.................... passed 
Stage 2.6: Substituted MOPAC ouputs found...................... passed 
Stage 3.1: Overall input found................................. passed 
Stage 3.2: Substituted MOPAC ouputs found...................... passed 
Stage 3.3: Overall output found................................ passed 
Stage 3.4: Overal substituted and charged PDB structures found. passed 

###########################
  MOPAC results scanning...
###########################

optimizations/1bx2shortened/3rd_step/molpdbw_H.out:  *  JOB ENDED NORMALLY  * 
optimizations/1bx2shortened/4th_step/input_OptH.out:  *  JOB ENDED NORMALLY  * 
optimizations/1bx2shortened/5th_step/input_Optall.out:  *  JOB ENDED NORMALLY  * 
mutations/mutation_P02/1bx2shortened_P02_2A.out:  *  JOB ENDED NORMALLY  * 
mutations/mutation_P06/1bx2shortened_P06_2A.out:  *  JOB ENDED NORMALLY  * 
mutations/P02/1bx2shortened-P02.out:  *  JOB ENDED NORMALLY  * 
mutations/P06/1bx2shortened-P06.out:  *  JOB ENDED NORMALLY  * 
calculations/noW_charged/new_input.out:  *  JOB ENDED NORMALLY  * 
calculations/P02_2A_charged/new_input.out:  *  JOB ENDED NORMALLY  * 
calculations/P06_2A_charged/new_input.out:  *  JOB ENDED NORMALLY  * 
calculations/noW_charged/complex_noW/comp_final_noW.out:  *  JOB ENDED NORMALLY  * 
calculations/noW_charged/comp-pep_noW/comp-pep_final_noW.out:  *  JOB ENDED NORMALLY  * 
calculations/noW_charged/pep_noW/pep_final_noW.out:  *  JOB ENDED NORMALLY  * 
calculations/P02_2A_charged/complex_P02_2A/comp_final_P02_2A.out:  *  JOB ENDED NORMALLY  * 
calculations/P02_2A_charged/comp-pep_P02_2A/comp-pep_final_P02_2A.out:  *  JOB ENDED NORMALLY  * 
calculations/P02_2A_charged/pep_P02_2A/pep_final_P02_2A.out:  *  JOB ENDED NORMALLY  * 
calculations/P06_2A_charged/complex_P06_2A/comp_final_P06_2A.out:  *  JOB ENDED NORMALLY  * 
calculations/P06_2A_charged/comp-pep_P06_2A/comp-pep_final_P06_2A.out:  *  JOB ENDED NORMALLY  * 
calculations/P06_2A_charged/pep_P06_2A/pep_final_P06_2A.out:  *  JOB ENDED NORMALLY  * 
Total MOPAC results passed ...  19 of 19 
Total MOPAC results failed ...  0 of 19 

###############################
           MOPAC SQM           
     BINDING ENERGY RESULTS    
              for              
3 complexes (3 receptors and 3 ligands)
###############################

Complex binding energy = 56.34946 kcal/mol
P02 Complex binding energy = 59.25591 kcal/mol
P06 Complex binding energy = 63.41482 kcal/mol

Resume finished
```