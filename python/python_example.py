import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

# Path to the data file
file_path = "./sim_data/Tarea_1/data_nmos_idvgs_VDSp9_test.txt"

# Load the data, skipping non-numeric lines (e.g., headers)
data = []
with open(file_path, 'r') as f:
    for line in f:
        try:
            numbers = [float(x) for x in line.strip().split()]
            if len(numbers) >= 2:
                data.append(numbers[:2])
        except ValueError:
            # Skip lines that don't contain valid floats
            continue

# Convert to numpy array for easier indexing
data = np.array(data)

# Extract columns: VGS and IDS
VGS = data[:, 0]
IDS = data[:, 1]

# Create subplots: 1 row, 2 columns
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# Plot with linear y-axis
axes[0].plot(VGS, IDS, marker='o')
axes[0].set_xlabel("$V_{GS}$ (V)")
axes[0].set_ylabel("$I_{DS}$ (A)")
axes[0].set_title("$I_{DS}$ vs $V_{GS}$ (Linear Scale)")
axes[0].grid(True)

# Plot with logarithmic y-axis
axes[1].plot(VGS, IDS, marker='o')
axes[1].set_xlabel("$V_{GS}$ (V)")
axes[1].set_ylabel("$I_{DS}$ (A)")
axes[1].set_yscale('log')
axes[1].set_title("$I_{DS}$ vs $V_{GS}$ (Logarithmic Scale)")
axes[1].grid(True, which="both", linestyle='--')

# Calculate the subthreshold slope in the region 0 <= VGS <= 0.25 V
mask = (VGS >= 0) & (VGS <= 0.25)
VGS_sub = VGS[mask]
IDS_sub = IDS[mask]

# Ensure IDS values are positive before taking the logarithm
IDS_sub = np.abs(IDS_sub)

# Perform linear regression on log(IDS) vs VGS
slope, intercept, r_value, p_value, std_err = linregress(VGS_sub, np.log10(IDS_sub))

# Calculate subthreshold swing (S) in mV/decade
S = 1 / slope * 1000  # mV/decade

# Display the subthreshold swing value
print(f"Subthreshold Swing (S): {S:.2f} mV/decade")

# Adjust layout
plt.tight_layout()
plt.show()

