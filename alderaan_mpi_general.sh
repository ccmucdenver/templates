#!/bin/bash
# alderaan_mpi_general.sh
# A a more general MPI job template
# Jan Mandel, December 8, 2021
#SBATCH --job-name=mpi_hello
#SBATCH --partition=math-alderaan
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=100                  # Total number of tasks over all nodes, max 64*nodes

mpirun -np 100 examples/mpi_hello_world.exe # replace by your own executable

