import os
import csv
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

##variables for switching root in i/o paths
college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

#instantiate transformer model
model = SentenceTransformer('bert-base-nli-mean-tokens')

#dialogue input and results output
inputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Clean"
outputpath = home + "/FYP/Context Vector Analysis"

#sentence object to store turn information
class Sentence:
    def __init__(self, global_index, local_index, speaker, sentence, eyecon, familiar):
        self.local_index = local_index
        self.global_index = global_index
        self.speaker = speaker
        self.sentence = sentence   
        self.eyecon = eyecon
        self.familiar = familiar
        self.OS = 'N/A'
        self.SS = 'N/A'

#instantiate master turn array and dialogue filename
sentences_master = []
filename = ""

#change active directory to use os.listdir()
os.chdir(inputpath)

#iterate through all dialogues in input folder
for transcript_no, file in enumerate(os.listdir()):

    #instantiate local index, sentences list for given dialogue,
    #dialogue file name, and local variables for eye contact and familiarity
    local_index = 0
    sentences = []
    filename = file
    eyecon = "false"
    familiar = "false"

    #check for 'e' in filename representing dialogues w/ eye contact
    if filename[2] == "e":
        eyecon = "true"

    #'latin squares' pattern of dialogues necessitates extra logic to check for if dialogue participants are familiar
    if int(filename[1]) < 5:
        if filename[4] == "3" or filename[4] == "4" or filename[4] == "7" or filename[4] == "8":
            familiar = "true"

    elif int(filename[1]) >= 5:
        if filename[4] == "1" or filename[4] == "2" or filename[4] == "5" or filename[4] == "6":
            familiar = "true"



    #instantiate file path to current dialogue
    input_file_path = inputpath + "/" + filename

    #split input string & add metadata
    with open(input_file_path) as fh:

        for line in fh:

            speaker, sentence = line.strip().split(None, 1)

            sentences.append(Sentence(transcript_no, local_index, speaker, sentence.strip(), eyecon, familiar))
            local_index = local_index + 1

        fh.close()

    #calculate vector embeddings & compute SS & OS
    #mostly just error handling for cases i=0,1,2,3 where OS & SS values are not necessarily applicable
    for idx, sentence in enumerate(sentences):
        sentence.vector = model.encode(sentence.sentence)
        #print(sentence.vector.shape)
        if idx != 0:
            tmpspkr = sentence.speaker
            #print("\n" + tmpspkr)
            tmpidx = idx - 1

            if sentences[tmpidx].speaker == tmpspkr:
                #print("\n Check 1")
                #print(sentence.vector, sentences[tmpidx].vector)
                sentence.SS = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker == tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker != tmpspkr:
                        sentence.OS = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                        #print("\n Check 3 ")

            elif sentences[tmpidx].speaker != tmpspkr:
                #print("\n Check 1")
                #print(sentence.vector, sentences[tmpidx].vector)
                sentence.OS = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker != tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker == tmpspkr:
                        sentence.SS = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                        #print("\n Check 3 ")

    #add finished sentences list to master list
    sentences_master.extend(sentences)

#for sentence in sentences_master:
    #print("\nGlobal Index: " + str(sentence.global_index + 1) + " Local Index: " + str(sentence.local_index) + " Speaker: " + sentence.speaker + " Familiar: " + sentence.familiar + " Eye Contact: " + sentence.eyecon + " OS: " + str(sentence.OS) + " SS: " + str(sentence.SS))

#output master list of sentence objects to csv
with open(outputpath + '/results.csv', 'w', newline='',) as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Global Index', 'Local Index', 'Speaker', 'Familiar', 'Eye Contact', 'OS', 'SS'])
    for sentence in sentences_master:
        writer.writerow([sentence.global_index, sentence.local_index, sentence.speaker, sentence.familiar, sentence.eyecon, sentence.OS, sentence.SS])