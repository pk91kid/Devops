#!/bin/bash
target=$(( (RANDOM % 100) + 1 ))
while true; do
  read -p "Welcome to the game, I have chosen a number between 1 and 100, Can you guess it by entering the number:" guess
  if [ "$target" == "$guess" ]; then
  echo "Congratulations, you have guessed the correct number!!"
  exit 0
  elif [ "$guess" -gt "$target" ]; then
  echo "Too high, guess a lower number"
  else
  echo "Too low, guess a higher number"
  fi
done




