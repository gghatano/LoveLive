#!/bin/bash

for member1 in ほの こと うみ にこ のぞ えり まき りん ぱな
do
  for member2 in ほの こと うみ にこ のぞ えり まき りん ぱな
  do
    url="http://www.pixiv.net/search.php?s_mode=s_tag&word=$member1$member2"
    m1=$(echo $member1 | nkf -e | kakasi -Ha )
    m2=$(echo $member2 | nkf -e | kakasi -Ha )
    curl $url > "$m1-$m2.html"
    sleep 1
  done
done
