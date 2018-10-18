#!/bin/bash

for i in {1..200}
do
    sbot publish --type post --text "Post $i"
done
