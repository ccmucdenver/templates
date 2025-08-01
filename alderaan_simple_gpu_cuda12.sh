#!/bin/bash
# A simple single core job template with gpu
# Jan Mandel, March 2022 
#SBATCH --job-name=gpu
#SBATCH --partition=math-alderaan-gpu-cuda12
#SBATCH --gres=gpu:a100:2
#SBATCH --time=0-1:00:00                    # Max wall-clock time - one hour
#SBATCH --ntasks=1                        # number of cores 
#SBATCH --mem=100G

# run tensorflow in singularity container
# redirect output to a file so that it can be inspected before the end of the job
singularity exec --nv /storage/singularity/cuda12.2-tf.sif python3 gpucode.py 
singularity exec --nv /storage/singularity/cuda12.2-tf.sif python3 gpu-test.py 
