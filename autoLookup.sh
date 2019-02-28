#!/bin/bash
#looks up stock price and parses out information from google finance
#works with price tags and company names
#usage: bash autolookup.sh (company name)
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
        r=$(echo $s | tr ' ' '\n' | grep -A 1 'itemprop="price"' | tail -n 1)
        echo "$stock ="
        echo $r | tr -d [:alpha:] | tr -d '=','"'
done

fi
