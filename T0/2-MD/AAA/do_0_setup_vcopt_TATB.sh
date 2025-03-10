srcpath="/p/lustre2/pham20/TATB_LAST_3/lib_TATB"
sys="condensed_TATB_ambient_0GPa"

GPa2atm=9869.2326671601

for P in 0 10 20 30 40 50 ; do
    Press=`echo "scale=9; $P* $GPa2atm" | bc -l`
    fname="vcopt_TATB_${P}_GPa"
    mkdir -p $fname/run-1
    cp $srcpath/data.lammps_$sys       $fname/run-1/data.lammps
    cp ../../scripts/_in.lammps_vcopt  $fname/run-1/_in.lammps
    sed -i 's/@P@/'"$Press"'/g'        $fname/run-1/_in.lammps
    cp -rf ../../scripts/VASP          $fname/run-1/VASP
done
