module load python/2.7.18


cat  condensed_*/run*/VASP/traj* > TMP_traj.xyz

python ~/tools/others/find_rmin.py --file_xyz TMP_traj.xyz --atom_types C H N O

