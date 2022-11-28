# Example: Exporting

- This example shows how to export a fastText model to other frameworks

## System envrionments

| system | version |
| --- | --- |
| Ubuntu | 18.04 LTS |
| Docker | 20.10.14 |

- We can reproduce the environments easily by using the `Dockerfile` in this directory

## Gensim

- Gensim is a Python library for some NLP tasks including topic modelling, document indexing and similarity retrieval 
- In this example, we export a fastText model to various frameworks via Gensim
- E.g., fastText -> Gensim -> PyTorch
- Recall that it’s more appropriate to tokenize Korean corpus based on morphemes to reflect the meaning because Korean belongs to an agglutinative language
- That's why we don't simply pass the document to [`get_sentence_vector`](https://github.com/RaRe-Technologies/gensim/blob/ed8122ed3b704496178f79ec7e8c32c35eb9b3fa/gensim/models/fasttext.py#L1132)
- Instead, we tokenize it based on morphemes and pass the tokens to `get_sentence_vector`
- Be aware `get_sentence_vector` normalizes each word vector before taking a mean
