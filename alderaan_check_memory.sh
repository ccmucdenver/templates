#!/bin/bash
#SBATCH --job-name=check_cgroups
#SBATCH --partition=math-alderaan-gpu
#SBATCH --reservation=TEST_GPU
#SBATCH --cpus-per-task=4
#SBATCH --time=00:05:00
#SBATCH --output=slurm-%j.out
# memory is limitd to 4096MB per cpu by default 
# override by --mem
#SBATCH --mem=100000

gcc -o memcheck.exe memcheck.c  

./memcheck.exe 10000 5
./memcheck.exe 100000 5
./memcheck.exe 1000000 5
./memcheck.exe 10000000 5
