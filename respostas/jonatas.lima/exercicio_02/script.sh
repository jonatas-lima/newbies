#!/bin/bash

echo "Numero de observações: "
read N

echo "Intervalo em segundos: "
read S

echo "Nome do usuario: "
read P_USER

MAIOR_CPU=0.0
MENOR_CPU=0.0
MAIOR_MEM=0.0
MAIOR_MEM=0.0
i=0

while [ $i -lt $N ]; do
	USO_MAX_CPU=$(ps aux | grep $P_USER | cut -c 17-20 | sort | tail -1)
	USO_MIN_CPU=$(ps aux | grep $P_USER | cut -c 17-20 | sort | head -1)
	USO_MAX_MEM=$(ps aux | grep $P_USER | cut -c 22-25 | sort | tail -1)
	USO_MIN_MEM=$(ps aux | grep $P_USER | cut -c 22-25 | sort | head -1)

	MAX_CPU=$(echo $MAIOR_CPU $USO_MAX_CPU | awk '{if ($1 > $2) print $1; else print $2}')
	MIN_CPU=$(echo $MENOR_CPU $USO_MIN_CPU | awk '{if ($1 < $2) print $1; else print $2}')
	MAX_MEM=$(echo $MAIOR_MEM $USO_MAX_MEM | awk '{if ($1 > $2) print $1; else print $2}')
	MIN_MEM=$(echo $MENOR_MEM $USO_MIN_MEM | awk '{if ($1 < $2) print $1; else print $2}')

	MAIOR_CPU=${MAX_CPU}
	MENOR_CPU=${MIN_CPU}
	MAIOR_MEM=${MAX_MEM}
	MENOR_MEM=${MIN_MEM}

	let i=i+1

	sleep $S
done

echo "Uso maximo da CPU: $MAIOR_CPU %"
echo "Uso minimo da CPU: $MENOR_CPU %"
echo "Uso maximo da memoria: $MAIOR_MEM %"
echo "Uso minimo da memoria: $MENOR_MEM %"
