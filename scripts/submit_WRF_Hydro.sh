#!/bin/bash
#SBATCH -J wrf_hydro           # Job name
#SBATCH -o log_wrf_hydro.o%j   # Output and error file name (%j expands to jobID)
#SBATCH -n 32                  # Total number of mpi tasks requested
#SBATCH -N 2                   # Total number of nodes at 16 mpi tasks per-node requested
#SBATCH -p defq                # Queue (partition) -- normal, development, etc.
#SBATCH -t 02:00:00            # Run time (hh:mm:ss) - 2.0 hours

#~~~~~~~~ Source Module Files ~~~~~~~~~~~~~~~~~~~~~
echo -e "***** Sourcing (loading) default modules \n"
source ./env_nwm_r2.sh

#~~~~~~ Create a Log file to store timing info and model params ~~~~~~~~~# 
Log_File=run_diagnostics.log
echo "_______ RUN INFO _________" >> $Log_File
echo "Grid Identifier" >> $Log_File
grep IGRID hydro.namelist >> $Log_File
echo "Channel Routing on? 0=No, 1=Yes" >> $Log_File
grep CHANRTSWCRT hydro.namelist >> $Log_File
echo "submit options"
grep SBATCH submit_WRF_Hydro.sh >> $Log_File
echo "__________________________"
# Time the model run 
SECONDS=0
echo "WRF Hydro Model starting at time: `date`" >> $Log_File 2>&1

#~~~~~~~~~~~~ RUN EXECUTABLE ~~~~~~~~~~~~~~~~
mpirun -np 32 ./wrf_hydro.exe    # !!!!!!  CHANGE ME !!!!!!! 


#~~~~~~~~~~~  Finish  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo "WRF Hydro Model complete at `date`" >> $Log_File 2>&1
DURATION=$SECONDS
echo $DURATION >> $Log_File


#~~~~~~~~~~ Move Output Files ~~~~~~~~~~~~~~~
./RunSave.sh
exit
