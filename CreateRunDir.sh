#/bin/bash
# Usage: Create a self-contained directory to run WRF-Hydro 
# ./CreateRunDir <NAME OF RUN> 
#
# Notes: 1. The wrf_hydro.exe file is small, so we may as well make a copy.
#        2. Once ./CreateRunDir has been run, we can then cd into the directory 
#           and change namelists, submit script parameters, and link the appropriate 
#           forcing/domain files using the "LinkForcings.sh" script
#           

#~~~~~~~~~~~~~~~~~~~ Create directorys for running and storing data ~~~~~~~~~~~~~~~~~~ # 
#DATE=`date +%Y-%m-%d:%H:%M:%S`
PARENT_DIR="/home/wrudisill/WRF_HYDRO-R2"

#outfiles go here 
RUN_DIR=$PARENT_DIR/WRF_HydroRun_${DATE}_${1}
#
#model out files
RUN_DIR_MOD=$RUN_DIR/Model_Out
#
#diagnostic files
RUN_DIR_DIAG=$RUN_DIR/Diag
#
#create afforementioned directories
mkdir $RUN_DIR $RUN_DIR_MOD $RUN_DIR_DIAG
#
# Create geog and forcing directories
mkdir $RUN_DIR/FORCING $RUN_DIR/DOMAIN $RUN_DIR/RESTART 

#~~~~~~~~~~~~~ Copy executables and namelist files into the run directory ~~~~~~~~~~~~ # 
# copy wrf_hydro.exe to the run directory 
cp $PARENT_DIR/wrf_hydro_nwm_public/trunk/NDHMS/Run/wrf_hydro_NoahMP.exe $RUN_DIR/.
ln -s $RUN_DIR/wrf_hydro_NoahMP.exe $RUN_DIR/wrf_hydro.exe

# copy GENPARM SOILPARM MPTABLE HYDRO CHANPARM tables  
cp $PARENT_DIR/wrf_hydro_nwm_public/trunk/NDHMS/Run/*.TBL $RUN_DIR/.

# copy namelists 
cp $PARENT_DIR/wrf_hydro_nwm_public/trunk/NDHMS/Run/namelist.hrldas $RUN_DIR/.
cp $PARENT_DIR/wrf_hydro_nwm_public/trunk/NDHMS/Run/hydro.namelist $RUN_DIR/.


#~~~~~~~~ Copy accessory scripts from the 'scripts' dir into the Run dir ~~~~~~~~~~~~ # 
# environment script
cp $PARENT_DIR/scripts/env_nwm_r2.sh $RUN_DIR/.

# cp script to link forcings 
cp $PARENT_DIR/scripts/LinkForcings.sh $RUN_DIR/.

# cp submit script
cp $PARENT_DIR/scripts/submit_WRF_Hydro.sh $RUN_DIR/.

#cp clean and save scripts 
cp $PARENT_DIR/scripts/RunSave.sh $RUN_DIR/.
cp $PARENT_DIR/scripts/RunClean.sh $RUN_DIR/.
exit
