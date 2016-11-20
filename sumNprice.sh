#!/bin/bash
if [ $# -eq 0 ]
then
stocks="AAPL HAL LMT" ;
for stock in $stocks
do
        s=$(curl https://www.google.com/finance?q="$stock") ;
        r=$(echo $s | tr ' ' '\n' | grep -A 1 'itemprop="price"' | tail -n 1)
        echo "$stock = "
        echo $r | tr -d [:alpha:] | tr -d '=','"'
done
else
for stock in $@
do
        s=$(curl https://www.google.com/finance?q="$stock") ;
        echo "$stock :"
        echo $s | tr '<=>' '\n' | grep -A 1 companySummary | tail -n 1
        r=$(echo $s | tr ' ' '\n' | grep -A 1 'itemprop="price"' | tail -n 1)
        echo " =$"
        echo $r | tr -d [:alpha:] | tr -d '=','"'
done

fi
