The MHCBI pipeline only needs gfortran and some linux test processing tools (cut, grep, awk, gawk, sed and vim), however it uses several types of specialized software relying on other kinds of requirements.


Before starting any procedure regarding the MHCBI pipeline, first of all type:
```
  $ sudo apt update
  $ sudo apt install build-essential
  $ sudo apt install gfortran
  $ sudo apt install git
```

**For Dowser installation:**
You must install csh prior to Dowser.
For further information go to [Dowser GitHub repository.](https://github.com/fidic-biomath/dowser)

**For OpenBabel:**
Go to [Open Babel wiki](http://openbabel.org/wiki/Main_Page) for installing it.
Further information about releases [OpenBabel GitHub](https://github.com/openbabel/openbabel/releases)

**For VMD:**
For further information go to [the following page.](https://www.ks.uiuc.edu/Research/vmd/current/ig/ig.html)
A helpful page for installing could be:

1. https://www.biostars.org/p/196147/

NOTE: The following message could appear due to a non-existent binary path related to another process in VMD:

rlwrap: Command not found.

You can install rlwrap (in ubuntu, apt-get install rlwrap)


**For PROPKA 3.1:**
You will need python 3.6 or higher and pip (python package installer) for installing PROPKA 3.1.
For further information go to [GitHub repository.](https://github.com/jensengroup/propka)

**For MOPAC:**
Installing MOPAC is straightforward (locating the MOPAC executable at http://openmopac.net/downloads.html). You only need to configure your .bashrc or .bash_profile by typing:
```
$ export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/mopac/mopac_cuda_5.5_libs/
```
The following files must in this path:

libcublas.so.5.5 libcudart.so.5.5 libiomp5.so

Further information can be found at the [MOPAC page requirements.](http://openmopac.net/Manual/Requirements_for_GPU_MOPAC.html)

**For GAMESS:**
This is a general ab initio quantum chemistry package. It is not easy at all to install. To download the source code.
Go to the [Gordon's group page.](https://www.msg.chem.iastate.edu/gamess/download.html)
Several pages that could be useful for installing GAMESS. You can clear up any doubts by reading several the pages mentioned below:

1. https://www.webmo.net/support/gamess_linux.html

2. https://sites.google.com/site/rangsiman1993/comp-chem/program-install/install-gamess

3. http://drphilipcarlson.weebly.com/installing-gamess.html

4. http://katter-world.blogspot.com/2012/04/installing-gamess-on-ubuntu-64-bit-zz.html


**For GUI Facio:**
You need to install Wine for executing Facio; you must launch Facio through Wine as Facio is not open source.
You can use the following page for Wine:
1. https://vitux.com/how-to-install-wine-on-ubuntu/
