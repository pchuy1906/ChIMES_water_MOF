cwd=`pwd`
srcpath="../../LMP_files/"
cd $srcpath
    srcpath=`pwd`
cd $cwd

echo $srcpath
ncount=0
for file in data.lammps_MOF303_D0D0 data.lammps_MOF303_D0D0_cis data.lammps_MOF303_D4D4 data.lammps_MOF303_E0D0 data.lammps_MOF303_E0D4 data.lammps_MOF303_E0D8 data.lammps_MOF303_E0E0_4wat data.lammps_MOF303_E0E0_8wat data.lammps_MOF303_E40D40 data.lammps_MOF303_E4D4 data.lammps_MOF303_E4D8 data.lammps_MOF303_E4E4 data.lammps_MOF303_E4E4_8wat data.lammps_MOF303_E8D4 data.lammps_MOF303_E8D8 data.lammps_MOF303_E8E8 data.lammps_MOF303_E8E8_4wat ; do

    ncount=$(($ncount+1))
    ls $file

        Temp=300
        fname="condensed_MOF303_${ncount}"
        mkdir -p $fname/run-1
        cp $srcpath/$file                $fname/run-1/data.lammps
        cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
        sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
        cp -rf ../../scripts/DFTB        $fname/run-1/DFTB
done
