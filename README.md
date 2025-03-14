# These are the steps to iteratively fit a ChIMES model. The system in this example is a Metal-Organic Framework with water adsorption.
## 1. Fit an initial ChIMES model
  * Before starting the fitting procedure, ensure that you are in the correct directory. Use the following command to move into the fitting directory:
    <br> `cd T0/1-fit`
    <br> This directory contains the necessary scripts and input files required to perform the fitting procedure for ChIMES.
  * Execute the following script to initiate the fitting process:
    <br> `./do_1_submit_chimesLSQ.sh`
    <br> This script performs several essential tasks:
    * Generate file `fm_setup.in` - This input file is necessary for the `chimes_lsq` fitting procedure. It contains settings and data specifications required for fitting.
    * Submit `job1.sh`, which:
      * Run `chimes_lsq` to generate matrix files
         * `A.*.txt` - Represents the system matrix used in the least squares fitting.
         * `b.txt` – Contains the target values, such as reference energies and forces.
      * Generate the weights (file `new_weight.dat`) to consider differences in energy and atomic forces.
      * Submit `job2.01.sh` to perform the linear fit, which will start once `job1.sh` is completed. The solution will be saved in `x.txt`, and the predicted values can be found in `Ax.txt`, which can be directly compared to `b.txt`.
  * Run `./do_2_grep.sh` to generate the ChIMES parameter file `ChIMES_params.txt`, which can be used for further calculations using LAMMPS/ChIMES_MD or ASE. It also creates files `data_energy.dat`, `data_force.dat`, and `data_stress.dat` for parity plots.  
## 2. Run MD simulation and compute single-point energy
 * Before starting, ensure that you are in the correct directory where the MD simulations will be executed. Use the following command to move into the appropriate folder:
   <br> `cd ../2-MD/`
 * Execute the following script to generate input files for LAMMPS:
   <br> `./do_0_setup.sh`
   <br> The systems of interest and thermodynamic conditions (P,T) need to be set up here.
 * Once the setup is complete, run the following script to submit MD simulation jobs using LAMMPS:
   <br> `./do_1_LAMMPS_MD.sh`
   <br> This script executes the LAMMPS calculations based on the prepared input files. Depending on the system size and computational resources available, the simulation may take some time to complete. Monitor the job queue if running on a cluster.
 * After completing the MD simulations, convert the output trajectory files from LAMMPS dump format to the widely used XYZ format for further analysis:
   <br> `./do_2_traj_LAMMPS_MD.sh`
   <br> This step ensures compatibility with various visualization and analysis tools, allowing easier inspection of atomic trajectories and structural evolution.
 * To establish a reference dataset for the simulation, set up the computational method using Density-Functional Tight-Binding (DFTB):
   <br> `./do_3_setup_DFTB.sh`
   <br> While DFTB is used in this case, other levels of theory (such as Density Functional Theory (DFT) or higher-level quantum mechanical methods) can also be applied depending on the desired accuracy and computational cost. This step prepares the necessary input files for running reference calculations.
