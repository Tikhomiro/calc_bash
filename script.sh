#!/bin/bash
#calc
#first and second arg is number, third is operation, if you want to calculate the square root, enter 0 as the second argument
#for multiplication use "*"
first_num=$1
second_num=$2
operation=$3
case "$3" in
   "*")
    multiplication=$(( $first_num * $second_num ))
    echo "$multiplication" > result
    ;;
 "+")
    addition=$( expr $first_num + $second_num )
    echo "$addition" > result
    ;;
  "-")
    subtraction=$( expr $first_num - $second_num )
    echo "$subtraction" > result
    ;;
  "/")
    let "division=$first_num / $second_num"
    echo "$division" > result
    ;;
esac
[[ "$operation" = ["^"] ]] && echo "$(( $first_num ** $second_num))" > result
if [ "$3" = "sqrt" -o $second_num -eq 0 ];
then
    sqrt=$(echo "sqrt($first_num)" | bc)
    echo "$sqrt" > result

else
    exit 1
fi
