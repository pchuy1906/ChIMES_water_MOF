srcpath="/p/lustre2/pham20/TATB_LAST_3/lib_TATB_2"

ncount=0
for sys in condensed_new_CC condensed_new_H2 condensed_new_N2 condensed_new_O2 ; do

    ncount=$(($ncount+1))
    ls $srcpath/data.lammps_$sys

        Temp=3000
        fname="condensed_new_${ncount}"
        mkdir -p $fname/run-1
        cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
        cp -rf ../../scripts/VASP        $fname/run-1/VASP
done
