from scipy.stats import tukey_hsd
import csv
import statistics


college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"

inputs = ["distilroberta", "MiniLM", "MiniLM_L12", "SBERT", "MPNet"]

# inputpath = home + "/FYP/Context Vector Analysis/results_distilroberta.csv"
# outputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_Roberta.csv"

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
        self.OSres = 0
        self.SSres = 0
        self.OSgres = 0
        self.SSgres = 0
        self.OSfres = 0
        self.SSfres = 0

dialogues = []
for input in inputs:
    inputpath = home + "/FYP/Context Vector Analysis/results_" + input + ".csv"
    outputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_" + input + ".csv"
    with open(inputpath) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        globalindextemp = 0
        familiartemp = ""
        eyecontemp = ""
        devscoretemp = ""
        realitytemp = 0
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
                    familiartemp = row[3]
                    eyecontemp = row[4]
                    devscoretemp = int(row[5])
                    realitytemp = int(row[6])
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
                    dialogues.append(Dialogue(globalindextemp, realitytemp, familiartemp, eyecontemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))
                    OS = []
                    SS = []
                    OSg = []
                    SSg = []
                    OSf = []
                    SSf = []
                    globalindextemp = int(row[0])
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
            linecnt += 1

        dialogues.append(Dialogue(globalindextemp, realitytemp, familiartemp, eyecontemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))

    indexer = 128

    for i in range(indexer):
        OS_mean = (dialogues[indexer + i].OS + dialogues[(2 * indexer) + i].OS + dialogues[(3 * indexer) + i].OS + dialogues[(4 * indexer) + i].OS + dialogues[(5 * indexer) + i].OS + dialogues[(6 * indexer) + i].OS + dialogues[(7 * indexer) + i].OS + dialogues[(8 * indexer) + i].OS + dialogues[(9 * indexer) + i].OS + dialogues[(10 * indexer) + i].OS) / 10
        SS_mean = (dialogues[indexer + i].SS + dialogues[(2 * indexer) + i].SS + dialogues[(3 * indexer) + i].SS + dialogues[(4 * indexer) + i].SS + dialogues[(5 * indexer) + i].SS + dialogues[(6 * indexer) + i].SS + dialogues[(7 * indexer) + i].SS + dialogues[(8 * indexer) + i].SS + dialogues[(9 * indexer) + i].SS + dialogues[(10 * indexer) + i].SS) / 10
        OSg_mean = (dialogues[indexer + i].OSg + dialogues[(2 * indexer) + i].OSg + dialogues[(3 * indexer) + i].OSg + dialogues[(4 * indexer) + i].OSg + dialogues[(5 * indexer) + i].OSg + dialogues[(6 * indexer) + i].OSg + dialogues[(7 * indexer) + i].OSg + dialogues[(8 * indexer) + i].OSg + dialogues[(9 * indexer) + i].OSg + dialogues[(10 * indexer) + i].OSg) / 10
        SSg_mean = (dialogues[indexer + i].SSg + dialogues[(2 * indexer) + i].SSg + dialogues[(3 * indexer) + i].SSg + dialogues[(4 * indexer) + i].SSg + dialogues[(5 * indexer) + i].SSg + dialogues[(6 * indexer) + i].SSg + dialogues[(7 * indexer) + i].SSg + dialogues[(8 * indexer) + i].SSg + dialogues[(9 * indexer) + i].SSg + dialogues[(10 * indexer) + i].SSg) / 10
        OSf_mean = (dialogues[indexer + i].OSf + dialogues[(2 * indexer) + i].OSf + dialogues[(3 * indexer) + i].OSf + dialogues[(4 * indexer) + i].OSf + dialogues[(5 * indexer) + i].OSf + dialogues[(6 * indexer) + i].OSf + dialogues[(7 * indexer) + i].OSf + dialogues[(8 * indexer) + i].OSf + dialogues[(9 * indexer) + i].OSf + dialogues[(10 * indexer) + i].OSf) / 10
        SSf_mean = (dialogues[indexer + i].SSf + dialogues[(2 * indexer) + i].SSf + dialogues[(3 * indexer) + i].SSf + dialogues[(4 * indexer) + i].SSf + dialogues[(5 * indexer) + i].SSf + dialogues[(6 * indexer) + i].SSf + dialogues[(7 * indexer) + i].SSf + dialogues[(8 * indexer) + i].SSf + dialogues[(9 * indexer) + i].SSf + dialogues[(10 * indexer) + i].SSf) / 10

        OS_res = tukey_hsd(dialogues[i].OSf, OS_mean)
        SS_res = tukey_hsd(dialogues[i].SSf, SS_mean)
        OSg_res = tukey_hsd(dialogues[i].OSg, OSg_mean)
        SSg_res = tukey_hsd(dialogues[i].SSg, SSg_mean)
        OSf_res = tukey_hsd(dialogues[i].OS, OSf_mean)
        SSf_res = tukey_hsd(dialogues[i].SS, SSf_mean)

        dialogues[i].OSres = OS_res.pvalue[0, 1]
        dialogues[i].SSres = SS_res.pvalue[0, 1]
        dialogues[i].OSgres = OSg_res.pvalue[0, 1]
        dialogues[i].SSgres = SSg_res.pvalue[0, 1]
        dialogues[i].OSfres = OSf_res.pvalue[0, 1]
        dialogues[i].SSfres = SSf_res.pvalue[0, 1]

    with open(outputpath, 'w', newline='',) as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Global Index', 'EyeCon', 'Familiar', 'DevScore', 'OS', 'SS', 'OSg', 'SSg', 'OSf', 'SSf'])
        for i in range(128):
            writer.writerow([dialogues[i].global_id, dialogues[i].eyecon, dialogues[i].familiar, dialogues[i].devscore, dialogues[i].OSres, dialogues[i].SSres, dialogues[i].OSgres, dialogues[i].SSgres, dialogues[i].OSfres, dialogues[i].SSfres])