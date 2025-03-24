#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams,games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    # GET WINNER_ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    # IF NOT EXISTS
    if [[ -z $WINNER_ID ]]
    then
      # ADD TEAM
      ADD_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $ADD_WINNER_RESULT=="INSERT 0 1" ]]
      then
        echo Inserted new team: $WINNER
      fi
      # GET WINNER_ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

  # GET OPPONENT ID
  if [[ $OPPONENT != "opponent" ]]
  then
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # IF NOT EXISTS
    if [[ -z $OPPONENT_ID ]]
    then
      # ADD TEAM
      ADD_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $ADD_OPPONENT_RESULT=="INSERT 0 1" ]]
      then
        echo Inserted new team: $OPPONENT
      fi
      # GET WINNER_ID
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT=="INSERT 0 1" ]]
      then
        echo Inserted new game: $WINNER vs $OPPONENT - $WINNER_GOALS : $OPPONENT_GOALS from $YEAR in round: $ROUND
    fi
  fi
done
