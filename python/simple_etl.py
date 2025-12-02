import pandas as pd

# Example simple ETL process

# EXTRACT
df = pd.read_csv("raw_data.csv")

# TRANSFORM
df.columns = df.columns.str.lower()
df = df.drop_duplicates()

# LOAD
df.to_csv("clean_data.csv", index=False)

print("ETL process finished successfully.")
