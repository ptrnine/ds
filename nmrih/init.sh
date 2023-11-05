#!/bin/bash

printf "" > nmrih/cfg/mapcycle.txt

for map in $(find nmrih/maps/ -name "nmo*.bsp" -printf "%f\n"); do
    echo "${map%.*}" >> nmrih/cfg/mapcycle.txt
done
