#!/bin/bash
# writen: Preonath


rawpath="/home/asus/Desktop/CHRF_Project/Problem_Solving_of_Colleagues_and_thesis_students/Problems_of_Esha/resfinder_result_summarization"
echo "Sample_Id,Resistance gene,Phenotype" > summarize_result.csv
for files in "$rawpath"/*_resfinder
do
    name=$(basename "$files" | sed 's/_resfinder$//')
    echo "$name"
    awk -v name="$name" 'BEGIN {FS="\t"; OFS=","} 
    NR==1 {next}  # Skip the header line of the file
    NR==2 {print name, $1, $8} 
    NR>2  {print "", $1,$8}' "$files/ResFinder_results_tab.txt" >> summarize_result.csv    
done
