#!/bin/bash

DIRETORIO=$1

MB10=10240
MB200=204800

## coloca os diretorios e seus respectivos tamanhos em um arquivo
du $DIRETORIO | awk '{$1=$1}1' > data.txt
## awk '{$1=$1}1' 

IFS=' '
read -a dataArr <<< $(du $DIRETORIO)

for data in "${dataArr}"; do
	echo $data
done

echo "========================================================="
echo "Relatório de utilização para o diretório $DIRETORIO"
echo "========================================================="

echo "Diretórios que não excedem 10MB:"


echo "Diretórios que excedem 10MB:"

echo "Diretórios que excedem 200MB:"

echo "Diretórios que excedem 10MB e não excedem 200MB:"

## apaga o arquivo
## rm data.txt
