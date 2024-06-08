rawpath="/home/asus/Desktop/CHRF_Project/Problem_Solving_of_Colleagues_and_thesis_students/Problem_of_Himadri/PADLOC_result"
header="ERR"

# Create or overwrite the output file with the header
echo "Sample_Id,system.number,system,protein.name" > Padloc_summarization.csv

for files in "$rawpath"/$header*
do
    name=$(basename "$files")
    # Append the data to the output file
    awk -v name="$name" 'BEGIN {FS=","; OFS=","} 
    NR==1 {next}  # Skip the header line of the file
    NR==2 {print name, $1, $3, $7}  # Print the sample ID for the first data line
    NR>2  {print "", $1, $3, $7}' "$files/Padloc/${name}_contigs_padloc.csv" >> Padloc_summarization.csv
    
done

