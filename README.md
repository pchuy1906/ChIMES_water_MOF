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
      * Runs `chimes_lsq` to generate matrix files
         * `A.*.txt` - Represents the system matrix used in the least squares fitting.
         * `b.txt` – Contains the target values, such as reference energies and forces.
      * Generates `new_weight.dat`, which assigns appropriate weights to account for differences in energy and atomic forces.
      * Submits `job2.01.sh` to perform linear fit once `job1.sh` completes. The solution will be saved in `x.txt`, and the predicted values can be found in `Ax.txt`, which can be directly compared to `b.txt` to assess the fitting accuracy.
  * Once the fitting process is complete, run the following script to extract parameters and generate relevant output files:
    <br> `./do_2_grep.sh`
    <br> This script performs the following actions:
     * Creates the ChIMES parameter file:
       * `ChIMES_params.txt` – This file contains the fitted parameters that can be used in further molecular dynamics (MD) simulations with LAMMPS/ChIMES_MD or ASE.
     * Generates data files for parity plot analysis:
       * `data_energy.dat` – Contains reference and fitted energy values.
       * data_force.dat – Stores atomic force comparisons.
       * data_stress.dat – Provides stress tensor data.
    <br> These files help evaluate the accuracy of the fitting by comparing predicted values to reference data.
## 2. Run MD simulation and compute single-point energy
 * Before starting, ensure that you are in the correct directory where the MD simulations will be executed. Use the following command to move into the appropriate folder:
   <br> `cd ../2-MD/`
 * Execute the following script to generate input files for LAMMPS:
   <br> `./do_0_setup.sh`
   <br> This script initializes the LAMMPS simulation setup. Key parameters to define:
    * Systems of interest: Atomic structure, molecular composition, and simulation box dimensions.
    * Thermodynamic conditions: Specify pressure (P) and temperature (T) settings according to the simulation requirements.
 * Once the setup is complete, run the following script to submit MD simulation jobs using LAMMPS:
   <br> `./do_1_LAMMPS_MD.sh`
   <br> This script executes the LAMMPS calculations based on the prepared input files. Depending on the system size and computational resources available, the simulation may take some time to complete. Monitor the job queue if running on a cluster.
 * After completing the MD simulations, convert the output trajectory files from LAMMPS dump format to the widely used XYZ format for further analysis:
   <br> `./do_2_traj_LAMMPS_MD.sh`
   <br> This step ensures compatibility with various visualization and analysis tools, allowing easier inspection of atomic trajectories and structural evolution.
 * To establish a reference dataset for the simulation, set up the computational method using Density-Functional Tight-Binding (DFTB):
   <br> `./do_3_setup_DFTB.sh`
   <br> While DFTB is used in this case, other levels of theory (such as Density Functional Theory (DFT) or higher-level quantum mechanical methods) can also be applied depending on the desired accuracy and computational cost. This step prepares the necessary input files for running reference calculations.
