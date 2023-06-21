#!/bin/bash
# aws_mpi.sh
# A simple MPI job template
# Jan Mandel, July  16, 2023
#SBATCH --job-name=mpi_hello
#SBATCH --partition=compute
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=384                      # Total number of MPI processe
#SBATCH --nodes=2

which mpirun
log=aws_mpi.log
rm -f $log
date > $log
mpirun examples/mpi_hello_world.exe >> $log
mpirun examples/mpi/pt2pt/osu_bw >>  $log
mpirun examples/mpi/pt2pt/osu_latency >> $log
date >> $log
echo DONE >> $log
