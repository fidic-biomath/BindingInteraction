# Binding Interaction

`MHC Binding Interaction (MHCBI)` is a pipeline software that manages and uses other programmes to perform some tasks related to calculating protein peptide receptor-ligand binding energy in the field of computational chemistry.

The aim of the `MHCBI` pipeline is to automate tasks regarding binding energy methodology for major histocompatibility complex (MHC) systems requiring several replications for estimating receptor-ligand interactions.

It can therefore be extrapolated to other non-covalent interaction systems (i.e. MHC-like structures).

This pipeline is an open source tool (GPL-3.0 Licence) and is intended to be adapted, modified or used according to user needs.

The `MHCBI` uses some programmes and does several tasks as detailed below:

     1. Dowser and DowserX software for putting water molecules into a protein structure.
     2. MOPAC software for several kinds of calculation using semi-empirical quantum methods (SQM), 
        such as optimisation geometries and single point energies, as in this methodology.
     3. Dunbrack library on graphical interface Chimera software for substituting residues 
        for others selected by the user.
     4. PROPKA 3.1 for assigning charges to a protein structure.
     5. GAMESS software for calculating binding energy using the Fragment Molecular Orbital method (FMO) at SQM DFTB3. 
        Molecules must be fragmented prior to single point energy calculation, when the `MHCBI` uses GAMESS software. 
        Such fragmentation is performed by a graphical user interface programme known as Facio; 
        however, Facio is not controlled by `MHCBI` in script mode due to this program having a non-open-source licence.

## Installation

The `MHCBI` pipeline is mostly written in Shell script and includes Python and Tcl languages for managing programme operations in graphical interface software, such as Dowser in VMD and Dunbrack’s library in Chimera.

### 1st step: You must install the following programmes before configuring the pipeline:

#### Requirements - Linux text processing and development tools (see more details in [Requirements](https://github.com/fidic-biomath/BindingInteraction/wiki/MHCBI:-Requirements))

* grep
* cut
* awk
* gawk
* sed
* vim
* build-essential
* gfortran
* git

#### Requirements - Specialized softwares

* [Open Babel 2.3.1](https://openbabel.org/docs/dev/Installation/install.html) or [2.4.0](https://sourceforge.net/projects/openbabel/files/openbabel/2.4.0/) - Open Babel

* [Python 2.7 or higher](https://www.python.org/downloads/) - Python page

* [VMD version 1.9.1 (February 1, 2012) or higher](https://www.ks.uiuc.edu/Research/vmd/) - VMD page

* [VMD Dowser plugin](http://www.ks.uiuc.edu/Research/vmd/plugins/dowser/) - Version 1.1

* [Dowser](https://github.com/fidic-biomath/dowser) - non-Official GitHub repository.

* [MOPAC 2016](http://openmopac.net/Download_MOPAC_Executable_Step2.html) - MOPAC page

* [Chimera](https://www.cgl.ucsf.edu/chimera/download.html) - Chimera page

* [PROPKA-3.1](https://github.com/jensengroup/propka-3.1.git) - PROPKA-3.1 GitHub

#### FOR DFTB-FMO CALCULATIONS:

* [GAMESS](https://www.msg.chem.iastate.edu/GAMESS/download/register/) - Gordon Group page

* [Facio FMOutil](http://zzzfelis.sakura.ne.jp/) - Facio page


### 2nd Step. Download

To get the git version type 

    $ git clone https://github.com/fidic-biomath/BindingInteraction.git
    
The MHCBI pipeline has five folders such as BindingInteraction, docs, source, test and misc. 

The BindingInteraction folder contains essential scripts for installing and configuring the pipeline. The Installation stage relies on this folder.
The docs folder contains a brief manual for users.
The source folder contains all the scripts involved in MHCBI performance for every user project. This folder is placed at the core of the MHCBI pipeline.
The test folder contains two PDB structure examples: short (MHC class II) and straight (MHC class I) which a user has to use to test the pipeline.
The misc folder contains third order parameters for organic and biological systems (3OB) that are needed for calculations under FMO framework in GAMESS using the DFTB3 method.
Short test consists of a shortened HLA-DR2 molecule complexed with a human myelin basic protein peptide (the original PDB structure is known as 1BX2 in the protein data bank). Straight test consists of HLA A*02:07 complexed with the hepatitis B virus (HBV) core 18-27 peptide (the original PDB structure is known as 3OXS in the protein data bank).    
    

### 3rd step: initialize the `MHCBI` pipeline

    $ cd BindingInteraction
    $ chmod +x init.sh
    $ ./init.sh
    
the MHCBI asks about location when you are going to install the pipeline. If answering yes, your location will be the same as the git location, otherwise (answering no) you have to provide a new location for installing it.

### 4th step: configure all pipeline scripts and set paths for external programs

    $ ./setup.sh

  Complete all setup steps in order

    1. Paths for all the required external programs
    2. Test the pipeline


## Running the MHC Binding Interaction pipeline
See [MHC BindingInteraction manual](https://github.com/fidic-biomath/BindingInteraction/wiki).

## Additional handling

You can test the `MHCBI` pipeline by downloading and using the following [virtual machine](http://www.fidic.org.co/pagina/MHCBI.zip). 
This virtual machine has an Ubuntu 20.04 installation having all the requirements needed for using the pipeline.
 

# Referring to and citing the `MHCBI` pipeline

Please cite the following reference in publications:

*   Ortiz-Mahecha, Carlos A., Agudelo, William A., Patarroyo, Manuel A., Patarroyo, Manuel E. and Suárez, Carlos F. ["MHCBI: a pipeline for calculating peptide-MHC binding energy using semi-empirical quantum mechanical methods with explicit/implicit solvent models."](https://doi.org/10.1093/bib/bbab171) Briefings in Bioinformatics, 2021, 1-8. DOI: 10.1093/bib/bbab171

*   Ortiz-Mahecha, Carlos A., Bohórquez, Hugo J., Agudelo, William A., Patarroyo, Manuel A., Patarroyo, Manuel E. and Suárez, Carlos F. ["Assessing peptide binding to MHC II: An accurate semi-empirical quantum mechanics-based proposal."](https://doi.org/10.1021/acs.jcim.9b00672) Journal of Chemical Information and Modeling, (2019). - DOI: 10.1021/acs.jcim.9b00672

