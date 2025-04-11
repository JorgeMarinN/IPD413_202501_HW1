import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

# Load the data
file_path = "sim_data/data_nmos_idvgs_VDSp9_test.txt"
data = np.loadtxt(file_path, comments='#', usecols=(0, 1))

# Extract VGS and IDS
VGS = data[:, 0]
IDS = data[:, 1]

# Ensure IDS values are positive before taking log
IDS = np.abs(IDS)

# Plot IDS vs. VGS on a logarithmic scale
plt.figure(figsize=(8, 6))
plt.plot(VGS, IDS, 'o', label='Measured Data')
plt.yscale('log')
plt.xlabel("$V_{GS}$ (V)")
plt.ylabel("$I_{DS}$ (A)")
plt.title("$I_{DS}$ vs $V_{GS}$ (Logarithmic Scale)")
plt.grid(True, which="both", linestyle='--')

# Define the subthreshold region (VGS between 0 V and 0.25 V)
subthreshold_mask = (VGS >= 0.0) & (VGS <= 0.25)
VGS_sub = VGS[subthreshold_mask]
IDS_sub = IDS[subthreshold_mask]

# Perform linear regression on log(IDS) vs. VGS in the subthreshold region
slope_sub, intercept_sub, _, _, _ = linregress(VGS_sub, np.log(IDS_sub))

# Define the strong inversion region (VGS between 1.25 V and 1.8 V)
strong_inv_mask = (VGS >= 1.25) & (VGS <= 1.8)
VGS_strong = VGS[strong_inv_mask]
IDS_strong = IDS[strong_inv_mask]

# Perform linear regression on log(IDS) vs. VGS in the strong inversion region
slope_strong, intercept_strong, _, _, _ = linregress(VGS_strong, np.log(IDS_strong))

# Calculate the intersection point of the two linear fits
VTH = (intercept_strong - intercept_sub) / (slope_sub - slope_strong)
IDS_intersection = np.exp(slope_sub * VTH + intercept_sub)

# Plot the linear fits and the intersection point
plt.plot(VGS_sub, np.exp(slope_sub * VGS_sub + intercept_sub), '--', label='Subthreshold Fit')
plt.plot(VGS_strong, np.exp(slope_strong * VGS_strong + intercept_strong), '--', label='Strong Inversion Fit')
plt.plot(VTH, IDS_intersection, 'ro', label=f'Intersection Point\n$V_{{TH}}$ = {VTH:.4f} V')
plt.legend()
plt.show()

print(f"Threshold Voltage (V_TH) at intersection: {VTH:.4f} V")
