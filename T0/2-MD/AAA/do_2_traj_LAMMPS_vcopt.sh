module load python/3.12.2

cwd=`pwd`

for fold in $(ls -1vd vcopt_*/run*) ; do
    cd $fold
        pwd
        python  ~/tools/others/read_dump.py  --file_dump dump_xyz_vxyz  --cell_type  cell_3 --atom_types C H N O
        ntail=`head -1 lammps.xyz | awk '{print $1+2}'` 
        tail -$ntail lammps.xyz > traj.xyz
        echo 1 > VASP/LIST_STRUCTURE
    cd $cwd
done

