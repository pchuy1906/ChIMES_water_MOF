#!/bin/bash
 
#SBATCH -J dftb
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 00:30:00
#SBATCH -A pbronze
#SBATCH -p pbatch
#SBATCH --exclusive

exe="/p/lustre1/pham20/codes/dftbplus-22.2/_build_MPI/_install/bin/dftb+"
srun -N 1 -n 36 $exe > DFTB_output

