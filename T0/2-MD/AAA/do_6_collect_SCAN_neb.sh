
cwd=`pwd`
for fold in $(ls -1vd neb*/run*/VASP/VASP_*) ; do
    echo $fold
    cd $fold
        ~/tools/others/take_xyzfe.sh
    cd $cwd
done

