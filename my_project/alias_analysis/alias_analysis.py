import os
from scipy import spatial
import pickle
import pandas as pd

# Paths to directories
dict_path = os.path.join(os.getcwd(), "alias_analysis/pickle-dicts/")
results_path = os.path.join(os.getcwd(), "alias_analysis/results/")

# Function to find closest embeddings
def find_closest_embeddings(embedding, embeddings_dict):
    return sorted(embeddings_dict.keys(), key=lambda word: spatial.distance.euclidean(embeddings_dict[word], embedding))[1:6]

# Process each GloVe model and find aliases
def process_glove_models(names, dict_path, results_path):
    dicts = os.listdir(dict_path)
    results = [i.replace('.pkl', ".csv") for i in dicts]
    
    for d in dicts:
        with open(os.path.join(dict_path, d), "rb") as file:
            temp_d = pickle.load(file)
            csv_dict = {}
            for name in names:
                try:
                    csv_dict[name] = find_closest_embeddings(temp_d[name], embeddings_dict=temp_d)
                except KeyError:
                    pass
            df = pd.DataFrame.from_dict(csv_dict, orient='index')
            df.to_csv(os.path.join(results_path, d.replace('.pkl', '.csv')))

# View results
def view_results(sample_names, results_path):
    csv_results = os.listdir(results_path)
    for csv in csv_results:
        df = pd.read_csv(os.path.join(results_path, csv), index_col=0)
        print(csv, '\n')
        for name in sample_names:
            if name in df.index:
                print(f"{name}: {df.loc[name].values}")
        print('\n\n')

if __name__ == "__main__":
    # Load your 60K records DataFrame
    df = pd.read_csv("data/60k_records.csv")  # Update this path to your actual file
    
    # Extract and process names
    names = df['name'].str.split().str[-1].str.lower().unique()  # Extract last names and make them lowercase

    # Process GloVe models
    process_glove_models(names, dict_path, results_path)

    # View results for sample names
    sample_names = ['beth', 'stephen', 'andrew', 'john', 'jennifer']
    view_results(sample_names, results_path)
