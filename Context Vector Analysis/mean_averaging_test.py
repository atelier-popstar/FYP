import csv

college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"

class Dialogue:
    def __init__(self, global_id, reality, eyecon, familiar, devscore, OS, SS):
        self.global_id = global_id
        self.reality = reality
        self.eyecon = eyecon
        self.familiar = familiar
        self.devscore = devscore
        self.OS = OS
        self.SS = SS

dialogues = []

with open(home + "/FYP/Context Vector Analysis/results_v3.csv") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    globalindextemp = 0
    OSaggregate = 0
    SSaggregate = 0
    OScnt = 0
    SScnt = 0
    linecnt = 0
    for row in csv_reader:
        if linecnt != 0:
            #print("\nReality: " + str(row[6]) + " Reality Temp: " + str(realitytemp))

            if (int(row[0]) == globalindextemp):
                if (row[7] != 'N/A'):
                    OSaggregate += float(row[7])
                    OScnt += 1

                if (row[8] != 'N/A'):
                    SSaggregate += float(row[8])
                    SScnt += 1
            
            elif (int(row[0]) != globalindextemp):
                dialogues.append(Dialogue(globalindextemp, int(row[6]), row[3], row[4], int(row[5]), (OSaggregate/OScnt), (SSaggregate/SScnt)))
                OSaggregate = 0
                SSaggregate = 0
                OScnt = 0
                SScnt = 0
                globalindextemp = int(row[0])

        linecnt += 1

dialogues.append(Dialogue(globalindextemp, int(row[6]), row[3], row[4], int(row[5]), (OSaggregate/OScnt), (SSaggregate/SScnt)))


with open(home + "/FYP/Context Vector Analysis/Averaged_Similarity_Results_SBERT.csv", 'w', newline='',) as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Global Index', 'Reality', 'EyeCon', 'Familiar', 'DevScore', 'OS', 'SS'])
    for dialogue in dialogues:
        writer.writerow([dialogue.global_id, dialogue.reality, dialogue.eyecon, dialogue.familiar, dialogue.devscore, dialogue.OS, dialogue.SS])




