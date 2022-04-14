from scipy.stats import tukey_hsd
import csv


college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"


inputpath = home + "/FYP/Context Vector Analysis/Averaged_Similarity_Results_v2.csv"
outputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_v2.csv"

SS = []
OS = []

with open(inputpath) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    OStmp = []
    SStmp = []
    realitytmp = 0
    linecnt = 0
    for row in csv_reader:
        if(linecnt != 0):
            if(int(row[1]) != realitytmp):
                realitytmp = int(row[1])
                OS.append(OStmp)
                SS.append(SStmp)
                OStmp = []
                SStmp = []
            OStmp.append(float(row[2]))
            SStmp.append(float(row[3]))
        linecnt = linecnt + 1
    OS.append(OStmp)
    SS.append(SStmp)

OSres = tukey_hsd(OS[0], OS[1], OS[2], OS[3], OS[4], OS[5], OS[6], OS[7], OS[8], OS[9], OS[10])
print(OSres)

        




