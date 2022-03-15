import os

college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

inputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Clean"
devscorepath = home + "/FYP Auxiliary/transcripts"

class Sentence:
    def __init__(self, global_index, local_index, speaker, sentence, eyecon, familiar):
        self.local_index = local_index
        self.speaker = speaker
        self.sentence = sentence   
        self.eyecon = eyecon
        self.familiar = familiar
        self.OS = 'N/A'
        self.SS = 'N/A'

devscore_file_path = inputpath + "/deviation-scores.txt"

speaker, sentence = line.strip().split(None, 1)

os.chdir(inputpath)

#for transcript_no, file in enumerate(os.listdir()):

    #i = 0
    #filename = file
    #eyecon = "false"
    #familiar = "false"

    #if filename[2] == "e":
        #eyecon = "true"

    #if int(filename[1]) < 5:
        #if filename[4] == "3" or filename[4] == "4" or filename[4] == "7" or filename[4] == "8":
            #familiar = "true"

    #elif int(filename[1]) >= 5:
        #if filename[4] == "1" or filename[4] == "2" or filename[4] == "5" or filename[4] == "6":
            #familiar = "true"




    #input_file_path = inputpath + "/" + filename


    #with open(input_file_path) as fh:

        #for line in fh:

            #speaker, sentence = line.strip().split(None, 1)

            #print("\nGlobal Index: " + str(transcript_no + 1) + " Local Index: " + str(i) + " Speaker: " + speaker + " Familiar: " + familiar + " Eye Contact: " + eyecon)
            #i = i + 1

        #fh.close()