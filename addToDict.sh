#!/bin/bash
if [ $# -eq 0 ] ;
then
echo "USAGE: give me n words to add to the dictionary"
else
for words in $@
        do
        v=$(cat myDefinitions.txt | grep $words)
        a=$(echo $?)
        if [ $a -eq 1 ] ;
        then
        sx=$(. define.sh $words )
        tx=$( echo $sx | tr -d [:space:])
                if [ $sx == "" ] ;
                then
                echo "$words was not added since dictionary couldnt find it"
                else
                echo $tx >> myDefinitions.txt
                cat myDefinitions.txt
                echo "WORD ADDED :)"
                fi
        else
        echo $v | grep $words
        echo "word found in prevous definition or was already defined"
        fi
done
fi
