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

## Gurobi on Alderaan

First follow the [Gurobi installation and license instructions](https://ccm-docs.readthedocs.io/en/latest/gurobi/).
Use the shared examples directly; no cloning or script edits are needed.

In a JupyterHub terminal:

```bash
conda activate gurobi
bash /shared/templates/examples/gurobi/simple.sh
```

Expected result: `x=2, y=2, objective=10`.

For Slurm, submit from your home directory so the output file is writable:

```bash
conda activate gurobi
cd ~
sbatch /shared/templates/examples/gurobi/simple.slurm
```

Output goes to `~/gurobi-JOBID.out`, where `JOBID` is the submitted job number.

For the optional notebook, first register the **Python (gurobi)** kernel as
explained in the installation guide. Copy the notebook into your home directory
so you can save its output:

```bash
cp -i /shared/templates/examples/gurobi/simple.ipynb ~/gurobi-test.ipynb
```

Open `gurobi-test.ipynb` in JupyterLab, select **Python (gurobi)**, and run the
code cell. Shut down the kernel when finished. A WLS token can still count
toward the session limit for up to five minutes after the environment closes,
with default settings.
