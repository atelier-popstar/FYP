from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

model = SentenceTransformer('bert-base-nli-mean-tokens')
input_file = "C:/Users/ttye7/Desktop/4th Year/FYP Auxiliary/transcripts/Transcripts_Clean/q1ec1.txt"

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
    if idx != 0:
        tmpspkr = sentence.speaker
        tmpidx = idx - 1

        if sentences[tmpidx].speaker == tmpspkr:
            sentence.SS = cosine_similarity(sentence.vector, sentences[tmpidx].vector)
            tmpidx = tmpidx - 1
            if tmpidx < 0:
                while sentences[tmpidx].speaker == tmpspkr & tmpidx != 0:
                    tmpidx = tmpidx - 1
                
                if sentences[tmpidx].speaker != tmpspkr:
                    sentence.OS = cosine_similarity(sentence.vector, sentences[tmpidx].vector)

        elif sentences[tmpidx].speaker != tmpspkr:
            sentence.OS = cosine_similarity(sentence.vector, sentences[tmpidx].vector)
            tmpidx = tmpidx - 1
            if tmpidx < 0:
                while sentences[tmpidx].speaker != tmpspkr & tmpidx != 0:
                    tmpidx = tmpidx - 1
                
                if sentences[tmpidx].speaker == tmpspkr:
                    sentence.SS = cosine_similarity(sentence.vector, sentences[tmpidx].vector)
        
        #while (sentences[tmpidx].speaker != tmpspkr & tmpidx != 0):

    #print(sentence.speaker)
    #print(sentence.sentence)



