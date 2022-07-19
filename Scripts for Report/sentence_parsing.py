import os
import csv

class Sentence:
    def __init__(self, global_index, local_index, speaker,
    sentence, eyecon, familiar, devscore, reality):

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

class Dev_Score:
    def __init__(self, dialogue_id, score):
        self.dialogue_id = dialogue_id
        self.score = score

def load_dev_scores(devscore_file_path):
    devscores = []
    with open(devscore_file_path) as fh:

        for line in fh:

            dialogue_id, score = line.split(" ", 1)

            devscores.append(Dev_Score(dialogue_id, 
            score.strip()))

    fh.close()

    return devscores

def tag_sentences(filename, inputpath, transcript_no, 
sentences, devscores, reality):

    local_index = 0
    eyecon = "false"
    familiar = "false"
    #check for 'e' in filename representing dialogues 
    # w/ eye contact

    if filename[2] == "e":
        eyecon = "true"

    #'latin squares' pattern of dialogues necessitates 
    # extra logic to check for if dialogue participants are 
    # familiar
    
    if int(filename[1]) < 5:
        if filename[4] == "3" or filename[4] == "4" 
        or filename[4] == "7" or filename[4] == "8":

            familiar = "true"

    elif int(filename[1]) >= 5:
        if filename[4] == "1" or filename[4] == "2" 
        or filename[4] == "5" or filename[4] == "6":

            familiar = "true"

    #instantiate file path to current dialogue
    input_file_path = inputpath + "/" + filename

    #split input string & add metadata
    with open(input_file_path) as fh:

        for line in fh:

            speaker, sentence = line.strip().split(None, 1)

            sentences.append(Sentence(transcript_no, local_index, 
            speaker, sentence.strip(), eyecon, familiar, 
            devscores[transcript_no].score, reality))

            local_index = local_index + 1

        fh.close()

    return sentences