#!/bin/bash

cat table1.txt table2.txt > table_combined.txt

echo "Eleminating the entries with Invalid Phone Number"
#for eleminating the entries with invalid bhone number
awk -v OFS="\t" '{if (length($1) == 10 )print $1, " " "|" " "  $2,  "\t" "|" " "  $3"\t"}' table_combined.txt > table_correctly_merged.txt

echo "Phone	        Firstname  	Lastname"
while IFS= read -r line; do
    echo "$line"
done < table_correctly_merged.txt

echo " " 
echo "Removing Dublicate Values and sorted"
echo "Phone	        Firstname  	Lastname"
sort table_correctly_merged.txt | uniq -u > table_correctly_merged_removed_doublicates_sorted.txt

cat table_correctly_merged_removed_doublicates_sorted.txt
echo " "
#counting number of lines in table_sorted.txt file
echo "Number of lines : "
wc --lines < table_correctly_merged_removed_doublicates_sorted.txt 


