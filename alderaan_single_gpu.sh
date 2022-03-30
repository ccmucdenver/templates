#!/bin/bash
# alderaan_single.sh
# A simple single core job template
# Jan Mandel, March 2022 
#SBATCH --job-name=gpu
#SBATCH --partition=math-alderaan-gpu
#SBATCH --time=1:00:00                    # Max wall-clock time
#SBATCH --ntasks=1                        # number of cores 

# run tensorflow in singularity container
# redirect output to a file so that it can be inspected before the end of the job
singularity exec /storage/singularity/tensorflow.sif python3 gpucode.py >& gpucode.log 
# copy the output to the job output for reference
cat gpucode.log
