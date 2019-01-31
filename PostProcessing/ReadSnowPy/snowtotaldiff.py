from matplotlib import pyplot as plt
import numpy as np
import matplotlib as mpl
import sys
from netCDF4 import Dataset 
import glob
#
#
#dirc="/home/wrudisill/WRF_HYDRO-R2/WRF_HydroRun_HSForcing/Model_Out/*LDASOUT*"
#flist=glob.glob(dirc)

final_ts_MS="/home/wrudisill/WRF_HYDRO-R2/WRF_HydroRun_LSForcing/Model_Out/199803270000.LDASOUT_DOMAIN2"
final_ts_HS="/home/wrudisill/WRF_HYDRO-R2/WRF_HydroRun_HSForcing/Model_Out/199803270000.LDASOUT_DOMAIN2"
diff = Dataset(final_ts_HS)["SNEQV"][0,:,:] - Dataset(final_ts_MS)["SNEQV"][0,:,:]

#plt.imshow(diff[::-1,:], cmap="bwr", vmin=-40,vmax=40)
#plt.colorbar()
#plt.savefig("diff_finalsnow.png")
#plt.savefig('Ebudget_Whole_D02', dpi=500)
plt.hist(diff)
plt.savefig("diffhist.png")
