# MHC BindingInteraction pipeline Manual

The MHCBI pipeline has four stages (including an optional step in the last stage), each stage having its own algorithm (named here as steps). Each step's hierarchy is explained below (go to hierarchy).
 
## Set up and run the pipeline

After performing all installing steps, you can run the pipeline for a _new project_.
```
$./pre-run.sh
```
You must complete all steps in order. The **First step** is aimed at setting some paths prior to running a _new project_:

> **Note:** A _new project_ is work performed by the MHCBI pipeline passing through the four stages: optimizations, mutations, charge assignment and calculations. 
> All folders, inputs and outputs created during the whole process are the _new project_. Each individual PDB structure has one _new project_.

The <ins>PDB structure path</ins> is the directory where the _new project_ is placed.

The <ins>PDB structure's</ins> name is the PDB structure, located in the previous path. 

A PDB file can have several molecules, and because of this, it is necessary take into account the following guidelines in this MHCBI pipeline:

   1.  PDB structures having an _MHC-like receptor-ligand_: A receptor must be named as the **A** and **B chain** and the ligand as the **P chain**. All crystallographic water molecules must be named as the **V chain**.
   2.  PDB structures having a _12-column features_: The `test` folder contains two examples (shortened 1BX2 and 3OXS) having 12-column features as should be used for every PDB structure in any project. All information not related to 3D atomic coordinates must be removed from the PDB structure for a _new project_.
   3.  PDB structures name: PDB structures must only be named to use alpha-numeric characters without any blank spaces. Remove any special character (e.g. #$/!@'Â´), including any kind of hyphen (-_), or punctuation (.,:;) from your PDB structure's name.

The <ins>to-do work path</ins> is the directory where you place the _new project_.

The <ins>name of your work</ins> is your _new project_'s name.

`setup.sh` and `pre-runs.sh` scripts create `*.log` files having all required paths. You can modify them without using the pipeline, but you cannot change any word related to the format. It is advisable to use the pipeline for setting paths.

In the `pre-run.sh` script, the **Second step** configures the pipeline core in all the new folders that will become the _new project_. If the MHCBI cannot detect one of the required paths, the configuration step will not be performed.

After configuring the _new project_ you can run the pipeline. The **Third step** has two options for running MHCBI concerning a PDB structure:

   1.  Performing the four-stage methodology in a single step.

   2.  Performing the four-stage methodology step by step.



## Running steps
 
The **First step** modifies PDB structure (input) by adding water molecules using the Dowser program and performs some optimization procedures for refining PDB geometry. At the end of this step a PDB file and .arc file (MOPAC output) are used as input for the **Second step**.

The **Second step** uses **First step** output and  [`listm.log`](https://github.com/fidic-biomath/BindingInteraction/wiki/MHCBI:-listm.log) for building new structures according to the written orders in `listm.log`: the new structures are named here as mutations.

Each mutation is performed by the Dunbrack library using the UCSF Chimera program. Multiple amino acid changes can be made for the same PDB structure. To sum up, the **Second step** creates new similar protein geometries from the initial PDB structure in the **First step**.  After creating new geometries, the **Second step** performs partial optimizations.

The `listm.log` file has the usage instructions for creating new PDB structures. Read the `listm.log` file completely before writing your mutation list. There are two examples of writing a mutation list for mono- and multiple-substitutions. The only part that you are going to change is explicitly explained in the `listm.log` between:
```
*** Begin
(Changes must be here)
*** End
```
This frame gives an example that you can use or remove according to your specific needs. The example gives ten mono-substitutions named as P01, P02, up to P10. Lysine is used as the amino acid in this example for the ten cases for positions 1 to 10 in the PDB structure P chain.

At the end of the **Second step** output is created as the `tobe_charged` folder. This folder contains all new partially optimized PDB structures, the initial PDB structure and a list of 8 Å distance residues from the ligand (the main part of the protein binding region) that could be protonated or deprotonated.

The **Third step** uses the `tobe_charged` folder (**Second step** output) as input for using PROPKA 3.1 for protonating and deprotonating residues in each PDB structure (geometries set).

The **Fourth step** also performs single points through MOPAC splitting each PDB structure into Complex, Receptor and Ligand. Output is placed in the `final_pdbs` and `be_outputs` folders. In the first folder contains the PDB files that will be used for creating FMO GAMESS input (optional) and the second folder contains `.arc` files having printed the energy as:
```
HEAT OF FORMATION = (energy value in Kcal/mol)
```
Such energy will be used by the user for computing **binding energies** (BE).

The optional procedure is part of the **Fourth step** and uses the `final_pdbs` folder as input for creating input for GAMESS computations. 

You must put your GAMESS inputs in the same place as PDB structures. 

Go to fmo-calculations/input_pdbs/ path, in that directory there are all complex, receptor and ligand PDB structures from substitutions set. 

Use GUI Facio to convert them into FMO GAMESS inputs.

This step depends on user supervision due to the GUI Facio environment.

After executing GAMESS you can extract the energies from the output file (`.log` file) by looking for (at the end of the file):

```
The first energy printed below is the best in FMO/PCM
```
```
Free unco+D energy in solvent= (energy value in hartree)
```
Such energy will be used by the user for computing **BE**.

For more information on how to perform the FMO calculation, please check the [example](https://github.com/fidic-biomath/BindingInteraction/wiki/MHCBI:-FMO-calculations).

Additional information about the methods could be consulted here: [FMO-GAMES](http://myweb.liu.edu/~nmatsuna/gamess/input/FMO.html) and [FACIO](https://www.yumpu.com/en/document/read/44787615/facio-ver-1642-manual-thank-you-very-much-for-). 

***

## To sum up

| Step | Instruction                                         | Command                 |
|------|-----------------------------------------------------|-------------------------|
| 1    | Set work and PDB directories                        | ./pre-run.sh (option 1) |
| 2    | Configure folders and scripts for the _new project_ | ./pre-run.sh (option 2) |
| 3    | Run the MHCBI pipeline                              | ./pre-run.sh (option 3) |

## Summary script
To see the summary script description:

Run [tester.sh](https://github.com/fidic-biomath/BindingInteraction/wiki/MHCBI:-tester.sh-script)

***

## Hierarchy

The MHCBI pipeline has several paths. The first path is the directory where you download and open the MHCBI pipeline (by yourself or using git clone command), this directory is named as the **git path**. You can configure and install the pipeline in the **git path** or in another path. If you are going to modify some scripts according to your needs, it is advisable to configure and install the pipeline in other location.

If you use another location for configuring and installing the pipeline, the second path will be officially the **MHCBI path**, otherwise the **git path** and **MHCBI path** will be the same. In **MHCBI path** you can test the pipeline and configure your own projects.

The pipeline test will remain in the **MHCBI path** and all configuration programs and setting works will be in this directory (**MHCBI path**).

When you are configuring paths for a _new project_ you must use another directory to place your _new project_ in. This new directory is named as _workdir path_.

### **git path**

This directory contains the MHCBI pipeline as it appears in the GitHub repository.  
Every time that you change the code you can repeat the installation and configuration process by typing in `./clean.sh` in **git path** first.

This path contains the following folders:

  1. BindingInteraction
  2. docs
  3. misc
  4. source
  5. test

The first folder contains manager scripts controlling all scripts placed in the fourth folder, the third folder has DFTB3 parameters and in the fifth folder the pipeline test.

For further information go to each folder and read their README files.

### **MHCBI path**

In this directory the pipeline is going to work. Do not change any line of code in this directory (read **git path**). In this directory the test folder is going to change, adding a new folder containing test performance.

The following folders have the same information as the **git path** ones:

  1. misc
  2. source
  3. test

### **workdir path**

In this directory your _new project_ will be placed. Test folders in **MHCBI path** and **workdir path** folders have the same hierarchy.

The following folders are in this directory:

  1. optimizations
  2. mutations
  3. calculations
  4. fmo-calculations
  5. misc
  6. source

You can explore the followings folders when the pipeline execution has finished:

  **1. optimizations:**
    This folder corresponds to the allÂ the  First step and you can explore the methodology step-by-step in the folder named according to your new project. The output folder in this step contains the result that the Second step will use. This folder involves six steps (named the same as your new project by the pipeline):

    1. Dowser (putting water molecules)
    2. Conversion to PDB structure for MOPAC
    3. Assigning hydrogens
    4. Optimizing hydrogens
    5. Optimizing all PDB structure
    6. Removing all water molecules

  **2. mutations:**
    This folder corresponds to the all Second step and you can explore it by looking for each mutation folder. In this location there are two folders per mutation (previously written in listm.log). Each pair of folders are named like this:
 name_of_substitution folder and mutation_name_of_substitution folder.
   For instance, if a substitution name is called P02 the name of its pair of folders will be: P02 and mutation_P02.
   In the first folder you will find all substitution processes and assignation of new hydrogens. In the second folder you will find the partial optimization process for this substitution. It means that if you set ten mutations, you will find twenty folders (two per substitution).
   Additionally, there is a folder named as "tobe_charged". This folder is the Second step output.

  **3. calculations:**
    This folder corresponds to the all Third step and you can explore it by looking for each mutation folder. In this location there is one folder per each PDB file located in the "tobe_charged" folder (that in this location is the input).
    Additionally, there are another two folders (final_pdbs and be_outputs) that are the Third step output.

  **4. fmo-calculations:**
    This folder corresponds to the all optional Fourth step and contains two folders. The first folder is named as "input_pdbs" forming part of the Third step output ("final_pdbs"). The second folder is named as "fmo_molecules" containing all FMO GAMESS input and output results.

  **5. misc:**
    This folder is the same as that placed in the git path.

  **6. source:**
    This folder is the same as that placed in the git path.
    All scripts in the source code must be studied for understanding each file in each folder in detail.

***

### Warnings!
 
Some Open Babel operations trigger messages that could be frightening; however those messages are atoms (ATOM) in PDB format named as HETATM by Dowser operations, do not worry about it.

When Dowser puts water molecules, some OpenBabel conversions give warnings that look like this:
```
=============================
*** Open Babel Warning in parseAtomRecord
WARNING: Problems reading a PDB file
Problems reading a HETATM or ATOM record.
According to the PDB specification,
columns 77-78 should contain the element symbol of an atom.
but OpenBabel found ' ' (atom 3)
==============================
```
If Dowser cannot find water molecules, messages like those below could appear:
```
PDB file '/home/work_path/work_name/../dowser/1_iter/placed_waters_1.pdb' contains no atoms.
PDB file '/home/work_path/work_name/../dowser/1_iter/placed_waters_2.pdb' contains no atoms.
PDB file '/home/work_path/work_name/../dowser/1_iter/placed_waters_3.pdb' contains no atoms.
1 molecule converted
```
The following message could appear due to a non-existent binary path related to another process in VMD:

```/usr/local/lib/vmd/vmd_LINUXAMD64: /lib/x86_64-linux-gnu/libGL.so.1: no version information available (required by /usr/local/lib/vmd/vmd_LINUXAMD64)```

Such messages do not affect the MHCBI performance.
