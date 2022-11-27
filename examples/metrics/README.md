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

- fastText support `test`, which evaluates Precision@k, Recall@k (P@k, R@k)
- $P@k$ is:

![equation](./imgs/equation_1.svg)


- P@k and R@k are suitable for multi-label classification
- So, we can use `test` without any consideration if we are dealing with multi-label classification
- However, it's not appropriate for single-label classification
- E.g., In binary classification, P@k and R@k are the same as accuracy

## Single-label classification

- It's easy to evaluate various metrics by using `sklearn`
- E.g., `precision_recall_curve`, `fbeta_score`, `average_precision_score`, ... from `sklearn.metrics`
- Refer to [3.3. Metrics and scoring: quantifying the quality of predictions](https://scikit-learn.org/stable/modules/model_evaluation.html) for more details

### Long-tail

- It's more appropriate to evaluate f-score or Average Precision (AP) rather than accuracy if the dataset is highly imbalanced
- See `get_precision_recall_curve` and `get_fbeta_score` showed in the `notebook.ipynb`
- If we evaluate precision-recall curve and its f-scores, we need to find an optimal threshold and its precision, recall, and f-score
- See `get_optimal_threshold` showed in the `notebook.ipynb`

### Multi-class classification

- In the case of multi-class classification, evaluate the AP for each class then we can measure the mean AP (mAP)
- Finding an optimal threshold is the same as before