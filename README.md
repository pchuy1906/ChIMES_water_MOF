# These are the steps to iteratively fit a ChIMES model. The system in this example is a Metal-Organic Framework with water adsorption.
## 1.   Fit an initial ChIMES model
   * Go to the directory to fit:
     > cd T0/1-fit
   * run ./do_1_submit_chimesLSQ.sh which will:
      1. generate file fm_setup.in, input for chimes_lsq  
      2. submit job1.sh which
         1. run chimes_lsq to generate matrices A and b
         2. generate the weight to consider differences in energy and atomic forces
      3. submit job2.sh that will start when job1.sh is done. job2.sh will do the linear fit. Solution is x.txt and the predicted values is in Ax.txt that can be compare directly to b.txt
