nmol=16
#atm2GPa=0.000101325
atm2GPa=1

mole="DNTF"
fEV="EV_${mole}.dat"
fPV="PV_${mole}.dat"

cwd=`pwd`
rm -rf $cwd/$fEV  $cwd/$fPV

for fold in $(ls -1vd *vcopt*TATB*/run*); do
    cd $fold

        pwd

        ~/tools/LAMMPS/do_collect_LAMMPS_step.sh
        E=`tail -1 AAA_TotEng.dat | awk '{printf "%15.9f", $2/'"$nmol"'}'`
        V=`tail -1 AAA_Volume.dat | awk '{printf "%15.9f", $2/'"$nmol"'}'`
         P=`tail -1 AAA_Press.dat | awk '{printf "%15.9f", $2*'"${atm2GPa}"'}'`
        echo $V $E >> $cwd/$fEV
        echo $V $P >> $cwd/$fPV

    cd $cwd
done
