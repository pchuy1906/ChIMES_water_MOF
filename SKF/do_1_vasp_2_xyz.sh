pathSKF="/p/lustre1/pham20/SKF/ptbp/"

for type1 in Al C H N O ; do
    for type2 in Al C H N O ; do
        cp $pathSKF/${type1}-${type2}.skf .
    done
done
