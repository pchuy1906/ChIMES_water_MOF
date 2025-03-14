source ~/.BASHRC_PYTHON

sfold="run-1"

cwd=`pwd`
filexyz="input.xyz"
rm -rf $filexyz
for fold in $(ls -1vd condensed*/$sfold) ; do
    cd $fold
        pwd
        ntail=`head -1 traj.xyz | awk '{print $1+2}'`
        tail -$ntail traj.xyz >> $cwd/$filexyz
    cd $cwd
done

SKF="../../SKF/"
cd $SKF
    SKF=`pwd`
cd $cwd


python ../../scripts/Setup_MD_DFTB.py \
  --file_xyz            ${filexyz} \
  --cell_option         cell_9 \
  --calc_type           sp \
  --mdTemp              300 \
  --eTemp               300 \
  --SKF                 $SKF/ \
  --PolyRep             No \
  --Kresol              800 \
  --Kpoint              1 1 1 \
  --method              DFTB \
  --atom_types          Al C H N O \
  --spdf_types          p p s p p \
&> OUTPUT_AAA
mv runDFTB DFTB
