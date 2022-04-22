#!/bin/bash
# Run mpi benchmarks on 2 nodes 
# Jan Mandel, December 9, 2021
#SBATCH --job-name=bench
#SBATCH --partition=math-alderaan
##SBATCH --nodes=2                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=192                  # Total number of tasks over all nodes, max 64*nodes

module load mpi
log=run_alderaan_large.log
rm -f $log
date > $log
mpirun examples/mpi_hello_world.exe >> $log
date >> $log
echo DONE >> $log

