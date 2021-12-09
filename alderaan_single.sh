#!/bin/bash
# A simple single job template
#SBATCH --job-name=mpi_hello_single
#SBATCH --partition=math-alderaan
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=1                        # number of cores, leave at 1 

examples/hello_world_fortran.exe          # replace by your own executable

