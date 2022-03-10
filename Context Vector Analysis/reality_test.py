from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity

model = SentenceTransformer('bert-base-nli-mean-tokens')

sentences = [
    "my wife",
    "my wife",
    "my house",
    "jeff bezos"
]

sentence_embeddings = model.encode(sentences)

results = cosine_similarity(
    [sentence_embeddings[0]],
    sentence_embeddings[1:]
)

print(results)