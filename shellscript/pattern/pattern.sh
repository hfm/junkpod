#!/bin/bash

while read list ; do
    list=${list/:0000:0000:0000:0000:0000:0000/::}
    list=${list/:0000:0000:0000:0000:0000/::}
    list=${list/:0000:0000:0000:0000/::}
    list=${list/:0000:0000:0000/::}
    list=${list/:0000:0000/::}
    list=${list/::/:}
    list=${list//:0000/:0}
    list=${list//:000/:}
    list=${list//:00/:}
    list=${list//:0/:}
    echo ${list}
done < list.txt
