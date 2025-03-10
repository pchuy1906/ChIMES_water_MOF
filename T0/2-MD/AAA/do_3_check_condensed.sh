sfold="run-2"
for prefix in TATB ambient new new1 new2 new3 ; do
    echo
    echo $prefix
    xmgrace condensed_${prefix}_*/run*/AAA_Temp.dat
done
