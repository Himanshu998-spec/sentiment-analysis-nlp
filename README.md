# Sentiment Analysis \& Mental Health Text Classification

## Project Overview

This is an end-to-end NLP and Data Analytics project that analyzes text statements and classifies them into multiple mental-health-related categories.

The project combines Python, Natural Language Processing (NLP), Machine Learning, SQL Server, and Tableau.

> Although the project is referred to as "Sentiment Analysis", the dataset contains multiple classification categories rather than only positive/negative sentiment classes.

## Objectives

* Clean and preprocess unstructured text data.
* Perform exploratory data analysis.
* Engineer text-based features.
* Apply NLP preprocessing techniques.
* Convert text into numerical features using TF-IDF.
* Train and compare machine-learning classification models.
* Analyze the cleaned data using SQL Server.
* Build interactive Tableau visualizations and dashboards.
* Demonstrate an end-to-end data analytics workflow.

## Dataset

The project uses `Combined Data.csv`.

* Original records: 53,044
* Records after removing missing statements: 52,681
* Text column: `statement`
* Target column: `status`

### Categories

* Normal
* Depression
* Suicidal
* Anxiety
* Bipolar
* Stress
* Personality disorder

## Project Workflow

```text
Raw Dataset
    ↓
Data Cleaning
    ↓
Exploratory Data Analysis
    ↓
Feature Engineering
    ↓
NLP Text Preprocessing
    ↓
TF-IDF Vectorization
    ↓
Train/Test Split
    ↓
Machine Learning
    ↓
Model Evaluation
    ↓
SQL Server Analysis
    ↓
Tableau Dashboard
```

## Python \& NLP

### Data Cleaning

* Removed the unnecessary `Unnamed: 0` column.
* Identified missing values.
* Removed rows with missing `statement` values.
* Reset the DataFrame index.

### Feature Engineering

The following features were created:

|Feature|Description|
|-|-|
|`character\_count`|Number of characters in a statement|
|`word\_count`|Number of words in a statement|
|`sentence\_count`|Estimated number of sentences|
|`cleaned\_statement`|Preprocessed text|

### NLP Preprocessing

The text preprocessing workflow includes:

* Lowercasing
* URL removal
* Removal of unwanted characters and numbers
* Whitespace normalization
* Stop-word removal
* Word lemmatization

## TF-IDF

TF-IDF was used to convert the cleaned text into numerical features.

Configuration:

* Maximum features: 10,000
* N-gram range: (1, 2)
* Minimum document frequency: 2
* Maximum document frequency: 0.95

## Machine Learning

The dataset was divided into training and testing sets using a stratified train-test split.

### Logistic Regression

Configuration:

* `max\_iter=1000`
* `class\_weight="balanced"`
* `random\_state=42`

### Linear Support Vector Machine

`LinearSVC` was also used with:

* `class\_weight="balanced"`
* `random\_state=42`

### Evaluation Metrics

Models were evaluated using:

* Accuracy
* Precision
* Recall
* F1-score
* Classification report

The notebook also includes analysis of important TF-IDF terms for different categories.

## SQL Server

The cleaned dataset was stored in Microsoft SQL Server.

### Database

`SentimentAnalysisDB`

### Table

`SentimentData`

### Table Structure

|Column|Description|
|-|-|
|`ID`|Auto-generated unique identifier|
|`statement`|Original statement|
|`cleaned\_statement`|Preprocessed statement|
|`status`|Classification category|
|`character\_count`|Character count|
|`word\_count`|Word count|
|`sentence\_count`|Sentence count|

### SQL Analysis

SQL was used for:

* Category distribution
* Percentage distribution
* Average word count by status
* Average character count by status
* Average sentence count by status
* Longest statements
* Overall text statistics
* Text-length categorization
* Summary analysis by status

### Text Length Categories

|Category|Condition|
|-|-|
|Short|Less than 50 words|
|Medium|50–150 words|
|Long|More than 150 words|

## Tableau Dashboard



\[Mental Health Text Classification Dashboard](TabLeauDasboard.png)



The Tableau workbook contains visualizations including:

* Statements by Status
* Status Distribution
* Average Word Count by Status
* Average Character Count by Status
* Text Length Distribution
* Status vs. Text Length Category
* Word Count Distribution
* Sentence Count vs Word Count

Interactive filtering is included for exploring the categories.

## Key Dataset Insights

After cleaning, the dataset contains **52,681 statements**.

|Status|Records|Percentage|
|-|-:|-:|
|Normal|16,343|31.02%|
|Depression|15,404|29.24%|
|Suicidal|10,652|20.22%|
|Anxiety|3,841|7.29%|
|Bipolar|2,777|5.27%|
|Stress|2,587|4.91%|
|Personality disorder|1,077|2.04%|

### Overall Text Statistics

* Average character count: 578.71
* Average word count: 113.16
* Average sentence count: 7.74

## Technologies Used

* Python
* Pandas
* NumPy
* NLTK
* Scikit-learn
* Matplotlib
* Seaborn
* Jupyter Notebook
* SQL
* Microsoft SQL Server
* Tableau

## Project Structure

```text
Sentiment\_Analysis\_Project/
│
├── Combined Data.csv
├── Sentiment\_Analysis\_Cleaned.csv
├── Sentiment\_Analysis\_NLP.ipynb
├── SQLQuery2.sql
├── Book1.twb
└── README.md
```

### File Description

* `Combined Data.csv` — source dataset.
* `Sentiment\_Analysis\_NLP.ipynb` — Python, NLP, EDA, TF-IDF, machine learning, and model evaluation.
* `Sentiment\_Analysis\_Cleaned.csv` — cleaned and feature-engineered dataset.
* `SQLQuery2.sql` — SQL Server database and analytical queries.
* `Book1.twb` — Tableau workbook containing visualizations and dashboard.
* `README.md` — project documentation.

## Learning Outcomes

* Data cleaning and preprocessing
* Exploratory Data Analysis
* Natural Language Processing
* Text feature engineering
* TF-IDF vectorization
* Machine-learning classification
* Model evaluation
* SQL Server analysis
* Tableau dashboard development
* Data visualization
* Working with unstructured text data
* End-to-end data analytics

## Conclusion

This project demonstrates an end-to-end workflow for working with unstructured text data, starting from data cleaning and NLP preprocessing through machine-learning classification, SQL analysis, and interactive Tableau visualization.

It demonstrates practical skills in **Data Analytics, NLP, Machine Learning, SQL, and Data Visualization**.

## Author

**Himanshu Kumar Gupta**

MCA | Data Analyst Aspirant

Skills: Python | SQL | Tableau | Power BI | Data Analytics | Machine Learning | NLP

