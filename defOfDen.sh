#!/bin/bash
remove_things () {
        echo $@ | tr -d '<,>.'

}
dod () {
        wordS=S@
        for word in $@
        do
        def=$(. define.sh $word)
                rdef=$(remove_things $def)
                for other in $rdef
                do
                . define.sh $other
                done
        done
}
dod $@
