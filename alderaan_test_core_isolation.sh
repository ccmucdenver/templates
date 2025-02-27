#!/bin/bash
#SBATCH --job-name=core_isolation
## specify partition and reservation to run in
## create the reservation first by something like
## scontrol create reservation=TEST_GPU nodes=math-alderaan-h01 starttime=now duration=infinite user=test flags=OVERLAP 
## scontrol show reservation=TEST_GPU
#SBATCH --partition=math-alderaan-gpu
#SBATCH --reservation=TEST_GPU
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --time=00:05:00

echo "==== Checking SLURM CPU Core Assignment ===="
echo "SLURM Job ID: $SLURM_JOB_ID"
echo "Node: $(hostname)"
echo "Total CPUs Assigned: $SLURM_CPUS_ON_NODE"

# Print assigned cores from cgroups
echo "CPU Cores Assigned via Cgroups:"
cat /sys/fs/cgroup/cpuset/slurm/uid_$(id -u)/job_$SLURM_JOB_ID/cpuset.cpus

# Start a CPU-intensive process WITHOUT manual core binding
echo "Running a CPU-intensive process WITHOUT specifying core affinity..."
python3 -c "
import time
import multiprocessing

def cpu_work():
    while True:
        pass  # Keep CPU busy

# Launch processes equal to allocated CPUs
processes = [multiprocessing.Process(target=cpu_work) for _ in range($SLURM_CPUS_ON_NODE)]
for p in processes:
    p.start()

# Let them run for 30 seconds
time.sleep(30)
" &

# Allow time for processes to start
sleep 5

# Get running process PIDs
pgrep -u $(id -u) > running_pids.txt

echo "==== Checking CPU Usage Per Process with pidstat ===="
pidstat -p ALL -C python 1 10 | tee pidstat_output.log

echo "Test completed."

