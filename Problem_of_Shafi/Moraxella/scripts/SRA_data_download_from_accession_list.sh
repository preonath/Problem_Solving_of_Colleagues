# From Bioproject Id: 
esearch -db sra -query PRJNA1032872 | efetch -format runinfo > runinfo.csv
cat runinfo.csv | cut -f 1 -d ',' | grep SRR | head > ids.txt

a=$(cat ids.txt)
for sra in $a 
do
  echo "Started Download "${sra}""
  fastq-dump --split-files --outdir data --gzip "${sra}"
  echo "Download Complete "${sra}""
done



#!/bin/bash

# Define the file containing the BioProject IDs
bioproject_file="bioid.txt"

# Loop through each line in the file
while IFS= read -r bioproject_id
do
    # Use esearch and efetch to download the run information for the current BioProject ID
    esearch -db sra -query "$bioproject_id" | efetch -format runinfo > "runinfo_$bioproject_id.csv"
    
    # Extract the first column (assumed to be run IDs), filter for lines starting with SRR, and take the first 10
    cat "runinfo_$bioproject_id.csv" | cut -f 1 -d ',' | grep '^SRR' | head > "ids_$bioproject_id.txt"
    
    echo "Processed $bioproject_id"
done < "$bioproject_file"

echo "All BioProject IDs have been processed."

