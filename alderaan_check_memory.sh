#!/bin/bash
#SBATCH --job-name=check_cgroups
#SBATCH --partition=math-alderaan-gpu

# pick one of the two, comment out the other

# 1.  run on math-alderaan-h01
##SBATCH --reservation=TEST_GPU
#SBATCH --partition=math-alderaan
#SBATCH --mem=500000

## 2. run on math-alderaan-c05 
#SBATCH --reservation=TEST_CORE
#SBATCH --cpus-per-task=4
#SBATCH --mem=50000

#SBATCH --time=00:05:00
#SBATCH --output=slurm-%j.out
# memory is limitd to 4096MB per cpu by default 
# override by --mem

gcc -o memcheck.exe memcheck.c  

./memcheck.exe 10000 5
./memcheck.exe 20000 5
./memcheck.exe 100000 5
./memcheck.exe 200000 5
./memcheck.exe 300000 5
./memcheck.exe 500000 5
./memcheck.exe 1000000 5
./memcheck.exe 10000000 5
