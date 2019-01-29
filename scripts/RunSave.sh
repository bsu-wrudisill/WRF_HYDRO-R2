#!/bin/bash
RUN_DIR_MOD=Model_Out/.
RUN_DIR_DIAG=Diag/.
#~~~~~~~~ REMOVE Files ~~~~~~~~~#
#remove lsm output files
mv *.LSMOUT_DOMAIN* $RUN_DIR_MOD
mv *.RTOUT_DOMAIN* $RUN_DIR_MOD
mv *.CHRTOUT* $RUN_DIR_MOD
mv *.CHANOBS* $RUN_DIR_MOD
mv *.LDASOUT_DOMAIN* $RUN_DIR_MOD
mv *.GWOUT* $RUN_DIR_MOD
mv *.LAKEOUT* $RUN_DIR_MOD
mv frxst_pts_out.txt $RUN_DIR_MOD

#Restart files
mv HYDRO_RST.* $RUN_DIR_MOD
mv RESTART.* $RUN_DIR_MOD

#Misc. diagnostic files...
mv qstrmvol* $RUN_DIR_DIAG
mv diag_hydro.* $RUN_DIR_DIAG
mv wrf_hydro.e* $RUN_DIR_DIAG
mv wrf_hydro.o* $RUN_DIR_DIAG
mv wrfhydro_run_params.log $RUN_DIR_DIAG

#Bucket Model output files
mv GW_*.txt $RUN_DIR_MOD
