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

$$ Y = \left { y_{1},\ y_{2},\ ...,\ y_{n} \right } \text{where} \ y_{i} \ \text{is a i-th true label of a data point} $$

$$ \hat{Y} = \left \{ \hat{y}_{1},\ \hat{y}_{2},\ ...,\ \hat{y}_{k} \right \} \text{where} \ y_{j} \ \text{is a j-th predicted label of a data point} $$

$$ P@k = \frac{\# ( Y \cap \hat{Y} ) }{\# \hat{Y}} $$

- P@k and R@k are suitable for multi-label classification
- So, we can use `test` without any consideration if we are dealing with multi-label classification
- However, it's not appropriate for single-label classification
- E.g., In binary classification, P@k and R@k are the same as accuracy