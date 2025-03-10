#echo "#########"
#echo "CC-CN"
#echo " grep SCAN CC_CN*/run-*/VASP/VASP*/OUTCAR | wc"
#       grep SCAN CC_CN*/run-*/VASP/VASP*/OUTCAR | wc
#    grep -e "F=" CC_CN*/run-*/VASP/VASP*/out_SCAN | wc
#              ls CC_CN*/run-*/VASP/VASP*/input* | wc
#              ls CC_CN*/run-*/VASP/traj* | wc


echo "#########"
echo "condensed"
echo " grep SCAN condensed*/run-*/VASP/VASP*/OUTCAR | wc"
       grep SCAN condensed*/run-*/VASP/VASP*/OUTCAR | wc
    grep -e "F=" condensed*/run-*/VASP/VASP*/out_SCAN | wc
              ls condensed*/run-*/VASP/VASP*/input* | wc
              ls condensed*/run-*/VASP/traj* | wc

echo "#########"
echo "vcopt"
echo " grep SCAN vcopt*/run-*/VASP/VASP*/OUTCAR | wc"
       grep SCAN vcopt*/run-*/VASP/VASP*/OUTCAR | wc
    grep -e "F=" vcopt*/run-*/VASP/VASP*/out_SCAN | wc
              ls vcopt*/run-*/VASP/VASP*/input* | wc
              ls vcopt*/run-*/VASP/traj* | wc


echo "#########"
echo "neb"
echo " grep SCAN neb*/run-*/VASP/VASP*/OUTCAR | wc"
       grep SCAN neb*/run-*/VASP/VASP*/OUTCAR | wc
    grep -e "F=" neb*/run-*/VASP/VASP*/out_SCAN | wc
              ls neb*/run-*/VASP/VASP*/input* | wc
              ls neb*/run-*/VASP/traj* | wc
