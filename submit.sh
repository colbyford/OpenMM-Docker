#!/bin/bash
#SBATCH --job-name="openmm"
#SBATCH --partition=GPU
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --gres=gpu:1
#SBATCH --time=1:00:00

module load singularity
export SINGULARITY_CONTAINER_HOME=$(pwd)

module load cuda/12.1

singularity exec --nv $SINGULARITY_CONTAINER_HOME/openmm.sif python run_demo.py