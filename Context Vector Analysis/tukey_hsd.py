from scipy.stats import tukey_hsd
import csv

## TUKEY HSD TEST FOR SENTENCE EMBEDDING SIMILARITY RESULTS ##
## MODELS USED ARE LISTED IN 'INPUTS'##
## TOM TYE 18323900 ##

## VARIABLES FOR SWITCHING PROJECT ROOT ##

college = "C:/Users/tyet/Documents/GitHub"
home = "C:/Users/ttye7/Desktop/4th Year"

## MODELS USED ##
## PUT CREDITS HERE ##

inputs = ["distilroberta", "MiniLM", "MiniLM_L12", "SBERT", "MPNet"]

## OBJECT TO STORE DIALOGUE DATA ##

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

## ITERATE THROUGH SIMILARITY RESULTS FOR ALL MODELS ##

for input in inputs:

    ## INSTANTIATE LIST TO STORE PARSED CSV DATA ##

    dialogues = []

    ## I/O FILEPATH SELECTION ##

    inputpath = home + "/FYP/Context Vector Analysis/results_" + input + ".csv"
    outputpath = home + "/FYP/Context Vector Analysis/Tukey_HSD_Results_" + input + ".csv"

    ## PARSING OF INPUT CSV ##

    with open(inputpath) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')

        ##INSTANTIATE TEMP VARIABLES ##

        globalindextemp = 0
        familiartemp = ""
        eyecontemp = ""
        devscoretemp = ""
        realitytemp = 0
        linecnt = 0

        ##INSTANTIATE ARRAYS FOR SIMILARITY BASED ON CRITERIA ##

        OS = [] ## OTHER SHARED ##
        SS = [] ## SELF SHARED ## 
        OSg = [] ## OTHER SHARED FOR IG ##
        SSg = [] ## SELF SHARED FOR IG ##
        OSf = [] ## OTHER SHARED FOR IF ##
        SSf = [] ## SELF SHARED FOR IF ##

        for row in csv_reader:

            ## CHECK FOR HEADER ##

            if linecnt != 0:

                ## CHECK IF DIALOGUE IS COMPLETED ##

                ## IF NOT APPEND DATA TO SIMILARITY ARRAYS AND UPDATE TEMPS ##

                if (int(row[0]) == globalindextemp):
                    familiartemp = row[3]
                    eyecontemp = row[4]
                    devscoretemp = int(row[5])
                    realitytemp = int(row[6])

                    ##CHECK FOR "N/A" FIELDS ##

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

                ## IF SO APPEND DIALOGUE TO DIALOGUE ARRAY AND REINSTANTIATE TEMPS ##

                elif (int(row[0]) != globalindextemp):

                    ## APPEND DIALOGUE ##

                    dialogues.append(Dialogue(globalindextemp, realitytemp, familiartemp, eyecontemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))

                    ## REINSTANTIATE SIMILARITY ARRAYS AND GLOBAL INDEX TEMP ##

                    OS = []
                    SS = []
                    OSg = []
                    SSg = []
                    OSf = []
                    SSf = []
                    globalindextemp = int(row[0])

                    ## CHECK FOR "N/A" FIELDS ##

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

        ## ERROR HANDLING FOR APPENDING FINAL DIALOGUE ##

        dialogues.append(Dialogue(globalindextemp, realitytemp, familiartemp, eyecontemp, devscoretemp, OS, SS, OSg, SSg, OSf, SSf))


    ## GENERATE TUKEY RESULTS FOR SIMILARITY CRITERIA FOR ALL DIALOGUES ##

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

    ## EXPORT HSD RESULTS TO CSV ##

    with open(outputpath, 'w', newline='',) as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Global Index', 'vs. Reality', 'EyeCon', 'Familiar', 'DevScore', 'OS', 'SS', 'OSg', 'SSg', 'OSf', 'SSf'])
        for i in range(128):
            for j in range(10):
                writer.writerow([dialogues[i].global_id, j+1, dialogues[i].eyecon, dialogues[i].familiar, dialogues[i].devscore, dialogues[i].OSres[j], dialogues[i].SSres[j], dialogues[i].OSgres[j], dialogues[i].SSgres[j], dialogues[i].OSfres[j], dialogues[i].SSfres[j]])


        




