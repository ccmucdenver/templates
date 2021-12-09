#!/bin/bash
# A simple MPI job template
#SBATCH --job-name=mpi_hello
#SBATCH --partition=math-alderaan
#SBATCH --nodes=2                         # Number of requested nodes
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=2                        # Total number of tasks over all nodes, max 64*nodes

mpirun examples/mpi_hello_world.exe       # replace by your own executable, number of processors is auto

