#!/bin/bash
#SBATCH --job-name=gurobi-test
#SBATCH --partition=math-alderaan-quick
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=512M
#SBATCH --time=00:02:00
#SBATCH --output=gurobi-%j.out
#SBATCH --export=ALL

# Use the Conda environment activated before submission.
exec python /shared/templates/examples/gurobi/simple.py
