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
