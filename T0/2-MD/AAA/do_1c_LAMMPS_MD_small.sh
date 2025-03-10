fjob="job_LAMMPS_MD_all.sh"

#i=1
#nfjob="TMP_${i}.sh"
#cp $fjob $nfjob
#sed -i 's/sys_@@/CC_CN_vcopt/g' $nfjob
#sbatch $nfjob &> JOB_ID_$i

i=2
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=14
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/vcopt/g' $nfjob
sbatch $nfjob &> JOB_ID_$i
