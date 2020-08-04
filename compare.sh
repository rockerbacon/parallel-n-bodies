#!/bin/bash

#Execute aqui pelo script.
#Execute aqui pelo script.
#Parâmetros
#   ./n-bodies 100 1000 0
#              |    |   |-> salva a posição, velocidade e força de cada corpo no último instante de tempo
#              |    |-----> quantidade de corpos (1000)
#              |----------> passos de simulação

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

