import numpy as np
import matplotlib.pyplot as plt

# Path to the data file
file_path = "sim_data/data_nmos_idvgs_VDSp9_test.txt"

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

# Extract columns
x = data[:, 0]
y = data[:, 1]

# Create subplots: 1 row, 2 columns
fig, axes = plt.subplots(1, 2, figsize=(12, 5))

# Plot with linear y-axis
axes[0].plot(x, y, marker='o')
axes[0].set_xlabel("First Column")
axes[0].set_ylabel("Second Column")
axes[0].set_title("Linear Scale")
axes[0].grid(True)

# Plot with logarithmic y-axis
axes[1].plot(x, y, marker='o')
axes[1].set_xlabel("First Column")
axes[1].set_ylabel("Second Column (log scale)")
axes[1].set_yscale('log')
axes[1].set_title("Logarithmic Scale")
axes[1].grid(True, which="both", linestyle='--')

# Adjust layout
plt.tight_layout()
plt.show()
