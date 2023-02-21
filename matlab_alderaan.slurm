#!/bin/bash
#SBATCH --job-name=singularity
#SBATCH --partition=math-alderaan
#SBATCH --nodes=1                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
# matlab can use multiple cores
#SBATCH --ntasks=16                 # Total number of tasks over all nodes, max 64*nodes

# prepare yuor matlat script, here it is script.m
cat test.m |  matlab -nodisplay -nosplash -nodesktop
