#!/bin/bash

read -p "Ingresa los patrones separados por un espacio: " input

array_input=()

for i in ${input[@]}
do
	array_input+=($i)
done

array_total=${#array_input[@]}
array_total="$((array_total +1))"

crunch_d=""

for (( i=0; i<$array_total; i++ ))
do
	crunch_d+="d"
done

array_input=( "${array_input[@],,}" )

fecha_actual="$(date +%Y)"
fecha_base="$((fecha_actual - 20))"

for i in 1 2
do
	if [ $i -eq 2 ]
	then
		input=( "${array_input[@]^^}" )
	fi

	for (( fecha=$fecha_base; fecha<=$fecha_actual; fecha++ ))
	do
		crunch $array_total $array_total -t $crunch_d -o crunch_temp.txt -p ${input[*]} $fecha
		cat crunch_temp.txt >> crunch_utn_eh.txt
	done
done

rm crunch_temp.txt