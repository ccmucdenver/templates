#!/bin/bash
#SBATCH --job-name=singularity
#SBATCH --partition=math-alderaan
#SBATCH --nodes=1                   # Number of requested nodes
#SBATCH --time=1:00:00              # Max wall-clock time
#SBATCH --ntasks=1                  # Total number of tasks over all nodes, max 64*nodes


singularity exec /storage/singularity/go.sif ./hello.sh
