#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np


def main():
    data_hit = []
    data_miss = []
    with open("data/zbuff-cache-miss.dat", "r") as f:
        for line in f:
            if line.isspace(): 
                continue
            data_miss.append(int(line.split()[0]))

    with open("data/zbuff-cache-hits.dat", "r") as f:
        for line in f:
            if line.isspace(): 
                continue
            data_hit.append(int(line.split()[0]))

    fig = plt.figure()
    cdf = fig.add_subplot(111)

    sorted_data_miss = np.sort(data_miss)
    yvals=np.arange(len(sorted_data_miss))/float(len(sorted_data_miss)-1)
    cdf.plot(sorted_data_miss,yvals, 'b-', label="Cache Miss")

    sorted_data_hit = np.sort(data_hit)
    yvals=np.arange(len(sorted_data_hit))/float(len(sorted_data_hit)-1)
    cdf.plot(sorted_data_hit,yvals, 'r-', label="Cache Hit")

    cdf.set_ylim(0,1)
    cdf.set_xlim([1,2500])
    cdf.set_xscale('log')

    cdf.set_xlabel('Request Latency (cycles)')
    cdf.set_ylabel('CDF')

    fig.legend(bbox_to_anchor=(.4, .7),
           bbox_transform=plt.gcf().transFigure)
    
    plt.show()


if __name__=="__main__":
    main()
