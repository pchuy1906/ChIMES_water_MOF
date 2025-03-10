for file in $(ls -1vd neb_*/run-*/VASP/OUTPUT_XYZ_2_POSCAR); do
    echo
    echo $file
    grep -A3 "the number of atom:" $file
done
