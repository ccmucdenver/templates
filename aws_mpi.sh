#!/bin/bash
# aws_mpi.sh
# A simple MPI job template
# Jan Mandel, July  16, 2023
#SBATCH --job-name=mpi_hello
#SBATCH --partition=compute
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=180                      # Total number of MPI processe
#SBATCH --nodes=10

mpirun examples/mpi_hello_world.exe       # replace by your own executable, no need for -np, uses --ntasks above

echo MPMD example

mpirun -n 5 examples/mpi_hello_world.exe : -n 10 examples/mpi_hello_world.exe # replace by your own executable, no need for -np
