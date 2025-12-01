import pandas as pd

# Load sample data
df = pd.read_csv("input.csv")

# Basic cleanup
df.columns = df.columns.str.lower().str.strip()

# Remove duplicates
df = df.drop_duplicates()

# Handle null values
df = df.fillna("N/A")

# Standardize date format if exists
if "date" in df.columns:
    df["date"] = pd.to_datetime(df["date"], errors="coerce")

# Save cleaned data
df.to_csv("output_clean.csv", index=False)

print("Data cleaned and exported successfully.")
