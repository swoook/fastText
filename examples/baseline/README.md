# Example: Baseline

- This example shows how to fine-tune a pretrained fastText to NMSC dataset

## Prerequisites

1. [pretrained fastText files](https://ratsgo.github.io/embedding/downloaddata.html)
    - Make sure you have placed the files in proper directory
    - By default, the `notebook.ipynb` assumes they are in `./tmp`

## System envrionments

| system | version |
| --- | --- |
| Ubuntu | 18.04 LTS |
| Docker | 20.10.14 |

## Motivation: Why I choose fastText for Korean NLP tasks

- Korean belongs to an agglutinative language
- E.g., 나는, 나를, 나의, 나로, 나에게, 나한테, 나처럼, 나와, 나랑, ...
- This makes Korean a morphologically rich language
- If we simply tokenize Korean based on spacing, it's difficult to reflect the meaning of such vocabulary
- However, fastText learns subword (character N-gram) embeddings, so it's robust to morphologically rich language including Korean, Tuirkish, Finnish, ... 
- E.g., How fastText learns the embedding of `한국종합주가지수`
- First, It splits the word `한국종합주가지수` into multiple character N-grams like below:
``` 
['<한국',
  '<한국종',
  '<한국종합',
  '<한국종합주',
  '한국종',
  '한국종합',
  '한국종합주',
  '한국종합주가',
  '국종합',
  '국종합주',
  '국종합주가',
  '국종합주가지',
  '종합주',
  '종합주가',
  '종합주가지',
  '종합주가지수',
  '합주가',
  '합주가지',
  '합주가지수',
  '합주가지수>',
  '주가지',
  '주가지수',
  '주가지수>',
  '가지수',
  '가지수>',
  '지수>'],
```
- And it learns the embedding of each character N-gram
- Now the average of these embeddings is a embedding of `한국종합주가지수`

## Morpheme Analysis

- fastText tokenizes based on spacing by default
- But it's difficult to reflect the meaning if we tokenize Korean corpus based on spacing because Korean belongs to an agglutinative language
- So it’s more appropriate to tokenize it based on morphemes if we’re dealing with Korean
- E.g., AP(val) w/ MeCab is 0.92 and w/o is 0.87

## Named Entity Normalization

- Proper nouns are one of the parts of speech where a lot of new words appears
- E.g., person name, movie title, ...
- That's why I implemented `normalize_person_names`
- However, there is a lot of words with strong ambiguity in the person name dictionary provided by default in MeCab
- So it may be more appropriate to remove the default person name dictionary and build a new one yourself in terms of disambiguation if you can obtain a list of people names
- E.g., f1(val) w/ NEN is 0.850 and w/o is 0.852 

## Metrics

- fastText support `test`, which evaluate Precision@k, Recall@k (P@k, R@k)
- P@k and R@k are suitable for multi-label classification
- If we are dealing with single-label classification, we must choose the appropriate metric ourselves
- That's why I used `precision_recall_curve` and `fbeta_score` from `sklearn.metrics`
