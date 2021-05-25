Here is the basic format of `listm.log` file.
The `#` symbol indicates that is a comment line.

```  
#  Author: FIDIC Biomathematics Group
#  Citation: Ortiz-Mahecha, Carlos A., Agudelo, William A., Patarroyo, Manuel A., Patarroyo, Manuel E. and Suárez, Carlos F. 
#            "MHCBI: a pipeline for calculating peptide-MHC binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models." 
#             Briefings in Bioinformatics, 2021, 1-8. DOI: 10.1093/bib/bbab171
#  Contact: fidic.biomath@gmail.com, caraortizmah@gmail.com
#
#  This is a template for listing residue changes to create new pdbs. 
#  This template is part of the MHCBI pipeline.
#
#  Mutation format                I   Example 1:                  I  Example 2:                       
#  Features:                      I   1 pdb name per mutation     I  1 pdb name per several mutations 
#  (1). Name file (3 letters)     I ----------------------------- I ----------------------------------- 
#  (2). Residue name (3 letters)  I    (1)    (2)    (3)    (4)   I    (1)     (2)      (3)      (4)    
#  (3). Residue number            I  ---------------------------  I  ---------------------------------  
#  (4). Residue chain             I    A11    Ala     11     p    I    A11     Ala       11       p     
#  Each row has to be filled out  I    A15    Glu     15     a    I    efg     Lys       19       b     
#  regarding these four features  I    abc    His    254     b    I    A11     Glu       15       a     
# ------------------------------- I ----------------------------- I ----------------------------------- 
#
#  Do not delete the template
#  If only the initial structure's pMHC binding energy needs to be calculated, leave this template unchanged.  
# 
#  Begin  
# -----------------------------------
#   (1)     (2)      (3)      (4)   
# -----------------------------------
#  Fill out pdbs' features here,  Note: Please delete "#" character at start
# -----------------------------------
#  End 
```