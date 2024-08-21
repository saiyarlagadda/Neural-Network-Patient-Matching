# Table of content
---
 ### 1. Data Creation
 ### 2. Data Generate
 ### 3. Glove Embedding of Names
 ### 4. Chars2vec
 ### 5. Similarity Search
 ### 6. Similarity Search using Faiss (Facebook AI Similarity Search) 
 ### 7. Dockerizing Project

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

The Noteboook for Generate Data is [here](/Data_Generation.ipynb/)

### 3. Glove Embedding the Names 
---
We vectorise the names of patients using glove embeddings.

First, we take each name field of data then use [nameparser](https://pypi.org/project/nameparser/) to fetch first name and last name seperately.
secondly, each part of are then vectorised into their respective glove embeddings and stored.
Then, these embedding are then concatinated together.Therby, creating a combined glove embedding vector.

Here is the test that i have conducted to check the code.
![The code for vectorizing and concating the names](/asserts/Picture3.png)

A code was deployed to check the top20 similar names to unique and actual records to that of 60k generated error names.
Results were promising. the simislr names are in same or closer space when checked with cosine similarity.

The Output of the Glove embedding the names:
![Checking the Cosine similarities of Names](/asserts/Picture4.png)

OPTIONAL: In case you want to run the glove embedding generate code [Download Glove files](https://nlp.stanford.edu/data/glove.6B.zip) and place at  home directory.

The Notebook for Glove embedding is [here](/NN.ipynb/)

### 4. Chars2vec
---
chars2vec is a pre-trained model, we utilise it to convert the records in respective vectors.

We take each field of patient record and convert into respective embedding using chars2vec, then we store them.
The store vector records of each patient are then fetched into code and stacked, therby creating a multi-dimensional vector of patient record.

Here is detailed documentation of char2vec [Github](https://github.com/IntuitionEngineeringTeam/chars2vec).

Here is the code for vectors generation[Link](/NN.ipynb/) .

The vector data is stored into csv format. Checkhere for [vector dataset](/char2vec_60k.csv).

Here is the code snippet that i have used to vectorise code.
![The code for vectorizing and concating the patient records](/asserts/vector.png)

The entire vector data after stacking is stored in [Char2vect_stacked_60k](/char2vec_stacked_60k.csv). 

### 5. Similarity Search
---
The similarity Search was performed on varoius version of code:
1. A query name is used and  similarity serach is performed on stacked vectors using cosine similarity. The results obtained are not favorable.
![](/asserts/Picture7.png)
2. The similarity Search is performed by the adding the threshold. On adjusting the threshold there is no possibility of finding the proper needed results.
![](/asserts/Picture8.png)
3. Similarity search based on Name using cosine similarity with threshold provide accuracte results.
![](/asserts/Picture9.png)

### 6. Similarity Search using FAISS
---
1. Similarity search using Fiass on stacked vector. The results are no were near the accurate.
![](/asserts/Picture10.png)

2. Similarity Search using Faiss on stacked vector with Threshold and ditance calculation. No accurate Results obtained
![](/asserts/Picture11.png)

### 7. Docker the project
---

The project along with jupyter notebook as dockerize and placed in docker file.

Working of Docker Container.
![Docker desktop console to validate the working of Docker image](/asserts//Picture5.png)

The Docker image of project is [here](/Dockerfile)

