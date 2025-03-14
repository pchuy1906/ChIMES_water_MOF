fjob="job_LAMMPS_MD_all.sh"

cwd=`pwd`
for fold in $(ls -1vd condensed*/run-1) ; do
    cd $fold
        cp $cwd/$fjob .
        sbatch $fjob &> JOB_ID
    cd $cwd
done
