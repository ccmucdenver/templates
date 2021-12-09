#!/bin/bash
# A simple MPI job template
#SBATCH --job-name=mpi_hello
#SBATCH --partition=math-alderaan
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=360                      # Total number of MPI processes, no need for --nodes

mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np

