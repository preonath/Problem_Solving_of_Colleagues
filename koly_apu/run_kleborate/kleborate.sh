
path="/home/asus/Desktop/CHRF_Project/Problem_Solving_of_Colleagues_and_thesis_students/koly_apu/run_kleborate"


for dir in $path/*
do 
	name=`basename $dir`
	echo $name
	mkdir -p $dir/9_Kleborate/
	kleborate -a $dir/3_Unicycler\/*.fasta -o $dir/9_Kleborate\/$name\_kleb.txt --all
	#cut -f 1,2,3 $dir/9_Kleborate\/$name\_kleb.txt
done
