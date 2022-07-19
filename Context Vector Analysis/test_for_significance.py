import csv
from operator import truediv


## VARIABLES FOR SWITCHING PROJECT ROOT ##

college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"

## MODELS USED ##
## PUT CREDITS HERE ##

inputs = ["distilroberta", "MiniLM", "MiniLM_L12", "SBERT", "MPNet"]

class Dialogue:
    def __init__(self, global_id, eyecon, familiar, devscore, OS, SS, OSg, SSg, OSf, SSf):
        self.global_id = global_id
        self.eyecon = eyecon
        self.familiar = familiar
        self.devscore = devscore
        self.OS = OS
        self.SS = SS
        self.OSg = OSg
        self.SSg = SSg
        self.OSf = OSf
        self.SSf = SSf

for input in inputs:

    print('\nResults for model:' + input)

    inputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_" + input + ".csv"
    outputpath = home + "/FYP/Context Vector Analysis/DATA_DIAL_" + input + ".csv"

    significant_p = 0.05
    dialogues = []



            
    def isSignificant(value):
        if(value < significant_p):
            return True
        else:
            return False

    OStotal = 0
    SStotal = 0
    OSgtotal = 0
    SSgtotal = 0
    OSftotal = 0
    SSftotal = 0

    with open(inputpath) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        linecnt = 0
        globalindextemp = 0
        eyecontemp = ""
        familiartemp = ""
        devscoretemp = ""
        OS = 0
        SS = 0
        OSg = 0
        SSg = 0
        OSf = 0
        SSf = 0
        for row in csv_reader:
            if linecnt != 0:
                if (int(row[0]) == globalindextemp):
                    eyecontemp = row[2]
                    familiartemp = row[3]
                    devscoretemp = row[4]
                    if(isSignificant(float(row[5]))):
                        OS += 1
                    if(isSignificant(float(row[6]))):
                        SS += 1
                    if(isSignificant(float(row[7]))):
                        OSg += 1
                    if(isSignificant(float(row[8]))):
                        SSg += 1
                    if(isSignificant(float(row[9]))):
                        OSf += 1
                    if(isSignificant(float(row[10]))):
                        SSf += 1
                elif (int(row[0]) != globalindextemp):
                    dialogues.append(Dialogue(globalindextemp, eyecontemp, familiartemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))
                    globalindextemp = int(row[0])
                    OStotal += OS
                    SStotal += SS
                    OSgtotal += OSg
                    SSgtotal += SSg
                    OSftotal += OSf
                    SSftotal += SSf
                    OS = 0
                    SS = 0
                    OSg = 0
                    SSg = 0
                    OSf = 0
                    SSf = 0
                    if(isSignificant(float(row[5]))):
                        OS += 1
                    if(isSignificant(float(row[6]))):
                        SS += 1
                    if(isSignificant(float(row[7]))):
                        OSg += 1
                    if(isSignificant(float(row[8]))):
                        SSg += 1
                    if(isSignificant(float(row[9]))):
                        OSf += 1
                    if(isSignificant(float(row[10]))):
                        SSf += 1
            linecnt += 1
        dialogues.append(Dialogue(globalindextemp, eyecontemp, familiartemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))
        OStotal += OS
        SStotal += SS
        OSgtotal += OSg
        SSgtotal += SSg
        OSftotal += OSf
        SSftotal += SSf


    with open(outputpath, 'w', newline='',) as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Global Index', 'EyeCon', 'Familiar', 'DevScore', 'OS', 'SS', 'OSg', 'SSg', 'OSf', 'SSf'])
        for dialogue in dialogues:
            writer.writerow([dialogue.global_id,dialogue.eyecon,dialogue.familiar,dialogue.devscore,dialogue.OS,dialogue.SS,dialogue.OSg,dialogue.SSg,dialogue.OSf,dialogue.SSf])

    print('\nNull Hypothesis Rejections:')
    print('\nOS: ' + str(OStotal))
    print('\nSS: ' + str(SStotal))
    print('\nOSg: ' + str(OSgtotal))
    print('\nSSg: ' + str(SSgtotal))
    print('\nOSf: ' + str(OSftotal))
    print('\nSSf: ' + str(SSftotal))



