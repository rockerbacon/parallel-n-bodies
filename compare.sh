#!/bin/bash

#Execute aqui pelo script.
#Parâmetros
# ./gol 128 128 1000 1 0.1
#        |   |    |  | |-> probabilidade da célula ser 1
#        |   |    |  |---> 1 grava em arquivo/0 não grava saída no arquivo
#        |   |    |------> passos de tempo
#        |   |-----------> largura
#        |---------------> altura
args="100 1000 1"

make

time ./n-bodies $args
time ./n-bodies-parallel $args $1

echo

cmp n-bodies.txt n-bodies-parallel.txt
exit_status=$?

if [ "$exit_status" == "0" ]; then
	echo "PROGRAM WORKING CORRECTLY"
else
	echo "FILES ARE DIFFERENT!!!!!!"
fi

exit $exit_status

