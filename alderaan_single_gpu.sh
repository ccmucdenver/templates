#!/bin/bash
# alderaan_single.sh
# A simple single core job template
# Jan Mandel, March 2022 
#SBATCH --job-name=mpi_hello_single
#SBATCH --partition=math-alderaan-gpu
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=1                        # number of cores 

singularity exec /storage/singularity/tensorflow.sif python3 gpucode.py >& gpucode.log
