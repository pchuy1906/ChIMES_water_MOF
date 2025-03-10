fjob="job_LAMMPS_MD_all.sh"

i=7
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_extreme_5000K_4.0gcm3/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=8
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_extreme_4000K_3.5gcm3/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=9
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_extreme_3000K_3.0gcm3/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=10
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_extreme_2000K_2.5gcm3/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=11
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_ambient_50GPa/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=12
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@_/condensed_TATB_ambient_0GPa/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=14
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/vcopt_TATB/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

#i=13
#nfjob="TMP_${i}.sh"
#cp $fjob $nfjob
#sed -i 's/sys_@@/condensed_HN3/g' $nfjob
#sbatch $nfjob &> JOB_ID_$i

#i=1
#nfjob="TMP_${i}.sh"
#cp $fjob $nfjob
#sed -i 's/sys_@@/CC_CN_vcopt/g' $nfjob
#sbatch $nfjob &> JOB_ID_$i

i=2
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_ambient/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=3
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=4
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new1/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=5
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new2/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=66
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new3_4/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=666
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new3_5/g' $nfjob
sbatch $nfjob &> JOB_ID_$i

i=6
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/condensed_new3/g' $nfjob
sbatch $nfjob &> JOB_ID_$i
