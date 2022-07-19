import os
import csv
from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

model = SentenceTransformer('all-MiniLM-L12-v2')

def cos_sim(vec1, vec2):
    sim = cosine_similarity(vec1.reshape(1, -1), 
    vec2.reshape(1, -1))

    return sim[0, 0]

def encode_similarity(sentences):
    #calculate vector embeddings & compute SS & OS
    #mostly just error handling for cases i=0,1,2,3 where 
    # OS & SS values are not necessarily applicable
    for idx, sentence in enumerate(sentences):
        sentence.vector = model.encode(sentence.sentence)
        if idx != 0:
            tmpspkr = sentence.speaker
            tmpidx = idx - 1

            if sentences[tmpidx].speaker == tmpspkr:
                sentence.SS = cos_sim(sentence.vector, 
                sentences[tmpidx].vector)

                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker == tmpspkr 
                    and tmpidx > 0:

                        tmpidx = tmpidx - 1

                    if sentences[tmpidx].speaker != tmpspkr:
                        sentence.OS = cos_sim(sentence.vector, 
                        sentences[tmpidx].vector)

            elif sentences[tmpidx].speaker != tmpspkr:

                sentence.OS = cos_sim(sentence.vector, 
                sentences[tmpidx].vector)

                tmpidx = tmpidx - 1
                if tmpidx >= 0:
                    while sentences[tmpidx].speaker != tmpspkr 
                    and tmpidx > 0:

                        tmpidx = tmpidx - 1
                
                    if sentences[tmpidx].speaker == tmpspkr:
                        sentence.SS = cos_sim(sentence.vector, 
                        sentences[tmpidx].vector)

def results_to_csv(sentences, outputpath):
    #output master list of sentence objects to csv
    with open(outputpath + '/results_MiniLM_L12.csv', 'w', 
    newline='',) as csvfile:

        writer = csv.writer(csvfile)
        writer.writerow(['Global Index', 'Local Index', 
        'Speaker', 'Familiar', 'Eye Contact', 'Dev Scores', 
        'Reality', 'OS', 'SS'])

        for sentence in sentences:
            writer.writerow([sentence.global_index, 
            sentence.local_index, sentence.speaker, 
            sentence.familiar, sentence.eyecon, sentence.devscore, 
            sentence.reality, sentence.OS, sentence.SS])