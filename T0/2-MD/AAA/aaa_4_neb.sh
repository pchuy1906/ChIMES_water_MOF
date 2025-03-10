module load python/3.12.2

for postfix in ambient_1 ambient_2 ambient_3 ambient_4 ; do

    nrun=`ls -d condensed_${postfix}/run-*/ | wc | awk '{print $1}'`
    fold1="condensed_${postfix}/run-${nrun}"
    fold2="neb_${postfix}/run-1"

    cwd=`pwd`
    
    mkdir -p $fold2
    cp -rf ../../scripts/VASP/ $fold2
    
    cp ../../scripts/post_1_molecules.sh $fold1
    cd $fold1
echo "######################"
echo
pwd
echo
echo
        sed -i 's/@postfix@/'"${postfix}"'/g' post_1_molecules.sh



        ./post_1_molecules.sh 1
    cd $cwd
    
    prefix="neb_${postfix}"
    for fold in $(ls -1vd ${prefix}*/run*/VASP) ; do
        cd $fold
            pwd
            #./do_1_make_xyz.sh
            sed -i 's/sbatch/#sbatch/g' ./do_2_make_VASP.sh
            ./do_2_make_VASP.sh batch 2 224 iap
        cd $cwd
    done
    cp job_VASP.sh TMP_VASP_neb.sh
    sed -i 's/@prefix@/neb/g' TMP_VASP_neb.sh
    #sbatch TMP_VASP_${prefix}.sh
done

#sbatch TMP_VASP_neb.sh
