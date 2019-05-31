# Model report - [`<@project>`]
This report should contain all relevant information regarding your model. Someone reading this document should be able to easily understand and reproducible your findings.

## Checklist
Mark which tasks have been performed

- [ ] **Summary**: you have included a description, usage, output,  accuracy and metadata of your model.
- [ ] **Pre-processing**: you have applied pre-processing to your data and this function is reproducible to new datasets.
- [ ] **Feature selection**: you have performed feature selection while modeling.
- [ ] **Modeling dataset creation**: you have well-defined and reproducible code to generate a modeling dataset that reproduces the behavior of the target dataset. This pipeline is also applicable to generate the deploy dataset.
- [ ] **Model selection**: you have chosen a suitable model according to the project specification.
- [ ] **Model validation**: you have validated your model according to the project specification.
- [ ] **Model optimization**: you have defined functions to optimize hyper-parameters and they are reproducible.
- [ ] **Peer-review**: your code and results have been verified by your colleagues and pre-approved by them.
- [ ] **Acceptance**: this model report has been accepted by the Data Science Manager. State name and date.

## Summary
> Provide a description of your model, max 3 lines.

The model classifies the type of cuisine of a restaurant. It is based on regular expressions and rules.

### Usage
> Provide a reproducible pipeline to run your model

1. clone the repository
2. download test dataset from cloud storage (ex.: AWS S3)
3. run the following code on command line

```python
pip install -e .
python -m <@model> on_my_data.csv save_to_my_file.csv
```

### Output
> Provide a technical description of your model's output, including its domain.

The model outputs a list of strings from the list `output_set`
```python
output_set = ['','pizza','mexicano','bar','churrascaria']
output_example1 = [''] #none
output_example2 = ['pizza','churrascaria']
```

#### Metadata
> Your model's metada should be provided in a machine-readable
> format (e.g. a json file) and include the following items:

* a brief description: this model predicts the type of a restaurant
  cuisine
* a measure of accuracy applicable for use of the model in other
  setups (if applicable): standard deviation, accuracy, error matrix.
* model version
* author
* date created
* link to training data

Make sure that the final consumer of your model can make use of your metadata.

#### Coverage

> Describe the population covered by your model in comparison to the
> target population.

### Performance Metrics
Provide any metrics used and their value in tables.

| metric    | `''`   | `'pizza'`   | `'mexicano'`   | `'bar'`   | `'churrascaria'` |
| --------- | ------ | ----------- | -------------- | --------- | ---------------- |
| precision | .98    | .8          | .9             | .95       | .99              |
| recall    | .98    | .8          | .9             | .95       | .99              |

## Pre-processing
> Motivate each pre-processing used in one line.

1. applied log-transform to 'variable': it presented a skewed behavior.
2. normalized output variable: relative order was more relevant for the model.

## Feature selection
> Motivate any feature selection method that has been used and list/link
> the features used in the model.

* feature importance on a boosted tree: out of the 1000 features, 100 were selected.

### Features used
Provide a list or link with a list to all features and raw data that
have been used. Please make notice in case some of these features are
not readily available in the features store

## Modeling
> Describe the type of model used.

A `RandomForestClassifier` from `scikit-learn` was used. This model serves our purpose to perform multi-label classification and has shown satisfactory performance.

### Model selection
> Describe any model selection that has been performed.

Both a `DecisionTreeClassifier` and `RadomForestClassifier` have been used. The `DecisionTree` model was not able to achieve satisfactory predictions for the class `churrascaria`. Therefore we kept the `RandomForestClassifer`. The chosen model is more complex to train and execute but for our application this is not critical.

### Model validation
> Motivate your model validation strategy.

1. The dataset was divided into training and validation (80/20)
2. A stratified sampling was used to reproduce the characteristics of the deploy dataset.
3. A 10-fold strategy was used
4. See the Accuracy section of the model description for the achieved accuracy.

### Model optimization
> Motivate your choice of hyperparameters and report the training results.

* The hyper-parameters `alpha`, `omega`, `beta` were optimized using PSO.

Provide a figure with the training decades if applicable.

## Additional resources
> Provide links to additional documentation and presentations regarding your model.
