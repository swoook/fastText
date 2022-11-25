# Example: Metrics

- This example shows how to evaluate the fastText model for a given task appropriately
- fastText supports `test`, which evaluate Precision@k, Recall@k (P@k, R@k)
- P@k and R@k are suitable for multi-label classification
- If we are dealing with single-label classification, we must implement appropriate metric and evaluation ourselves

## System envrionments

| system | version |
| --- | --- |
| Ubuntu | 18.04 LTS |
| Docker | 20.10.14 |

## Multi-label classification

- fastText support `test`, which evaluate Precision@k, Recall@k (P@k, R@k)
- $P@k$ is:

![equation](./imgs/equation_1.svg)


- P@k and R@k are suitable for multi-label classification
- So, we can use `test` without any consideration if we are dealing with multi-label classification
- However, it's not appropriate for single-label classification
- E.g., In binary classification, P@k and R@k are the same as accuracy

## Single-label classification

### Long-tail

- It's more appropriate to use f-score or average precision rather than accuracy if the dataset is highly imbalanced
- `sklearn` supports many features to evaluate the metrics
- E.g., `precision_recall_curve`, `fbeta_score`, `average_precision_score`, ... from `sklearn.metrics`
