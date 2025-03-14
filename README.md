# These are the steps to iteratively fit a ChIMES model. The system in this example is a Metal-Organic Framework with water adsorption.
## 1. Fit an initial ChIMES model
  * Go to the directory to fit: `cd T0/1-fit`.
  * Run `./do_1_submit_chimesLSQ.sh`, which will
    * Generate file `fm_setup.in`, an input for `chimes_lsq`.
    * Submit job1.sh in order to
      * Run `chimes_lsq` to generate matrices `A.*.txt` and `b.txt`.
      * Generate the weights (file `new_weight.dat`) to consider differences in energy and atomic forces.
      * Submit `job2.01.sh` to perform the linear fit, which will start once `job1.sh` is completed. The solution will be saved in `x.txt`, and the predicted values can be found in `Ax.txt`, which can be directly compared to `b.txt`.
  * Run `./do_2_grep.sh` to generate the ChIMES parameter file `ChIMES_params.txt`, which can be used for further calculations using LAMMPS/ChIMES_MD or ASE. It also creates files `data_energy.dat`, `data_force.dat`, and `data_stress.dat` for parity plots.  
## 2. Run MD simulation and compute single-point energy
 * Before starting, ensure that you are in the correct directory where the MD simulations will be executed. Use the following command to move into the appropriate folder: `cd ../2-MD/`.
 * Execute the following script to generate input files for LAMMPS: `./do_0_setup.sh`. The systems of interest and thermodynamic conditions (P,T) need to be set up here.
 * Once the setup is complete, run the following script to submit MD simulation jobs using LAMMPS: `./do_1_LAMMPS_MD.sh`
 * Run `./do_2_traj_LAMMPS_MD.sh` to convert LAMMPS dump format to xyz.
 * Run `./do_3_setup_DFTB.sh` to set up the computational method for reference data. It can be any level of theory that we want; in this case, it is density-functional tight-binding (DFTB).
