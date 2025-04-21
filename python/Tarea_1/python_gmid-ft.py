import numpy as np
import matplotlib.pyplot as plt

# Path to the data file
file_path = "./SimData/Tarea_1/data_nmos_idvgs_VDSp9_gmid-ft.txt"

# Load the data, skipping non-numeric lines
data = []
with open(file_path, 'r') as f:
    for line in f:
        try:
            numbers = [float(x) for x in line.strip().split()]
            if len(numbers) >= 4:
                data.append(numbers[:4])
        except ValueError:
            continue

# Convert to numpy array
data = np.array(data)

# Extract relevant columns
Vgs = data[:, 0]      # First column (x-axis)
gm_Id = data[:, 1]    # Second column (left y-axis)
fT = data[:, 3]       # Fourth column (right y-axis)

# Create figure and primary axis
fig, ax1 = plt.subplots(figsize=(8, 5))

color1 = 'tab:blue'
ax1.set_xlabel("Vgs [V]")
ax1.set_ylabel("gm/Id [S/A]", color=color1)
ax1.plot(Vgs, gm_Id, color=color1, marker='o', label='gm/Id')
ax1.tick_params(axis='y', labelcolor=color1)
ax1.grid(True)

# Create secondary y-axis sharing the same x-axis
ax2 = ax1.twinx()
color2 = 'tab:red'
ax2.set_ylabel("fT [GHz]", color=color2)
ax2.plot(Vgs, fT, color=color2, marker='s', linestyle='--', label='fT')
ax2.tick_params(axis='y', labelcolor=color2)

# Add titles and layout
plt.title("gm/Id and fT vs Vgs")
fig.tight_layout()
plt.show()

