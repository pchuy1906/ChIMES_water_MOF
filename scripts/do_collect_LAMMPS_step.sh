nbegin=`sed -n '/Step/=' log.lammps`
nend=`sed -n '/Loop time of/=' log.lammps`
if [ -z "$nend" ]; then
   echo $nbegin "empty"
   sed -e '1,'"$nbegin"'d' <  log.lammps | grep -v "ERROR" | grep -v "Last" >  AAA.dat
else
   echo $nbegin $nend
   nbegin=$(($nbegin+1))
   nend=$(($nend-1))
   sed -n ${nbegin},${nend}p  log.lammps  >  AAA.dat
fi

grep -e "Step" log.lammps
targets=($(grep -e "Step" log.lammps))
nlen="${#targets[@]}"
echo $nlen

rm -rf TMP_CMD
for ik in $(seq 2 $nlen) ; do
    idcol=$(($ik-1))
    quant=${targets[idcol]}
    CMD="awk '{printf \"%15.9f %15.9f\n\", "\$"2, "\$$ik"}'   AAA.dat | head -n -1 > AAA_${quant}.dat"
    echo $CMD >> TMP_CMD
done
chmod +x TMP_CMD
./TMP_CMD
rm -rf TMP_CMD


atm2GPa=0.000101325

awk '{printf "%15.9f %15.9f\n", $1, $2*'"$atm2GPa"'}' AAA_Press.dat > TMP.dat
mv TMP.dat AAA_Press.dat
