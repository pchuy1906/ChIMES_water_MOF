source ~/.BASHRC_PYTHON
cwd=`pwd`

prefix="vcopt_TATB"
for fold in $(ls -1vd ${prefix}_*/run*/VASP) ; do
    cd $fold
        pwd
        ./do_1_make_xyz.sh
        sed -i 's/sbatch/#sbatch/g' ./do_2_make_VASP.sh
        ./do_2_make_VASP.sh batch 2 224 iap
    cd $cwd
done
cp job_VASP.sh TMP_VASP_${prefix}.sh
sed -i 's/@prefix@/'"${prefix}"'_/g' TMP_VASP_${prefix}.sh
sbatch TMP_VASP_${prefix}.sh &> JOB_ID_${prefix}



