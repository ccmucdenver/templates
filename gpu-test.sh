#!/bin/bash
# A simple single core job template with gpu cuda12
# Jan Mandel, July 2025 
#SBATCH --job-name=gpu-cuda12
#SBATCH --partition=math-alderaan-gpu-cuda12
#SBATCH --gres=gpu:a100:1
#SBATCH --time=0-0:01:00                  # Max wall-clock time - one hour
#SBATCH --ntasks=1                        # number of cores 

source ~/.bashrc
conda activate tf-gpu-test

python gpu-test.py
