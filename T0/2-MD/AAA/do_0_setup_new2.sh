srcpath="/p/lustre2/pham20/TATB_LAST_3/lib_TATB_2"

ncount=0
for sys in condensed_new2_CH condensed_new2_CN condensed_new2_CO condensed_new2_HN condensed_new2_HO condensed_new2_NO ; do

    ncount=$(($ncount+1))
    ls $srcpath/data.lammps_$sys

        Temp=3000
        fname="condensed_new2_${ncount}"
        mkdir -p $fname/run-1
        cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
        cp -rf ../../scripts/VASP        $fname/run-1/VASP
done
