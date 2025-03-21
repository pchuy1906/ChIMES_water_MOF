sfold="run-1"

module load python/3.12.2

cwd=`pwd`

if [ "$#" -eq 0 ]; then
    list_run=`ls -1vd condensed*/$sfold`
else
    for element in "$@" ; do
        list_run="${list_run} $element/$sfold"
    done
fi
    
echo ${list_run}

for fold in ${list_run} ; do
    cd $fold
        pwd
        python ../../../../scripts/read_dump.py  --file_dump dump_xyz_vxyz  --cell_type  cell_9 --atom_types Al C H N O
        mv lammps.xyz traj.xyz
        ../../../../scripts/do_collect_LAMMPS_step.sh
    cd $cwd
done
