import os
import csv
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

model = SentenceTransformer('bert-base-nli-mean-tokens')

inputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Clean"
devscorepath = home + "/FYP Auxiliary/transcripts"

class Sentence:
    def __init__(self, global_index, local_index, speaker, sentence, eyecon, familiar, devscore):
        self.global_index = global_index
        self.local_index = local_index
        self.speaker = speaker
        self.sentence = sentence   
        self.eyecon = eyecon
        self.familiar = familiar
        self.devscore = devscore
        self.OS = 'N/A'
        self.SS = 'N/A'

class Dev_Score:
    def __init__(self, dialogue_id, score):
        self.dialogue_id = dialogue_id
        self.score = score

devscore_file_path = devscorepath + "/deviation-scores.txt"
input_file_path = inputpath + "/q1ec1.txt"
outputpath = home + "/FYP/Context Vector Analysis"

local_index = 0
sentences = []
devscores = []

with open(devscore_file_path) as fh:

    for line in fh:

        dialogue_id, score = line.split(" ", 1)

        devscores.append(Dev_Score(dialogue_id, score.strip()))

    fh.close()

with open(input_file_path) as fh:

    for line in fh:

        speaker, sentence = line.strip().split(None, 1)

        sentences.append(Sentence(0, local_index, speaker, sentence.strip(), 'false', 'true', devscores[0].score))
        local_index = local_index + 1

    fh.close()

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
                SSvec = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                sentence.SS = SSvec[0, 0]
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker == tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker != tmpspkr:
                        OSvec = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                        sentence.OS = OSvec[0, 0]
                        #print("\n Check 3 ")

            elif sentences[tmpidx].speaker != tmpspkr:
                #print("\n Check 1")
                #print(sentence.vector, sentences[tmpidx].vector)
                OSvec = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                sentence.OS = OSvec[0, 0]
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker != tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker == tmpspkr:
                        SSvec = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                        sentence.SS = SSvec[0, 0]
                        #print("\n Check 3 ")

with open(outputpath + '/turn_classification_test_results.csv', 'w', newline='',) as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Global Index', 'Local Index', 'Speaker', 'Familiar', 'Eye Contact', 'Dev Score', 'OS', 'SS'])
    for sentence in sentences:
        writer.writerow([sentence.global_index, sentence.local_index, sentence.speaker, sentence.familiar, sentence.eyecon, sentence.devscore, sentence.OS, sentence.SS])

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