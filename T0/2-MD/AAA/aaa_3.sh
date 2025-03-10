for file in $(ls -1vd condensed*/run*/VASP/traj.xyz.*) ; do
    ls $file
    xcrysden --xyz $file
done
