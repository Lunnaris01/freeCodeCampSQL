#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
#RESET_DB=$($PSQL "TRUNCATE users")
USER_DATA=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username,best_game) VALUES('$USERNAME',9999)")
  USER_DATA=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
  IFS='|' read -r user_id username games_played best_game <<< "$USER_DATA"
else
  IFS='|' read -r user_id username games_played best_game <<< "$USER_DATA"
  username=$(echo "$username" | xargs)
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER 
echo "Guess the secret number between 1 and 1000:"
USER_GUESS=-1
GUESS_ATTEMPTS=0
while [[ $USER_GUESS != $RANDOM_NUMBER ]]
do
  read USER_GUESS
  (( GUESS_ATTEMPTS++ ))
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  if [[ $USER_GUESS == $RANDOM_NUMBER ]]
  then
    break
  fi
  if  [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done
best_game=$(( $GUESS_ATTEMPTS < $best_game ? $GUESS_ATTEMPTS : $best_game ))

UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=$games_played+1, best_game =$best_game WHERE username='$USERNAME'")

echo "You guessed it in $GUESS_ATTEMPTS tries. The secret number was $RANDOM_NUMBER. Nice job!"

