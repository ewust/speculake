#! /usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
import sys

filename = ""
if len(sys.argv) > 2:
    filename = sys.argv[2]
else:
    filename = "totalNumMistakes"
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

means = [float(20000-i)/20000.0 for i in means]
meds = [float(20000-i)/20000.0 for i in meds]
mins = [float(20000-i)/20000.0 for i in mins]
maxes = [float(20000-i)/20000.0 for i in maxes]

# plt.plot(numJumps, mins, label="minimums")
# plt.subplot()
# plt.plot(numJumps, maxes, label="maximums")
# plt.subplot()
# plt.plot(numJumps, meds, label= "medians")
# plt.subplot()
# plt.plot(numJumps, means, label="mean")
# plt.legend()

# plt.xlabel("Number of iterations")
# plt.ylabel("Average time (s) taken to reach 20k instructions")
# plt.savefig("timeToComplete")
# plt.show(block=False)

fig, ax1 = plt.subplots()

color = "tab:blue"
ax1.set_xlabel("Number of iterations")
ax1.set_ylabel("Average success rate over 20k instructions")
ax1.plot(numJumps, means, label="Success rate", color=color, linewidth=3.0)
ax1.tick_params(axis="y", labelcolor=color)

# now plot hitrate

filename = ""
if len(sys.argv) > 1 :
    filename = sys.argv[1]
else:
    filename = "totalTimes"
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
        l = [float(i) for i in l.split()] 
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

ax2 = ax1.twinx()

color = "tab:red"
ax2.set_ylabel("Average time (s) to reach 20k instructions",color=color)
ax2.plot(numJumps, means, color=color,label="Average time", linewidth=3.0)
ax2.tick_params(axis="y", labelcolor=color)

fig.tight_layout()

plt.savefig("SuccessAndTime")
plt.show()