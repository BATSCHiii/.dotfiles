#!/bin/bash

# shell script to prepend i3status with weather
#temp=$(cat ~/.weather.cache | grep -o -e '[[:digit:]].*°C')
#town=$(cat ~/.weather.cache | cut -d : -f1)
#weather=$(cat ~/.weather.cache | cut -d : -f2 | xargs | cut -d ' ' -f1)

str=$(cat ~/.weather.cache | tr -d ':')
echo $str
