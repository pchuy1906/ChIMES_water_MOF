#!/bin/sh

#SBATCH -N 2
#SBATCH -J NVT
#SBATCH -t 01:00:00
#SBATCH -p pdebug
#SBATCH -A iap
#SBATCH --exclusive

nnodes=2
nMPI=224

nframe=200
nstep=$(($nframe*5))
n1=$(($nframe/2))

exe="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/imports/chimes_calculator/etc/lmp/exe/lmp_mpi_chimes"

cwd=`pwd`
for fold in $(ls -1vd sys_@@_*/run-1) ; do
    cd $fold
        if [ ! -e "log.lammps" ]; then
            sed 's/@nstep@/'"$nstep"'/g' _in.lammps > in.lammps
            echo "$nframe" > VASP/LIST_STRUCTURE
           #echo "$n1"    >> VASP/LIST_STRUCTURE
            srun -N $nnodes -n $nMPI   $exe  <  in.lammps   >   out.lammps
        fi
    cd $cwd
done
