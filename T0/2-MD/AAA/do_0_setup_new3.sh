srcpath="/p/lustre2/pham20/TATB_LAST_3/lib_TATB_2"

ncount=0
for sys in condensed_new3_CH condensed_new3_CN condensed_new3_CO condensed_new3_HN condensed_new3_HO condensed_new3_NO ; do

    ncount=$(($ncount+1))
    ls $srcpath/data.lammps_$sys

        Temp=3000
        fname="condensed_new3_${ncount}"
        mkdir -p $fname/run-1
        cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
        cp -rf ../../scripts/VASP        $fname/run-1/VASP
done
