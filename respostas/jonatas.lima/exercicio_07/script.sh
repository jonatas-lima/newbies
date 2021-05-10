#!/bin/bash

# informação do modelo da cpu
CPU_MODEL=$(cat /proc/cpuinfo | grep "model name" | tail -1 | cut -c 14-)

# placa de rede
NETWORK=$(lspci | grep -i "ethernet controller" | cut -c 30-)

# informação da memoria
MEM_INFO=$(cat /proc/meminfo | grep "MemTotal" | cut -c 18-)

FILE=base.txt

if [ -e "$FILE" ]; then
	FILE_OUTPUT=$(cat $FILE)
	CMD_OUTPUT="$CPU_MODEL $NETWORK $MEM_INFO"

	if [ "$FILE_OUTPUT" = "$CMD_OUTPUT" ]; then
		echo "SEM ALTERACOES"
	else
		echo "SISTEMA ALTERADO"
	fi
else
	touch $FILE
	echo "Arquivo $FILE criado"
		
	echo $CPU_MODEL > $FILE
	echo $NETWORK >> $FILE
	echo $MEM_INFO >> $FILE
fi

