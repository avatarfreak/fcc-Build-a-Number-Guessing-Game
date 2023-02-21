#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --tuples-only -c"


SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo "Enter your username:"
read USER

# check for usename
USERNAME=$($PSQL "SELECT name FROM games WHERE name ='$USER'")

# if not found
if [[ -z $USERNAME ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."    
else
 RECORD=$($PSQL "SELECT name, Min(best_game), COUNT(best_game) AS GAMES_PLAYED FROM games WHERE name='$USER' GROUP BY name")
 echo "$RECORD" | while IFS="|" read USERNAME BEST_GAME GAMES_PLAYED
 do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi
