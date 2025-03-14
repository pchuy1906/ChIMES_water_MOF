cwd=`pwd`

n=`ls -d T* | wc | awk '{print $1-1}'`
nnext=$(($n+1))
mkdir T${nnext}

mkdir T${nnext}/0-data

cp T${n}/2-MD/DFTB.xyz        T${nnext}/0-data/DFTB_add.xyz
cp T${n}/0-data/DFTB.xyz      T${nnext}/0-data/DFTB_current.xyz
cat T${n}/0-data/DFTB.xyz T${nnext}/0-data/DFTB_add.xyz >    T${nnext}/0-data/DFTB.xyz

mkdir T${nnext}/1-fit
cp -rf T${n}/1-fit/*.sh         T${nnext}/1-fit

mkdir T${nnext}/2-MD
cp -rf T${n}/2-MD/*.sh        T${nnext}/2-MD/
