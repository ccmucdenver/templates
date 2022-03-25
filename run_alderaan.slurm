#!/bin/bash
# Run mpi benchmarks on 2 nodes 
# Jan Mandel, December 9, 2021
#SBATCH --job-name=bench
#SBATCH --partition=math-alderaan
#SBATCH --nodes=2                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=2                  # Total number of tasks over all nodes, max 64*nodes

log=run_alderaan.log
rm -f $log
date > $log
echo mpirun -np 2 examples/mpi_hello_world.exe >> $log
mpirun -np 2 examples/mpi_hello_world.exe >> $log
# echo mpirun -np 2 examples/hello_world_fortran.exe >> $log
# mpirun -np 2 examples/hello_world_fortran.exe >> $log
echo mpirun -np 2 examples/mpi/pt2pt/osu_bw >>  $log
mpirun -np 2 examples/mpi/pt2pt/osu_bw >>  $log
echo mpirun -np 2 examples/mpi/pt2pt/osu_latency >> $log
mpirun -np 2 examples/mpi/pt2pt/osu_latency >> $log
date >> $log
echo DONE >> $log

