#! /usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
import sys

filename = ""
if len(sys.argv) > 1 :
    filename = sys.argv[1]
else:
    filename = "numInstrs"
f = open(filename, "r")

maxes = []
mins = []
meds = []
means = []
numJumps = [] 

with open(filename, "r") as f:
    l = f.readline() # jump number
    while l:
        numJumps.append(int(l.split()[1]))
        l = f.readline() # data
        l = [int(i) for i in l.split()]
        l = np.sort(l)
        ma = np.max(l)
        maxes.append(ma)
        mi = np.min(l)
        mins.append(mi)
        med = np.median(l)
        meds.append(med)
        mean = np.mean(l)
        means.append(mean)
        l = f.readline() # jump number

print("numJumps = " + str(numJumps))
print("mins = " + str(mins))
# plt.plot(numJumps, mins, label="minimums")
# plt.subplot()
# plt.plot(numJumps, maxes, label="maximums")
# plt.subplot()
# plt.plot(numJumps, meds, label= "medians")
# plt.subplot()
# plt.plot(numJumps, means, label= "means")

plt.plot(numJumps, mins, label="minimums")
plt.subplot()
plt.semilogy(numJumps, maxes, label="maximums")
plt.subplot()
plt.semilogy(numJumps, meds, label= "medians")
plt.subplot()
plt.semilogy(numJumps, means, label= "means")
plt.legend()

plt.xlabel("Number of priming jumps")
plt.ylabel("Number of steps before first error")
plt.title("Effect number of priming jumps has on success")
plt.savefig("jumpAffect")
plt.show()

# nl = l.astype(float)/np.sum(l)
# X = np.linspace(mi, ma, 1000)
# CY = np.cumsum(nl)
# plt.plot(X, CY)
# plt.title("Fraction of Turing Machine instructions completed (CDF)")
# plt.xlabel("Number of instructions completed")
# plt.ylabel("Fraction of runs completing that number of instructions")
# plt.savefig("instructionsCDF")
# plt.show()