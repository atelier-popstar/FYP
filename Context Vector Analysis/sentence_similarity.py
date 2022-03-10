from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

college = "C:/Users/tyet/Documents"
home = "C:/Users/ttye7/Desktop/4th Year"

model = SentenceTransformer('bert-base-nli-mean-tokens')
input_file = home + "/FYP Auxiliary/transcripts/Transcripts_Clean/q1ec1.txt"

class Sentence:
    def __init__(self, index, speaker, sentence):
        self.index = index
        self.speaker = speaker
        self.sentence = sentence   
        self.OS = 0
        self.SS = 0

sentences = []
i = 0

with open(input_file) as fh:

    for line in fh:

        speaker, sentence = line.strip().split(None, 1)

        sentences.append(Sentence(i, speaker, sentence.strip()))

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
            if tmpidx > 0:
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
            if tmpidx > 0:
                while sentences[tmpidx].speaker != tmpspkr and tmpidx > 0:
                    tmpidx = tmpidx - 1
                    #print("\n Check 2 " + str(tmpidx))
                
                if sentences[tmpidx].speaker == tmpspkr:
                    sentence.SS = cosine_similarity(sentence.vector.reshape(1, -1), sentences[tmpidx].vector.reshape(1, -1))
                    #print("\n Check 3 ")

    #print(sentence.speaker)
    #print(sentence.sentence)

for idx, sentence in enumerate(sentences):

    print("\nSentence: " + str(idx))
    print("\nSpeaker: " + sentence.speaker)
    #print("\nEncoding: " + sentence.sentence)
    print("\nOS: " + str(sentence.OS))
    print("\nSS: " + str(sentence.SS))


