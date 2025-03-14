cwd=`pwd`
srcpath="../../LMP_files/"
cd $srcpath
    srcpath=`pwd`
cd $cwd

echo $srcpath
ncount=0
for file in data.lammps_1 data.lammps_2 data.lammps_3 data.lammps_4  ; do

    ncount=$(($ncount+1))
    ls $srcpath/$file

        Temp=300
        fname="condensed_MOF_${ncount}"
        mkdir -p $fname/run-1
        cp $srcpath/$file                $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
done
