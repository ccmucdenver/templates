#!/bin/bash
# alderaan_mpi_general.sh
# A a more general MPI job template

#SBATCH --job-name=mpi_hello
#SBATCH --partition=math-alderaan
#SBATCH --nodes=2                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=5                  # Total number of tasks over all nodes, max 64*nodes

mpirun -np 10 examples/mpi_hello_world.exe # replace by your own executable and number of processors
# do not use more processors that the number of tasks requested

