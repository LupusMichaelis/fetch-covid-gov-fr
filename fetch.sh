#!/bin/bash

# Quick'n'dirty script to fetch Covid-19 crisis data provided by the French government

target="https://dashboard.covid19.data.gouv.fr/data/"
dump=~/dump-gov-covid-data
now=$(date +%Y%m%d-%H%M)
day=$(date +%d)

mkdir -p $dump/$now
cd $_

# XXX There must be a more elegant way to get days
# For now, need to adjust on passing month
for n in $(seq 1 $day)
do
    wget -c "$target/date-2020-05-0$n.json" 
done

for n in $(seq -f %02g 1 30)
do
    wget -c "$target/date-2020-04-$n.json"
done

for n in $(seq -f %02g 1 31)
do
    wget -c "$target/date-2020-03-$n.json"
done

for n in $(seq -f %02g 1 28)
do
    wget -c "$target/date-2020-02-$n.json"
done

