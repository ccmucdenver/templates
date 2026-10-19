#!/bin/bash
#SBATCH --job-name=check_cgroups
#SBATCH --partition=math-alderaan-gpu
#SBATCH --reservation=TEST_GPU
#SBATCH --gres=gpu:a100:1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:05:00
#SBATCH --output=slurm-%j.out

echo "==== Checking SLURM cgroup Directories ===="
ls /sys/fs/cgroup/devices/slurm/ || echo "No SLURM device cgroup found"

ls /sys/fs/cgroup/cpuset/slurm/ || echo "No SLURM cpuset cgroup found"

echo "==== Checking Assigned CPU Cores ===="
cat /sys/fs/cgroup/cpuset/slurm/uid_$(id -u)/job_$SLURM_JOB_ID/cpuset.cpus || echo "No CPU restriction found"

echo "==== Checking Assigned GPUs (SLURM should restrict access) ===="
nvidia-smi

