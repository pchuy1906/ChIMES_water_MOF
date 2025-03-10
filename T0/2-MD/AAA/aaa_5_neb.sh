module load python/3.12.2

for postfix in new_3 new_4    new1_6 new2_6 new3_6  ; do

    prefix="neb_${postfix}"

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
        sed -i 's/--rcut 1.2/--rcut 1.5/g' post_1_molecules.sh
        sed -i 's/@postfix@/'"${postfix}"'/g' post_1_molecules.sh


        ./post_1_molecules.sh 1
    cd $cwd
    
    for fold in $(ls -1vd ${prefix}*/run*/VASP) ; do
        cd $fold
            pwd
            #./do_1_make_xyz.sh
            sed -i 's/sbatch/#sbatch/g' ./do_2_make_VASP.sh
            ./do_2_make_VASP.sh debug 2 224 iap
        cd $cwd
    done
    cp job_VASP.sh TMP_VASP_neb.sh
    sed -i 's/@prefix@/neb/g' TMP_VASP_neb.sh
    #sbatch TMP_VASP_${prefix}.sh
done

#sbatch TMP_VASP_neb.sh
