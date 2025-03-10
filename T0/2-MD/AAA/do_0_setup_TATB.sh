srcpath="/p/lustre2/pham20/TATB_LAST_3/lib_TATB"

sys="condensed_TATB_ambient_0GPa"
Temp=300
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

sys="condensed_TATB_ambient_50GPa"
Temp=300
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

sys="condensed_TATB_extreme_2000K_2.5gcm3"
Temp=2000
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

sys="condensed_TATB_extreme_3000K_3.0gcm3"
Temp=3000
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

sys="condensed_TATB_extreme_4000K_3.5gcm3"
Temp=4000
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

sys="condensed_TATB_extreme_5000K_4.0gcm3"
Temp=5000
fname="${sys}"
mkdir -p $fname/run-1
cp $srcpath/data.lammps_$sys     $fname/run-1/data.lammps
cp ../../scripts/_in.lammps_NVT  $fname/run-1/_in.lammps
sed -i 's/@T@/'"$Temp"'/g'       $fname/run-1/_in.lammps
cp -rf ../../scripts/VASP        $fname/run-1/VASP

