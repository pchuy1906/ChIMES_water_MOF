fjob="job_LAMMPS_MD_all.sh"
sfold="run-2"

prefix="condensed_TATB_extreme_5000K"
i=999
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i

prefix="condensed_TATB_extreme_4000K"
i=998
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i

prefix="condensed_TATB_extreme_3000K"
i=997
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i

prefix="condensed_TATB_extreme_2000K"
i=996
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i

prefix="condensed_TATB_ambient"
i=995
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i



prefix="condensed_HN3"
i=6
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i


prefix="condensed_new1"
i=3
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i


prefix="condensed_new2"
i=4
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i


prefix="condensed_new3"
i=5
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i


prefix="condensed_ambient"
i=1
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed /#sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i


prefix="condensed_new"
i=2
nfjob="TMP_${i}.sh"
cp $fjob $nfjob
sed -i 's/sys_@@/'"$prefix"'/g' $nfjob
sed -i 's/run-1/'"$sfold"'/g'   $nfjob
sed -i 's/sed / #sed /g'           $nfjob
sbatch $nfjob &> JOB_ID_$i

