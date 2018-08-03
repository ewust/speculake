#!/usr/bin/python3

import numpy as np
import matplotlib.pyplot as plt

def get_data(fn):
    data = {}
    with open(fn) as f:
        lines = f.readlines()
        lines = [x.strip() for x in lines] 
        for line in lines:
            rounds = int(line.split()[2])
            hits = int(line.split()[1])
            if rounds not in data:
                data[rounds] = []
            data[rounds].append(hits)

    return data

def get_max(data):
    data_max = {}
    for rounds, array in data.items():
        data_max[rounds] = max(array)/2000.0
    return data_max


def get_avg(data):
    data_avg = {}
    for rounds, array in data.items():
        data_avg[rounds] = np.mean(array)/2000.0
    return data_avg


def main():
    fn = "data/results_greed_11.dat"
    data = get_data(fn)
    data_avg = get_avg(data)
    data_max = get_max(data)

    line_avg, = plt.plot(data_avg.keys(), data_avg.values(), 'r--', label="average")
    line_max, = plt.plot(data_max.keys(), data_max.values(), 'b-', label="max")
    plt.ylabel("Speculative hit Fraction")
    plt.xlabel("Direct Branch Training Rounds")
    plt.legend(handles=[line_max, line_avg])
    plt.show()
    

if __name__ == "__main__":
    main()
