source ~/.BASHRC_PYTHON
cwd=`pwd`

prefix="condensed_TATB"
for fold in $(ls -1vd ${prefix}*/run*/VASP) ; do
    cd $fold
        pwd
        ./do_1_make_xyz.sh
        ./do_2_make_VASP.sh debug 2 224 iap
    cd $cwd
done
