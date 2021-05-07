#!/bin/bash

FILE_NAME="jan_95.txt.gz"

## copia o arquivo do diretorio de questoes
cp ../../../questoes/exercicio_1/$FILE_NAME .

## extrai o arquivo
gunzip $FILE_NAME

## nome do arquivo extraido
EXTRACTED_FILE="jan_95.txt"

## contagem de requisicoes
LOCALS=$(grep "local - - " -c $EXTRACTED_FILE)
REMOTES=$(grep "remote - - " -c $EXTRACTED_FILE)

echo "Foram feitas $LOCALS requisições locais"
echo "Foram feitas $REMOTES requisições remotas"

## remove o arquivo
rm $EXTRACTED_FILE
