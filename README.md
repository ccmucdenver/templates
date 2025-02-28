## Templates 
Template MPI code and script to run on [CCM clusters](https://ccm-docs.readthedocs.io) 
as well as others. Tested on 
cheyenne.ucar.edu
frontera.tacc.utexas.edu
math-alderaan.ucdenver.pvt cluster (build on math-alderaan)
math-colibri.ucdenver.pvt cluster (build on clas-compute)
math-score.ucdenver.pvt cluster (build on clas-compute)

1. Clone this repository if you have not already:
```
git clone https://github.com/ccmucdenver/templates.git
```
or, if you have ssh access to github set up,
```
git@github.com:ccmucdenver/templates.git
```
Then,
```
cd templates
```

2. To use:
```
cd examples
make
cd ..
sbatch run_alderaan.slurm
```
and look for the file run_alderaan.log
Similarly on other machnines.

## Test for core and GPU separation

For GPU visibility:

     sbatch alderaan_check_cgroups.sh

For CPU separation:

     sbatch alderaan_test_core_isolation.sh
