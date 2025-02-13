# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "71f82628-c0bc-4179-8e2a-39c9584290cf",
# META       "default_lakehouse_name": "Fabrice_test",
# META       "default_lakehouse_workspace_id": "0733d2c6-8f5b-42b6-abda-70d9990bc791",
# META       "known_lakehouses": [
# META         {
# META           "id": "71f82628-c0bc-4179-8e2a-39c9584290cf"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

from pyspark.sql import SparkSession
from delta import *

# Initialiser Spark avec le support Delta
spark = SparkSession.builder \
    .appName("CSV to Delta") \
    .config("spark.jars.packages", "io.delta:delta-core_2.12:2.4.0") \
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
    .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
    .getOrCreate()

# Lire le fichier CSV
df = spark.read.option("header", "true").csv("Files/Raw/customer.csv")

# Renommer les colonnes pour enlever les espaces et caractères spéciaux
new_columns = [col.strip().replace(" ", "_") for col in df.columns]
df = df.toDF(*new_columns)

# Définir le chemin où sauvegarder la table Delta
delta_path = "Table/customer"

# Sauvegarder en format Delta
df.write.format("delta").mode("overwrite").save(delta_path)

# Afficher un message de confirmation
print(f"Table Delta créée avec succès dans : {delta_path}")

# Arrêter la session Spark
spark.stop()

# Created/Modified files during execution:
print("Table/customer/")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
