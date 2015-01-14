#!/usr/local/bin/python

from bs4 import BeautifulSoup
import urllib2
import sys


import os

## search files 
htmlFiles = []
files = os.listdir('./')
for file in files:
  if file.find("html") >= 0:
    htmlFiles.append(file)

## scrape html file
for htmlFile in htmlFiles:
  print htmlFile
  html = open(htmlFile).read().encode('utf-8', 'ignore')
  soup = BeautifulSoup(html)
  print soup.find('span', class_="count-badge").string

