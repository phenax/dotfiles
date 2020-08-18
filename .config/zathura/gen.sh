#!/usr/bin/env bash

TEMPLATE=./template.zathurarc;
OUTPUT=./zathurarc;

get_key() { echo -e "$1" | awk -F':' '{print $1}'; }
get_value() { echo -e "$1" | awk '{print $2}'; }

rm $OUTPUT 2> /dev/null;
cp $TEMPLATE $OUTPUT;

xrdb -query | while read line; do
  key=$(get_key "$line" | sed 's/\*\.//g');
  value=$(get_value "$line");

  sed "s/{{$key}}/$value/g" -i "$OUTPUT";
done;

