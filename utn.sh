#!/bin/bash

utn="utn"
patron="1234567890"

for i in 1 2
do
	if [ $i -eq 2 ]
	then
		utn=${utn^^}
	fi
	
	for j in 1 2 3 4 5 6 7 8 9 10
	do
		nums=$(echo $patron | cut -c1-$j)  
		echo "$utn$nums"
		echo "$nums$utn"
	done
done