from scipy.stats import tukey_hsd
import csv


college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"


inputpath = home + "/FYP/Context Vector Analysis/results_v4.csv"
outputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_MPNet.csv"

class Dialogue:
    def __init__(self, global_id, reality, eyecon, familiar, devscore, OS, SS, OSg, SSg, OSf, SSf):
        self.global_id = global_id
        self.reality = reality
        self.eyecon = eyecon
        self.familiar = familiar
        self.devscore = devscore
        self.OS = OS
        self.SS = SS
        self.OSg = OSg
        self.SSg = SSg
        self.OSf = OSf
        self.SSf = SSf
        self.OSres = []
        self.SSres = []
        self.OSgres = []
        self.SSgres = []
        self.OSfres = []
        self.SSfres = []

dialogues = []

with open(inputpath) as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    globalindextemp = 0
    linecnt = 0
    OS = []
    SS = []
    OSg = []
    SSg = []
    OSf = []
    SSf = []
    for row in csv_reader:
        if linecnt != 0:
            if (int(row[0]) == globalindextemp):
                if (row[7] != 'N/A'):
                    OS.append(float(row[7]))
                    if(row[2] == 'f'):
                        OSf.append(float(row[7]))
                    elif(row[2] == 'g'):
                        OSg.append(float(row[7]))
                    

                if (row[8] != 'N/A'):
                    SS.append(float(row[8]))
                    if(row[2] == 'f'):
                        SSf.append(float(row[8]))
                    elif(row[2] == 'g'):
                        SSg.append(float(row[8]))

            elif (int(row[0]) != globalindextemp):
                dialogues.append(Dialogue(globalindextemp, int(row[6]), row[3], row[4], int(row[5]), OS, SS, OSg, SSg, OSf, SSf))
                OS = []
                SS = []
                OSg = []
                SSg = []
                OSf = []
                SSf = []
                globalindextemp = int(row[0])
        linecnt += 1

    dialogues.append(Dialogue(globalindextemp, int(row[6]), row[3], row[4], int(row[5]), OS, SS, OSg, SSg, OSf, SSf))


indexer = 128
for i in range(indexer):
    OSf_res = tukey_hsd(dialogues[i].OSf, dialogues[indexer + i].OSf, dialogues[(2 * indexer) + i].OSf, dialogues[(3 * indexer) + i].OSf, dialogues[(4 * indexer) + i].OSf, dialogues[(5 * indexer) + i].OSf, dialogues[(6 * indexer) + i].OSf, dialogues[(7 * indexer) + i].OSf, dialogues[(8 * indexer) + i].OSf, dialogues[(9 * indexer) + i].OSf, dialogues[(10 * indexer) + i].OSf)
    SSf_res = tukey_hsd(dialogues[i].SSf, dialogues[indexer + i].SSf, dialogues[(2 * indexer) + i].SSf, dialogues[(3 * indexer) + i].SSf, dialogues[(4 * indexer) + i].SSf, dialogues[(5 * indexer) + i].SSf, dialogues[(6 * indexer) + i].SSf, dialogues[(7 * indexer) + i].SSf, dialogues[(8 * indexer) + i].SSf, dialogues[(9 * indexer) + i].SSf, dialogues[(10 * indexer) + i].SSf)
    OSg_res = tukey_hsd(dialogues[i].OSg, dialogues[indexer + i].OSg, dialogues[(2 * indexer) + i].OSg, dialogues[(3 * indexer) + i].OSg, dialogues[(4 * indexer) + i].OSg, dialogues[(5 * indexer) + i].OSg, dialogues[(6 * indexer) + i].OSg, dialogues[(7 * indexer) + i].OSg, dialogues[(8 * indexer) + i].OSg, dialogues[(9 * indexer) + i].OSg, dialogues[(10 * indexer) + i].OSg)
    SSg_res = tukey_hsd(dialogues[i].SSg, dialogues[indexer + i].SSg, dialogues[(2 * indexer) + i].SSg, dialogues[(3 * indexer) + i].SSg, dialogues[(4 * indexer) + i].SSg, dialogues[(5 * indexer) + i].SSg, dialogues[(6 * indexer) + i].SSg, dialogues[(7 * indexer) + i].SSg, dialogues[(8 * indexer) + i].SSg, dialogues[(9 * indexer) + i].SSg, dialogues[(10 * indexer) + i].SSg)
    OS_res = tukey_hsd(dialogues[i].OS, dialogues[indexer + i].OS, dialogues[(2 * indexer) + i].OS, dialogues[(3 * indexer) + i].OS, dialogues[(4 * indexer) + i].OS, dialogues[(5 * indexer) + i].OS, dialogues[(6 * indexer) + i].OS, dialogues[(7 * indexer) + i].OS, dialogues[(8 * indexer) + i].OS, dialogues[(9 * indexer) + i].OS, dialogues[(10 * indexer) + i].OS)
    SS_res = tukey_hsd(dialogues[i].SS, dialogues[indexer + i].SS, dialogues[(2 * indexer) + i].SS, dialogues[(3 * indexer) + i].SS, dialogues[(4 * indexer) + i].SS, dialogues[(5 * indexer) + i].SS, dialogues[(6 * indexer) + i].SS, dialogues[(7 * indexer) + i].SS, dialogues[(8 * indexer) + i].SS, dialogues[(9 * indexer) + i].SS, dialogues[(10 * indexer) + i].SS)
    for j in range(10):
        dialogues[i].OSres.append(OS_res.pvalue[0, j])
        dialogues[i].SSres.append(SS_res.pvalue[0, j])
        dialogues[i].OSgres.append(OSg_res.pvalue[0, j])
        dialogues[i].SSgres.append(SSg_res.pvalue[0, j])
        dialogues[i].OSfres.append(OSf_res.pvalue[0, j])
        dialogues[i].SSfres.append(SSf_res.pvalue[0, j])

with open(outputpath, 'w', newline='',) as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Global Index', 'vs. Reality', 'EyeCon', 'Familiar', 'DevScore', 'OS', 'SS', 'OSg', 'SSg', 'OSf', 'SSf'])
    for i in range(128):
        for j in range(10):
            writer.writerow([dialogues[i].global_id, j+1, dialogues[i].eyecon, dialogues[i].familiar, dialogues[i].devscore, dialogues[i].OS[j], dialogues[i].SS[j], dialogues[i].OSg[j], dialogues[i].SSg[j], dialogues[i].OSf[j], dialogues[i].SSf[j]])



# print('\nOS for IF')
# OSf_res = tukey_hsd(dialogues[0].OSf, dialogues[128].OSf, dialogues[256].OSf, dialogues[384].OSf, dialogues[512].OSf, dialogues[640].OSf, dialogues[768].OSf, dialogues[896].OSf, dialogues[1024].OSf, dialogues[1152].OSf, dialogues[1280].OSf)
# print(OSf_res)
# print('\nSS for IF')
# SSf_res = tukey_hsd(dialogues[0].SSf, dialogues[128].SSf, dialogues[256].SSf, dialogues[384].SSf, dialogues[512].SSf, dialogues[640].SSf, dialogues[768].SSf, dialogues[896].SSf, dialogues[1024].SSf, dialogues[1152].SSf, dialogues[1280].SSf)
# print(SSf_res)
# print('\nOS for IG')
# OSg_res = tukey_hsd(dialogues[0].OSg, dialogues[128].OSg, dialogues[256].OSg, dialogues[384].OSg, dialogues[512].OSg, dialogues[640].OSg, dialogues[768].OSg, dialogues[896].OSg, dialogues[1024].OSg, dialogues[1152].OSg, dialogues[1280].OSg)
# print(OSg_res)
# print('\nSS for IG')
# SSg_res = tukey_hsd(dialogues[0].SSg, dialogues[128].SSg, dialogues[256].SSg, dialogues[384].SSg, dialogues[512].SSg, dialogues[640].SSg, dialogues[768].SSg, dialogues[896].SSg, dialogues[1024].SSg, dialogues[1152].SSg, dialogues[1280].SSg)
# print(SSg_res)
# print('\nOS')
# OS_res = tukey_hsd(dialogues[0].OS, dialogues[128].OS, dialogues[256].OS, dialogues[384].OS, dialogues[512].OS, dialogues[640].OS, dialogues[768].OS, dialogues[896].OS, dialogues[1024].OS, dialogues[1152].OS, dialogues[1280].OS)
# print(OS_res)
# print('\nSS')
# SS_res = tukey_hsd(dialogues[0].SS, dialogues[128].SS, dialogues[256].SS, dialogues[384].SS, dialogues[512].SS, dialogues[640].SS, dialogues[768].SS, dialogues[896].SS, dialogues[1024].SS, dialogues[1152].SS, dialogues[1280].SS)
# print(SS_res)



# SS = []
# OS = []

# with open(inputpath) as csv_file:
#     csv_reader = csv.reader(csv_file, delimiter=',')
#     OStmp = []
#     SStmp = []
#     realitytmp = 0
#     linecnt = 0
#     for row in csv_reader:
#         if(linecnt != 0):
#             if(int(row[1]) != realitytmp):
#                 realitytmp = int(row[1])
#                 OS.append(OStmp)
#                 SS.append(SStmp)
#                 OStmp = []
#                 SStmp = []
#             OStmp.append(float(row[2]))
#             SStmp.append(float(row[3]))
#         linecnt = linecnt + 1
#     OS.append(OStmp)
#     SS.append(SStmp)

# OSres = tukey_hsd(OS[0], OS[1], OS[2], OS[3], OS[4], OS[5], OS[6], OS[7], OS[8], OS[9], OS[10])
# print(OSres)

        




