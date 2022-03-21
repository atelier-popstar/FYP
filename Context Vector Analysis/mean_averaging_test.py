import csv

class Reality:
    def __init__(self, id, OSmean, SSmean):
        self.id = id
        self.OSmean = OSmean
        self.SSmean = SSmean

averages = []

with open("C:/Users/ttye7/Desktop/4th Year/FYP/Context Vector Analysis/results_v3.csv") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    realitytemp = 0
    OSaggregate = 0
    SSaggregate = 0
    OScnt = 0
    SScnt = 0
    linecnt = 0
    for row in csv_reader:
        if linecnt != 0:
            #print("\nReality: " + str(row[6]) + " Reality Temp: " + str(realitytemp))
            if (int(row[6]) == realitytemp):
                if (row[7] != 'N/A'):
                    OSaggregate += float(row[7])
                    OScnt += 1

                if (row[8] != 'N/A'):
                    SSaggregate += float(row[8])
                    SScnt += 1
            
            
            elif (int(row[6]) != realitytemp):
                averages.append(Reality(realitytemp, (OSaggregate/OScnt), (SSaggregate/SScnt)))
                OSaggregate = 0
                SSaggregate = 0
                OScnt = 0
                SScnt = 0
                realitytemp = int(row[6])

        linecnt += 1

averages.append(Reality(realitytemp, (OSaggregate/OScnt), (SSaggregate/SScnt)))

print("\nProcessed " + str(linecnt) + " lines.")
for reality in averages:
    print("\nReality: " + str(reality.id) + " OS Average: " + str(reality.OSmean) + " SS Average: " + str(reality.SSmean))


