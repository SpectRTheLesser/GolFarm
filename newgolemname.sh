#!/bin/bash


partone=$(shuf -n 1 ./golemwords)
parttwo=$(shuf -n 1 ./golemwords)

partone=$(echo "$partone" | sed -r 's/ n//')
parttwo=$(echo "$parttwo" | sed -r 's/ n//')

partone=$(echo "$partone" | sed -r 's/ v//')
parttwo=$(echo "$parttwo" | sed -r 's/ v//')

partone=$(echo "$partone" | sed -r 's/ a//')
parttwo=$(echo "$parttwo" | sed -r 's/ a//')


echo "$partone-$parttwo"
~/.local/bin/golemsp settings set --node-name "$partone-$parttwo"
