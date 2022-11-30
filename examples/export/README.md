# Example: Exporting

- This example shows how to export a fastText model to other frameworks

## System envrionments

| system | version |
| --- | --- |
| Ubuntu | 18.04 LTS |
| Docker | 20.10.14 |

- We can reproduce the environments easily by using the `Dockerfile` in this directory

## MeCab

- Recall that it’s more appropriate to tokenize Korean corpus based on morphemes to reflect the meaning because Korean belongs to an agglutinative language
- That's why we don't simply pass the document to the fastText model
- Instead, we tokenize it based on morphemes and pass the tokens to the model

## Gensim

- Gensim is a Python library for some NLP tasks including topic modelling, document indexing and similarity retrieval 
- Gensim supports `get_sentence_vector`, which is equivalent to `get_sentence_vector` in the fastText
- Be aware `get_sentence_vector` normalizes each word vector before taking a mean by default

## PyTorch

- Recall that
> - Be aware `get_sentence_vector` normalizes each word vector before taking a mean by default
- So we need to normalize `embeddings` before taking the mean to reproduce a result
- [ ] Implement a character N-gram
    - `torchtext`
    - https://github.com/facebookresearch/fastText/issues/1062#issuecomment-627830841
    - https://github.com/pytorch/text/issues/539#issuecomment-497560002