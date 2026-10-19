#!/bin/bash
# Run the adjacent Gurobi example using the user's Miniforge installation.
set -e

# Initialize Conda explicitly because scripts do not load interactive shell setup.
source "$HOME/miniforge3/etc/profile.d/conda.sh"
conda activate gurobi

# Locate simple.py relative to this script, regardless of the caller's directory.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Replace this shell with Python and return the example's exit status.
exec python "$script_dir/simple.py"
