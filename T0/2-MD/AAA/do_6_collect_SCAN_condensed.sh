
cwd=`pwd`
for fold in $(ls -1vd condensed*/run*/VASP/VASP_*) ; do
    echo $fold
    cd $fold
        ~/tools/others/take_xyzfes_box9.sh
    cd $cwd
done

