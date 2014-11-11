#!/bin/bash
for html in `ls`
do
  couple=$(echo $html | cut -d"." -f 1)
  count=$(cat $html | grep badge | gsed 's/[<|>]/\n/g' | grep -A 1 badge | tr '\n' '"' | awk -F "\"" '{print $4}')
  echo $couple $count >> res.txt
done
