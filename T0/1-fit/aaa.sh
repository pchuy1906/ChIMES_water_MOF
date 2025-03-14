nnodes=1
nMPI=36

nall=7000
neach=2500
nrun=$(($nall/$neach))

sed -i 's/.*#SBATCH -N.*/#SBATCH -N '"$nnodes"'/' job*.sh
sed -i 's/.*nnodes=.*/nnodes='"$nnodes"'/'        job*.sh
sed -i 's/.*nMPI=.*/nMPI='"$nMPI"'/'              job*.sh
sed -i 's/.*max_iter=.*/max_iter='"$nall"'/'      job*.sh

sbatch job1.sh &> JOB_ID
JOBID=`tail -1 JOB_ID | awk '{print $NF}'`
sbatch --dependency=afterany:$JOBID job2.01.sh &> JOB_ID_1

#for i in $(seq 2 2) ; do
#    prev=$(($i-1))
#    nstep=$(($i*$neach))
#    JOBID=`tail -1 JOB_ID_${prev} | awk '{print $NF}'`
#    nfile="TMP_${i}.sh"
#    cp job3.sh $nfile
#    sbatch --dependency=afterany:$JOBID $nfile &> JOB_ID_$i
#done
