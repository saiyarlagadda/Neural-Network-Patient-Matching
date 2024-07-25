# Table of content
---
 ### 1. Data Creation
 ### 2. Data Generate
 ### 3. Glove Embedding of Names
 ### 4. Chars2vec
 ### 5. Dockerizing Project

### 0. Run the code
---
**To run the project:**
1. Clone the repo.
2. run docker cmd "docker run -p 8888:8888 nn-notebook".
3. OPTIONAL: In case you want to run the glove embedding generate code [Download Glove files](https://nlp.stanford.edu/data/glove.6B.zip) and place at  home directory.

 ### 1. Data Creation
 ---
 The Data was created using GenerateData [Link](https://generatedata.com)

 A Record of 100 Unique Patients were generated using this website.

This Picture is actual example while taking the generate data.
 ![Picture of Generate Data settings](/asserts/Picture1.png)

Picture of Genaerate Dat while with actual settings.
![With actual settings](/asserts//Picture2.png)

 Dataset: [Generate_Data.csv](/Generated_Data.csv)


 ### 2. Data Generate
 ---
 These 100 unique patients were then multiplied and manupulated with typos to generate 60k records.
 The Typos include:
- Remove a char
- replace a vowel
- reverse char    (ie: turn char into chra)
- Name Alias
- Dates : 
- - two and four digit years
- - no year just month and day

Picture of code that generated the typos and 60k records.
![Picture of code that included the typos and generated 6ok records](/asserts//Picture6.png)

The Noteboook for Generate Data is [here](/Data_Generation.ipynb)

### 3. Glove Embedding the Names 
---
We vectorise the names of patients using glove embeddings.

First, we take each name field of data then use [nameparser](https://pypi.org/project/nameparser/) to fetch first name and last name seperately.
secondly, each part of are then vectorised into their respective glove embeddings and stored.
Then, these embedding are then concatinated together.Therby, creating a combined glove embedding vector.

Here is the test that i have conducted to check the code.
![The code for vectorizing and concating the names](/asserts//Picture3.png)

A code was deployed to check the top20 similar names to unique and actual records to that of 60k generated error names.
Results were promising. the simislr names are in same or closer space when checked with cosine similarity.

The Output of the Glove embedding the names:
![Checking the Cosine similarities of Names](/asserts/Picture4.png)

OPTIONAL: In case you want to run the glove embedding generate code [Download Glove files](https://nlp.stanford.edu/data/glove.6B.zip) and place at  home directory.

The Notebook for Glove embedding is [here](/NN.ipynb/Glove)

### 4. Chars2vec
---
chars2vec is a pre-trained model, we utilise it to convert the records in respective vectors.

Here is detailed documentation of char2vec [Github](https://github.com/IntuitionEngineeringTeam/chars2vec).

Here is the code for vectors generation[Link](/NN.ipynb) 

### 5. Docker the project
---

The project along with jupyter notebook as dockerize and placed in docker file.

Working of Docker Container.
![Docker desktop console to validate the working of Docker image](/asserts//Picture5.png)

The Docker image of project is [here](/Dockerfile)

