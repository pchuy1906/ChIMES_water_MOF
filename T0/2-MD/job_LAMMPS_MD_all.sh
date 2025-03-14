#!/bin/sh

#SBATCH -N 1
#SBATCH -J NVT
#SBATCH -t 01:00:00
#SBATCH -p pbatch
#SBATCH -A iap
#SBATCH --exclusive

nnodes=1
nMPI=36

nframe=20
nstep=$(($nframe*5))

exe="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/imports/chimes_calculator/etc/lmp/exe/lmp_mpi_chimes"

cwd=`pwd`

sed 's/@nstep@/'"$nstep"'/g' _in.lammps > in.lammps
echo "$nframe" > VASP/LIST_STRUCTURE
srun -N $nnodes -n $nMPI   $exe  <  in.lammps   >   out.lammps
