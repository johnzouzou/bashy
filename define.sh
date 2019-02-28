#!/bin/bash
#command line function that looks up definition of word entered as a command line arg

define(){
        t=$@
        for words in t
        do
        someOther=$(curl "https://www.vocabulary.com/dictionary/$words" | grep '<p class        ="long">' || echo '\n')
        echo $someOther
        done
}
if [ $# -eq 0 ]
then
echo "enter something to define silly"
else
for words in $@
do
s=$(curl "https://www.vocabulary.com/dictionary/$words" | grep '<p class="long">') ;
echo $s
done
fi
