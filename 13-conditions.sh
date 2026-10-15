#!/bin/bash

echo "Please enter your marks"
read marks

if [ $marks -lt 33 ]; then
echo "Fail"
elif [ $marks -lt 50 ]; then
echo "Third class"
elif [ $marks -lt 60 ]; then
echo "second  class"
elif [ $marks -lt 75 ]; then
echo "First class"
else
echo "Distinction"
fi