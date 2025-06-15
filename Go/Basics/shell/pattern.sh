#!/bin/bash
a=10
for ((i=1; i<=a; i++))
do
   for ((j=1; j<=a-i; j++))
   do
      echo -n " "
   done
   for ((k=1; k<=2*i-1; k++))
   do
      echo -n "*"
   done
   echo 
done