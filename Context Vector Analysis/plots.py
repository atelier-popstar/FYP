import matplotlib.pyplot as plt
import numpy as np
import csv

college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"

inputpath = home + "/FYP/Context Vector Analysis/Tukey Results v2/DATA_DIAL_MPNet.csv"

eyecon = []
familiar = []
devscore = []
OS = []
SS = []
OSg = []
SSg = []
OSf = []
SSf = []


with open(inputpath) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    linecnt = 0
    for row in csv_reader:
        if (linecnt != 0):
            eyecon.append(row[1])
            familiar.append(row[2])
            devscore.append(row[3])
            OS.append(row[4])
            SS.append(row[5])
            OSg.append(row[6])
            SSg.append(row[7])
            OSf.append(row[8])
            SSf.append(row[9])
        linecnt += 1

fig, ax = plt.subplots()

ax.scatter(devscore, OS)

ax.set(xlim=(0, 8), xticks=np.arange(1, 8),
       ylim=(0, 8), yticks=np.arange(1, 8))

plt.show()