### Setup
- Run `docker-compose up -d` to bring up the spark cluster and jupyter server
- Navigate to http://localhost:8888 in your browser to find jupyter
- Follow sample notebooks to get started and connect to the Spark cluster with Pyspark
- If you want to use additional local data (e.g CSVs, JSON, etc), drop the files in the data folder (this folder is bind-mounted to all containers at /data inside the container)

### Tips & Tricks
- If you don't care about using Spark in "clustered" mode and prefer to just use  single-local-node Spark, simply remove the '.master("spark://spark:7077")' from SparkSession.builder options (omitting a .master() call defaults to single-local-node).  Unless you are actually running the Spark cluster across multiple physical or virtual servers, single-local-node Spark will execute faster than clustered mode.
- The number of spark workers can be scaled up or down with `docker-compose up -d --scale spark-worker=<n_workers>` e.g. `docker-compose up -d --scale spark-worker=3`

# Todo

- [ ] Integrate Delta lake and create example notebook
- [ ] Update Minio Config to Connect to Spark/Delta Lake