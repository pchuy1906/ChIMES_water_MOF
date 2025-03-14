source ~/.BASHRC_PYTHON

cwd=`pwd`
for fold in $(ls -1vd DFTB/run*) ; do
    cd $fold
        pwd
        sbatch $cwd/job_dftb.sh &> JOB_ID
    cd $cwd
done

