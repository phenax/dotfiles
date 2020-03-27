#!/usr/bin/env bash

data=$(curl https://corona-stats.online/in -s | awk -F'│' '/India|World/ {print $2 "=>  Confirmed: " $3 " | Deaths: " $5 " | Rate (c/d)" $4 $6}');
echo "$data";

