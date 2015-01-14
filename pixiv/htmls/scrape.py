#!/usr/local/bin/python

from bs4 import BeautifulSoup
import urllib2
import sys
import os
import re

## search files 
htmlFiles = []
files = os.listdir('./')
for file in files:
  if file.find("html") >= 0:
    htmlFiles.append(file)

## scrape html file

file = open("res.txt.tmp", "a")
for htmlFile in htmlFiles:
  coupleName = re.sub(".html", "", htmlFile)
  coupleName = re.sub("-", ",", coupleName)
  html = open(htmlFile).read().encode('utf-8', 'ignore')
  soup = BeautifulSoup(html)
  hitNum = soup.find('span', class_="count-badge").string
  hitNum = re.sub(".$", "", hitNum)
  print coupleName + "," + hitNum 
  file.write(coupleName + "," + hitNum + "\n")

file.close()
  



