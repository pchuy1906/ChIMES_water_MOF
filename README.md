# These are the steps to iteratively fit a ChIMES model. The system in this example is a Metal-Organic Framework with water adsorption.
## 1.   Fit an initial ChIMES model
   * Go to the directory to fit:
     `cd T0/1-fit`
   * Run `./do_1_submit_chimesLSQ.sh`, which will
      * Generate file `fm_setup.in`, an input for chimes_lsq  
      * Submit job1.sh in order to
         * Run `chimes_lsq` to generate matrices `A.*.txt` and `b.txt`
         * Generate the weights (file `new_weight.dat`) to consider differences in energy and atomic forces
      3. submit job2.sh that will start when job1.sh is done. job2.sh will do the linear fit. Solution is x.txt and the predicted values is in Ax.txt that can be compare directly to b.txt
