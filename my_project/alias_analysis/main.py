from alias_analysis.alias_analysis import process_glove_models, view_results
import pandas as pd
import os

# Paths to directories
dict_path = os.path.join(os.getcwd(), "alias_analysis/pickle-dicts/")
results_path = os.path.join(os.getcwd(), "alias_analysis/results/")

# Load your 60K records DataFrame
df = pd.read_csv("data/60k_records.csv")  # Update this path to your actual file

# Extract and process names
names = df['name'].str.split().str[-1].str.lower().unique()  # Extract last names and make them lowercase

# Process GloVe models
process_glove_models(names, dict_path, results_path)

# View results for sample names
sample_names = ['beth', 'stephen', 'andrew', 'john', 'jennifer']
view_results(sample_names, results_path)
