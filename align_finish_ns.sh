#!/bin/bash

echo -e "\e[105mADVICE: to avoid interferences, use it on a empty folder\e[49m"

read -p "Alignment file: " alin_file

read -p "Reference sequence used for the alignment: " ref_file 
nt_output="$(grep -v ">" $ref_file | wc | awk '{print $3-$1}')" #nt count

echo "Output name (not ended with .fa, recommended: .fasta or .aln):" 
read output_filename

echo -e "\e[105mProcessing $alin_file with a $nt_output nt reference\e[49m"

awk '/^>/ {OUT=substr($0,2) ".fa"}; {print >> OUT; close(OUT)}' $alin_file #split of multifasta

c="n"

for i in ./*.fa; do
	nt_file="$(grep -v ">" $i | wc | awk '{print $3-$1}')"; #nt count
	if [[ "$nt_file" < "$nt_output" ]]; then
		echo -e "Incorporating ns to $i sequence"
		ns=$(($nt_output-$nt_file)) #total ns needed
		APPENDns=$(printf ''$c'%.0s' $(seq 1 $ns)) #repeat "n" (saved in "c") as many times as needed
		echo "$(cat $i)$APPENDns" > $i #ns appended to the fasta sequence
	fi
done

echo -e "\e[105mWriting $output_filename alignment\e[49m"
cat *.fa > "$output_filename"

rm *.fa

