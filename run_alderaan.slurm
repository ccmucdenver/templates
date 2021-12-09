#!/bin/bash
# Run mpi benchmarks on 2 nodes 
# Jan Mandel, December 9, 2021
#SBATCH --job-name=bench
#SBATCH --partition=math-alderaan
#SBATCH --nodes=2                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=2                  # Total number of tasks over all nodes, max 64*nodes

mpirun -np 2 examples/mpi_hello_world.exe
mpirun -np 2 examples/mpi/pt2pt/osu_bw
mpirun -np 2 examples/mpi/pt2pt/osu_latency

