from pyspark import SparkContext
from pyspark.sql import SQLContext

JSON_INPUT     = "s3a://venmo-json/*/*"
PARQUET_OUTPUT = "s3a://venmo-parquet/data.parquet"

sc = SparkContext()
sc._jsc.hadoopConfiguration()\
       .set("mapreduce.fileoutputcommitter.algorithm.version", "2")
sqlCtx = SQLContext(sc)

try:
    schema = sqlCtx.read.parquet(PARQUET_OUTPUT).schema
except:
    schema = None

sqlCtx.read.json(JSON_INPUT, schema=schema)\
           .write.mode("overwrite")\
           .parquet(PARQUET_OUTPUT)

total_cnt = sqlCtx.read.parquet(PARQUET_OUTPUT).count()
print("Total number of public transactions: {}".format(total_cnt))
