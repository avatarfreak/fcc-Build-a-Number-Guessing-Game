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

echo "Guess the secret number between 1 and 1000:"
read GUESS

NUMBER_OF_GUESS=1
# Guess until it is integer  
while [[ ! $GUESS =~ ^[0-9]+$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS 
done

while [[ $GUESS != $SECRET_NUMBER ]]
do
  # if lower
  if (( $GUESS <= $SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
    NUMBER_OF_GUESS=$(( $NUMBER_OF_GUESS + 1 ))    
    read GUESS

  # if higher
  else
    echo "It's lower than that, guess again:"
    NUMBER_OF_GUESS=$(( $NUMBER_OF_GUESS + 1 ))
    read GUESS
  fi
done

echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $SECRET_NUMBER. Nice job!"
# INSERT USERNAME AND game details
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(name, best_game) VALUES('$USER','$NUMBER_OF_GUESS')")

