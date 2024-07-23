# Use the official Jupyter Docker image
FROM jupyter/base-notebook:latest

# Switch to root user
USER root

# Install necessary system dependencies
# RUN apt-get update && apt-get install -y \
#     libhdf5-dev \
#     libhdf5-serial-dev \
#     hdf5-tools \
#     pkg-config

RUN apt-get update && apt-get install -y \
    libhdf5-dev \
    pkg-config \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the notebooks and data
# RUN mkdir -p /home/jovyan/work

RUN mkdir -p /home/jovyan/work && chown -R jovyan:users /home/jovyan/work


# Copy your Jupyter notebooks and data into the container
# COPY augmented_data_with_errors.csv /home/jovyan/work/
# COPY Generated_Data.csv /home/jovyan/work/
# COPY NN.ipynb /home/jovyan/work/
# COPY Data_Generation.ipynb /home/jovyan/work/

COPY --chown=jovyan:users augmented_data_with_errors.csv /home/jovyan/work/
COPY --chown=jovyan:users Generated_Data.csv /home/jovyan/work/
COPY --chown=jovyan:users NN.ipynb /home/jovyan/work/
COPY --chown=jovyan:users Data_Generation.ipynb /home/jovyan/work/

# Giving permission to read & write to ipynb files
RUN chmod u+rw /home/jovyan/work/*.ipynb


# Switch back to jovyan user
USER jovyan

# Install any necessary packages
RUN pip install h5py
RUN pip install --no-cache-dir numpy pandas matplotlib seaborn scipy gensim nltk tensorflow keras chars2vec
# RUN pip install --no-cache-dir \
#     numpy \
#     pandas \
#     matplotlib \
#     seaborn \
#     scipy \
#     gensim \
#     nltk \
#     keras \
#     chars2vec \
#     h5py==2.9.0

# Verify the files are copied
RUN ls -l /home/jovyan/work

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# # Set environment variable to avoid token issues
# ENV JUPYTER_TOKEN=my_token

# Start the Jupyter Notebook server
CMD ["start-notebook.sh"]

# , "--NotebookApp.token=my_token"]
