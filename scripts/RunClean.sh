#!/bin/bash

#~~~~~~~~ REMOVE Files ~~~~~~~~~#
#remove lsm output files
rm *.LSMOUT_DOMAIN*
rm *.RTOUT_DOMAIN* 
rm *.CHRTOUT* 
rm *.CHANOBS* 
rm *.LDASOUT_DOMAIN* 
rm frxst_pts_out.txt 

#Restart files
rm HYDRO_RST.*
rm RESTART.* 

#Misc. diagnostic files...
rm qstrrmol* 
rm diag_hydro.* 
rm wrf_hydro.e* 
rm wrf_hydro.o* 
rm wrfhydro_run_params.log

#Bucket Model output files
rm GW_*.txt 
