import os
import csv
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

#sentence object to store turn information
class Sentence:
    def __init__(self, global_index, local_index, speaker, sentence, eyecon, familiar, devscore, reality):
        self.local_index = local_index
        self.global_index = global_index
        self.speaker = speaker
        self.sentence = sentence   
        self.eyecon = eyecon
        self.familiar = familiar
        self.devscore = devscore
        self.reality = reality
        self.OS = 'N/A'
        self.SS = 'N/A'

#dev score storage object
class Dev_Score:
    def __init__(self, dialogue_id, score):
        self.dialogue_id = dialogue_id
        self.score = score

#load in dev scores
def load_dev_scores(devscore_file_path):
    devscores = []
    with open(devscore_file_path) as fh:

        for line in fh:

            dialogue_id, score = line.split(" ", 1)

            devscores.append(Dev_Score(dialogue_id, score.strip()))
    fh.close()

    return devscores

def tag_sentences(filename, inputpath, transcript_no, sentences, devscores, reality):
    local_index = 0
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

            sentences.append(Sentence(transcript_no, local_index, speaker, sentence.strip(), eyecon, familiar, devscores[transcript_no].score, reality))
            local_index = local_index + 1

        fh.close()

    return sentences

def cos_sim(vec1, vec2):
    sim = cosine_similarity(vec1.reshape(1, -1), vec2.reshape(1, -1))
    return sim[0, 0]

def encode_similarity(sentences):
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
                sentence.SS = cos_sim(sentence.vector, sentences[tmpidx].vector)
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker == tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker != tmpspkr:
                        sentence.OS = cos_sim(sentence.vector, sentences[tmpidx].vector)
                        #print("\n Check 3 ")

            elif sentences[tmpidx].speaker != tmpspkr:
                #print("\n Check 1")
                #print(sentence.vector, sentences[tmpidx].vector)
                sentence.OS = cos_sim(sentence.vector, sentences[tmpidx].vector)
                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker != tmpspkr and tmpidx > 0:
                        tmpidx = tmpidx - 1
                        #print("\n Check 2 " + str(tmpidx))
                
                    if sentences[tmpidx].speaker == tmpspkr:
                        sentence.SS = cos_sim(sentence.vector, sentences[tmpidx].vector)
                        #print("\n Check 3 ")

def results_to_csv(sentences, outputpath):
    #output master list of sentence objects to csv
    with open(outputpath + '/results_MiniLM_L12.csv', 'w', newline='',) as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Global Index', 'Local Index', 'Speaker', 'Familiar', 'Eye Contact', 'Dev Scores', 'Reality', 'OS', 'SS'])
        for sentence in sentences:
            writer.writerow([sentence.global_index, sentence.local_index, sentence.speaker, sentence.familiar, sentence.eyecon, sentence.devscore, sentence.reality, sentence.OS, sentence.SS])

def generate_data(inputpath, sentences_master, reality):
    #change active directory to use os.listdir()
    os.chdir(inputpath)

    #iterate through all dialogues in input folder
    for transcript_no, file in enumerate(os.listdir()):

        #instantiate local sentences list for given dialogue,

        sentences = []
        filename = file

        sentences = tag_sentences(filename, inputpath, transcript_no, sentences, devscores, reality)

        encode_similarity(sentences)

        #add finished sentences list to master list
        sentences_master.extend(sentences)

    return sentences_master

##MAIN PROGRAM STARTS HERE##

##variables for switching root in i/o paths
college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

#instantiate transformer model
model = SentenceTransformer('all-MiniLM-L12-v2')

#dialogue + devscore input and results output
inputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Clean"
randomized_inputs = home + "/FYP Auxiliary/transcripts/Transcripts_Randomized"
outputpath = home + "/FYP/Context Vector Analysis"
devscorepath = home + "/FYP Auxiliary/transcripts/deviation-scores.txt"

#load dev scores
devscores = load_dev_scores(devscorepath)

#instantiate master turn arrays
sentences_master = []
sentences_overlord = []

#generate data for given dialogue set
sentences_master = generate_data(inputpath, sentences_master, 0)
sentences_overlord.extend(sentences_master)

#generate data for randomized dialogues
for i in range(10):
    sentences_master = []

    inputpath = randomized_inputs + "/Randomization " + str(i + 1)

    sentences_master = generate_data(inputpath, sentences_master, (i + 1))
    sentences_overlord.extend(sentences_master)

results_to_csv(sentences_overlord, outputpath)