#! /usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

f = open("numInstrs", "r")
l = f.readline()
l = [int(i) for i in l.split()]
l = np.sort(l)
ma = np.max(l)
mi = np.min(l)

nl = l.astype(float)/np.sum(l)
X = np.linspace(mi, ma, 1000)
CY = np.cumsum(nl)
plt.plot(X, CY)
plt.title("Percentage of Turing Machine instructions completed (CDF)")
plt.xlabel("Number of instructions completed")
plt.ylabel("Percentage of runs completing that number of instructions")
plt.savefig("instructionsCDF")
plt.show()