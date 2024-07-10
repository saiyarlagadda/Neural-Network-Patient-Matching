# Use the official Jupyter Docker image
FROM jupyter/base-notebook:latest


# # Install gcc for compiling Python packages
# USER root
# RUN apt-get update && apt-get install -y gcc

# # Switch back to jovyan user
# USER jovyan

# Install any necessary packages
RUN pip install --no-cache-dir numpy pandas matplotlib seaborn scipy gensim nltk

# Copy your Jupyter notebooks into the container
COPY augmented_data_with_errors.csv /
COPY Generated_Data.csv /
COPY NN.ipynb /
COPY Data_Generation.ipynb /

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# Start the Jupyter Notebook server
CMD ["start-notebook.sh"]
