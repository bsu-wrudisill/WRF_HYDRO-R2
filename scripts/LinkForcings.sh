#!/bin/bash
#
#
ForcingsDir=/home/wrudisill/WRF_HYDRO-R2/example_case/Gridded/FORCING
GeogDir=/home/wrudisill/WRF_HYDRO-R2/example_case/Gridded/DOMAIN
RestartDir=/home/wrudisill/WRF_HYDRO-R2/example_case/Gridded/RESTART

ln -s $ForcingsDir/* ./FORCING/.
ln -s $GeogDir/* ./DOMAIN/.
ln -s $RestartDir/* ./RESTART/.
