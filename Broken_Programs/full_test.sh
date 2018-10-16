#!/bin/bash

echo "" > output.txt
count=0

for filename in *.pln; do
	echo "============================================" >> output.txt
	echo "TEST $count: $filename" >> output.txt
	echo "============================================\n" >> output.txt
	cat $filename >> output.txt
	echo "\nOUTPUT:\n" >> output.txt
	../plnext $filename >> output.txt
	echo "\n" >> output.txt
	count=$((count + 1))
done
