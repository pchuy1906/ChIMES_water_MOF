#!/bin/sh

#SBATCH -N 1
#SBATCH -J lsq
#SBATCH -t 00:30:00
#SBATCH -p pdebug
#SBATCH -A pbronze
#SBATCH --exclusive

src_chimes_lsq="/p/lustre2/pham20/codes/ChIMES_2025_develop/chimes_lsq/"

nnodes=1
nMPI=36
exe="${src_chimes_lsq}/build/chimes_lsq"
date
srun -N $nnodes -n $nMPI $exe  fm_setup.in >& fm_setup.out
date

nAtomType=5
nCondensed=0
file_xyzf=`grep -A1 TRJFILE fm_setup.in | tail -1 | awk '{print $1}'`
wE=200
wS=500

python ~/tools/others/read_frame_info/read_frame_info2.py \
--nAtomType    $nAtomType \
--nCondensed   $nCondensed \
--wE           $wE \
--wS           $wS

paste b.txt  new_weight.dat   label.txt  | grep force > AAA_force_weight.dat
