#!/bin/bash

#Execute aqui pelo script.
#Execute aqui pelo script.
#Parâmetros
#   ./n-bodies 100 1000 0
#              |    |   |-> salva a posição, velocidade e força de cada corpo no último instante de tempo
#              |    |-----> quantidade de corpos (1000)
#              |----------> passos de simulação

timesteps="100"
args="$timesteps 1000 1"

make

time ./n-bodies $args
time ./n-bodies-parallel $args $1

echo

cmp main-n-bodies.c-"$timesteps"-log.txt main-n-bodies-parallel.c-"$timesteps"-log.txt
exit_status=$?

if [ "$exit_status" == "0" ]; then
	echo "PROGRAM WORKING CORRECTLY"
else
	echo "FILES ARE DIFFERENT!!!!!!"
fi

exit $exit_status

