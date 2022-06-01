#!/bin/bash
for i in $(git branch | tr -d ' ' | tr -d \*); 
do git checkout $i; git pull $1 $i; git push $2 $i ;
done
