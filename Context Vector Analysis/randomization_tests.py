import random

college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

inputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Clean"
outputpath = home + "/FYP Auxiliary/transcripts/Transcripts_Randomized"

input_file_path = inputpath + "/q1ec1.txt"
output_file_path = outputpath + "/q1ec1.txt"

#class Turn:
    #def __init__(self, speaker, sentence):
        #self.speaker = speaker
        #self.sentence = sentence

#sentences = []

lines = open(input_file_path).readlines()
random.shuffle(lines)
open(output_file_path, 'w').writelines(lines)

#with open(input_file_path) as fh:

    #for line in fh:

        #speaker, sentence = line.strip().split(None, 1)

        #sentences.append(Turn(speaker, sentence.strip()))

    #fh.close()

#print("\nNon-Randomized:")
#for sentence in sentences:
    #print("\nSpeaker: " + sentence.speaker + " Sentence: " + sentence.sentence)

#random.shuffle(sentences)

#print("\nRandomized:")
#for sentence in sentences:
    #print("\nSpeaker: " + sentence.speaker + " Sentence: " + sentence.sentence)