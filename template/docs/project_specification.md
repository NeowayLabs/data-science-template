# Project specification - [`<@project>`]
> This document contains a data-science oriented description of the project. It orients the data science project towards data and technology. It serves the purposes of

* outlining a solution,
* defining the scope of the project,
* defining measurable success metrics,
* defining interfaces to the production environment,
* gathering information regarding relevant datasets and features to the problem,
* upstream communication and agreement on requisites.


## Checklist
> Mark which tasks have been performed.

- [ ] **Summary**: all major specs are defined including success criteria, scope, etc.
- [ ] **Output specification**: the output format, metadata and indexation have been defined and agreed upon.
- [ ] **Solution architecture**: a viable and minimal architecture for the final solution has been provided and agreed upon.
- [ ] **Limitations and risks**: a list with the main limitations and risks associated to the project has been provided.
- [ ] **Related resources**: lists with related datasets, features and past projects have been given.
- [ ] **Peer-review**: you discussed and brainstormed with colleagues the outlined specifications.
- [ ] **Acceptance**: these specifications have been accepted by the Data and Product directors. State names and date.

## Summary
> The table below summarizes the key requirements for the project.

| problem type              | target population | entity | N_target | min_coverage | N_labeled | sucess_metrics | updt_freq |
|---------------------------|-------------------|--------|----------|--------------|-----------|----------------|-----------|
| multilabel classification | restaurants       | CNPJ   | 30M      | 80%          | NA        | NA             | monthly   |


### Objective
> Provide a short (max 3-line) description  of the project's objective.

"This project aims at developing a model to automatically determine the type of cuisine of a establishment."

### Target population
> More detailed description of the population to which the model should apply. Include any relevant characteristics.

| Entity | Region | Type        | Size | Status | Sector   | N_target |
|--------|--------|-------------|------|--------|----------|----------|
| CNPJ   | Brasil | restaurants | any  | active | services | 30M      |


#### Subsetting
> Also provide a list of sub-setting variables and how they related to the target population.

| Subsetting variable  | Selection rule                               |
|----------------------|----------------------------------------------|
| `cd_ramo_atividade`  | belongs to ['5611201', '5611202', '5611202'] |
| `situacao_cadastral` | 'Ativa'                                      |

### Output specification
> Describe how the output of the model will be delivered, including its domain and metadata.

The model outputs a list of strings from the list `output_set`
```python
output_set = ['','pizza','mexicano','bar','churrascaria']
output_example1 = [''] # none
output_example2 = ['pizza','churrascaria']
```

#### Metadata
> Your model's metada should be provided in a machine-readable format (e.g. a json file) and include the following items:

* a brief description: this model predicts the type of a restaurant cuisine
* a measure of accuracy applicable for use of the model in other setups (if applicable): standard deviation, accuracy, error matrix.
* model version
* author
* date created
* link to training data

### Problem type
> Describe to which Data Science problem type(s) this project relates to with a brief motivation.

"Since the objective is to assign one or more labels to an entity, this problem is a multi-label classification. It is also unsupervised since no observed data is available."

## Solution architecture [Should this be here? Shouldn't we define a common archtecture?]
> This section describes the architecture of your solution. It should clarify:

* how and where from your model will consume data,
* how and where to your model will generate predictions,
* interaction with a scheduler, API or application,
* interaction with a model managing system.

Provide a schematic describing how your model will consume data, evaluate the model's output and deliver it to the application. You can use [Lucidchart](https://www.lucidchart.com) for the drawings.

### Limitations and risks
> Provide a list with the main limitations and the associated risks for this project. (lile are supposed to be a well-educated guess)

| Limitation                              | Likelihood | Loss                               | Contingency                        |
|-----------------------------------------|------------|------------------------------------|------------------------------------|
| Nonexistence of observed data           | 100%       | not possible to validate the model | Create a data partnership with VR. |
| High false positives rate for `m_regex` | 30%        | lack of quality and trust          | Fine tuning of filters.            |


### Indexing [OPTIONAL - fill this up if it does not follow conventional pipeline]
> Describe how your model's outputs will be indexed in the application. Provide any details that affect how the model should produce its outputs.

## Related resources [OPTIONAL]
> Short listing of related datasets and some specifications.

### Related and observed datasets [OPTIONAL - may not apply]
> List any related and observed datasets that can be used for your project.

| table name                | observed? | description                                             | Why relevant                                            | Update frequency |
|---------------------------|-----------|---------------------------------------------------------|---------------------------------------------------------|------------------|
| data_science_sp.vr_ticket | yes       | contains 8M payouts made at VR-accepting establishments | Can be used to validate model                           | once             |
| data_science.geo          | no        | contains features of a given region                     | can help create geolocalization features to the problem | yearly           |


### Data partners [OPTIONAL - may not apply]
> State the datasets available from data partnerships, including a description of restrictions that may apply.

| partner | N  | label? | schema                                  | restrictions | terms | responsible     |
|---------|----|--------|-----------------------------------------|--------------|-------|-----------------|
| VR      | 1M | yes    | `data_science_sp.vr_transacoes_consumo` | none         | link  | @luana.grandino |


## Additional resources [OPTIONAL]
> Provide links to additional documentation and presentations regarding your project specification.
