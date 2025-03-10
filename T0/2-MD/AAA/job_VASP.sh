#!/bin/sh

#SBATCH -N 2
#SBATCH -J DFT
#SBATCH -t 01:00:00
#SBATCH -p pdebug
#SBATCH -A iap
#SBATCH --exclusive

nnodes=2
nMPI=224

POTCARpool="/usr/gapps/emc-vasp/pseudopotentials/potpaw_PBE.54"

cwd=`pwd`
for fold in $(ls -1vd @prefix@*/run*/VASP/VASP_*) ; do
    cd $fold
        rm -rf POTCAR
        while read type ; do
            echo $type
            cat ${POTCARpool}/${type}/POTCAR >> POTCAR
        done < ntype.dat
        
        mv INCAR_PBE INCAR
        srun -N $nnodes -n $nMPI /usr/gapps/emc-vasp/vasp.6.3.0_vtst/bin/vasp_gam > out_PBE
        
        mv INCAR_SCAN INCAR
        srun -N $nnodes -n $nMPI /usr/gapps/emc-vasp/vasp.6.3.0_vtst/bin/vasp_gam > out_SCAN
    cd $cwd
done
