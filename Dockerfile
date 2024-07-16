# Use the official Jupyter Docker image
FROM jupyter/base-notebook:latest

# Switch to root user
USER root

# Create a directory for the notebooks and data
RUN mkdir -p /home/jovyan/work

# Copy your Jupyter notebooks and data into the container
COPY augmented_data_with_errors.csv /home/jovyan/work/
COPY Generated_Data.csv /home/jovyan/work/
COPY NN.ipynb /home/jovyan/work/
COPY Data_Generation.ipynb /home/jovyan/work/

# Switch back to jovyan user
USER jovyan

# Install any necessary packages
RUN pip install --no-cache-dir numpy pandas matplotlib seaborn scipy gensim nltk

# Verify the files are copied
RUN ls -l /home/jovyan/work

# Expose the port Jupyter Notebook runs on
EXPOSE 8888

# # Set environment variable to avoid token issues
# ENV JUPYTER_TOKEN=my_token

# Start the Jupyter Notebook server
CMD ["start-notebook.sh"]

# , "--NotebookApp.token=my_token"]
