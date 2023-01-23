#!/bin/bash
# alderaan_single.sh
# A simple single core job template
# Jan Mandel, December 2021
#SBATCH --job-name=mpi_hello_single
#SBATCH --partition=math-alderaan
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=1                        # number of cores, leave at 1 

echo hello from node `hostname`
