#!/bin/bash
# alderaan_mpi_simple.sh
# A simple MPI job template
# Jan Mandel, December 8, 2020
#SBATCH --job-name=mpi_hello
#SBATCH --partition=math-alderaan
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=128                      # Total number of MPI processes, no need for --nodes

mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np, uses --ntasks above

echo MPMD example

mpirun -n 5 examples/mpi_hello_world.exe : -n 10 examples/mpi_hello_world.exe # replace by your own executable, no need for -np
