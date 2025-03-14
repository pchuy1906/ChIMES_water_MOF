fold_run="DFTB"

file_dftb_gen="geo_end.gen"
file_dftb_detail="detailed.out"

fileout="${fold_run}.xyz"
rm -rf ${fileout}

cwd=`pwd`
for fold in $(ls -1vd ${fold_run}/run*) ; do
    cd $fold
        pwd

        python ../../../../scripts/DFTB_2_ChIMES.py \
          --file_dftb_gen    ${file_dftb_gen} \
          --file_dftb_detail ${file_dftb_detail} \
          --cell_type        NON_ORTHO

        cat DFTB.xyzf >> $cwd/${fileout}
    cd $cwd
done
