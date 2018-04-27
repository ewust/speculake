#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np


def main():
    data_i5 = []
    data_xeon = []
    with open("cache-miss.dat", "r") as f:
        for line in f:
            if line.isspace(): 
                continue
            data_i5.append(int(line.split()[0]))

    with open("cache-miss-zbuff.dat", "r") as f:
        for line in f:
            if line.isspace(): 
                continue
            data_xeon.append(int(line.split()[0]))

    fig = plt.figure()
    pdf = fig.add_subplot(111)
    cdf = pdf.twinx()

    pdf.hist(data_i5, bins=1000, label="I5-7200U Density", color='#ff5050')
    sorted_data_i5 = np.sort(data_i5)
    yvals=np.arange(len(sorted_data_i5))/float(len(sorted_data_i5)-1)
    cdf.plot(sorted_data_i5,yvals, 'r-', label="I5-7200U CDF")

    pdf.hist(data_xeon, bins=1000, alpha=0.7, label="E3-1270 V5 Density", color='c')
    sorted_data_xeon = np.sort(data_xeon)
    yvals=np.arange(len(sorted_data_xeon))/float(len(sorted_data_xeon)-1)
    cdf.plot(sorted_data_xeon,yvals, 'b-', label="E3-1270 V5 CDF")

    pdf.set_xlim(20,5*10**4)
    cdf.set_ylim(0,1)
    pdf.set_yscale('log')
    pdf.set_xscale('log')

    pdf.set_xlabel('Cache Miss Duration (cycles)')
    pdf.set_ylabel('Density')
    cdf.set_ylabel('CDF')

    fig.suptitle("Cache-Miss Latency Distribution", fontsize=16)
    fig.legend(bbox_to_anchor=(.85, .7),
           bbox_transform=plt.gcf().transFigure)
    
    plt.show()


if __name__=="__main__":
    main()
