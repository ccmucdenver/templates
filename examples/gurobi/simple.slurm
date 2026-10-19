#!/bin/bash
# Submit from Alderaan with: sbatch /home/dshield/test/gurobi/simple.slurm
#SBATCH --job-name=gurobi-test
#SBATCH --partition=math-alderaan-quick
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=512M
#SBATCH --time=00:02:00
#SBATCH --chdir=/home/dshield/test/gurobi
#SBATCH --output=gurobi-%j.out

set -e
printf 'Slurm job: %s; node: %s\n' "$SLURM_JOB_ID" "$SLURMD_NODENAME"
# Record the exact test inputs; this standalone directory has no Git commit.
sha256sum simple.py simple.sh

# The working directory above locates the existing Conda activation wrapper.
exec ./simple.sh
