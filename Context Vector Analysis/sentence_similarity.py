import os
import csv
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

model = SentenceTransformer('bert-base-nli-mean-tokens')
inputpath = college + "/FYP Auxiliary/transcripts/Transcripts_Clean"
outputpath = college + "/FYP/Context Vector Analysis"

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
sentences_master = []
filename = ""

os.chdir(inputpath)

for transcript_no, file in enumerate(os.listdir()):

    local_index = 0
    sentences = []
    filename = file
    eyecon = "false"
    familiar = "false"

    if filename[2] == "e":
        eyecon = "true"

    if int(filename[1]) < 5:
        if filename[4] == "3" or filename[4] == "4" or filename[4] == "7" or filename[4] == "8":
            familiar = "true"

    elif int(filename[1]) >= 5:
        if filename[4] == "1" or filename[4] == "2" or filename[4] == "5" or filename[4] == "6":
            familiar = "true"




    input_file_path = inputpath + "/" + filename

    #split input string & add metadata
    with open(input_file_path) as fh:

        for line in fh:

            speaker, sentence = line.strip().split(None, 1)

            sentences.append(Sentence(transcript_no, local_index, speaker, sentence.strip(), eyecon, familiar))
            local_index = local_index + 1

        fh.close()

    #calculate vector mebeddings & compute SS & OS
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

    sentences_master.extend(sentences)

#for sentence in sentences_master:
    #print("\nGlobal Index: " + str(sentence.global_index + 1) + " Local Index: " + str(sentence.local_index) + " Speaker: " + sentence.speaker + " Familiar: " + sentence.familiar + " Eye Contact: " + sentence.eyecon + " OS: " + str(sentence.OS) + " SS: " + str(sentence.SS))

with open(outputpath + '/results.csv', 'w', newline='',) as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Global Index', 'Local Index', 'Speaker', 'Familiar', 'Eye Contact', 'OS', 'SS'])
    for sentence in sentences_master:
        writer.writerow([sentence.global_index, sentence.local_index, sentence.speaker, sentence.familiar, sentence.eyecon, sentence.OS, sentence.SS])