# Pyspark, Delta Lake, and Minio

This repository contains a fully functional and self-contained example of a Spark cluster configured to write Delta Lake tables to Minio (S3 Object Storage).
An example Jupyter Notebook is provided in the jupyter/notebooks/ folder to get you started with Pyspark and Delta Lake.
This repository is intended to be a starting point that can be expanded upon to suit your use case.

Follow the setup steps below to get started.

## Setup

**Note: If you ever want to wipe all of your data in Minio (including any Delta Lake tables), you can always run `docker-compose down -v` to remove containers AND volumes for a fresh start.**

- Run `docker-compose up -d` to bring up the spark cluster and jupyter server
- Navigate to http://localhost:8888 in your browser to find jupyter
- Follow sample notebooks to get started and connect to the Spark cluster with Pyspark
- If you want to use additional local data (e.g CSVs, JSON, etc), drop the files in the data folder (this folder is bind-mounted to all containers at /data inside the container)
- You can see the Spark UI at http://localhost:8080
- You can see the Minio UI at http://localhost:9090 (username and password can be found in the docker-compose.yml environment variables for the minio service)

## Tips & Tricks

- If you don't care about using Spark in "clustered" mode and prefer to just use  single-local-node Spark, simply remove the '.master("spark://spark:7077")' from SparkSession.builder options (omitting a .master() call defaults to single-local-node).  Unless you are actually running the Spark cluster across multiple physical or virtual servers, single-local-node Spark will execute faster than clustered mode.
- The number of spark workers can be scaled up or down with `docker-compose up -d --scale spark-worker=<n_workers>` e.g. `docker-compose up -d --scale spark-worker=3`

# Todo

- [x] Integrate Delta lake and create example notebook
- [x] Update Minio Config to Connect to Spark/Delta Lake