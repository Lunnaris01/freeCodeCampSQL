#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit 0
fi

if [[ $1 =~ ^[1-9]+[0-9]*$ ]]
then
  #echo "Element provided via atomic number"
  ATOMIC_NB=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
then
  #echo "Element provided via atomic symbol"
  ATOMIC_NB=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
elif [[ $1 =~ ^[A-Z][a-z]*$ ]]
then
  #echo "Element provided via Name"
  ATOMIC_NB=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
else
  echo "I could not find that element in the database."
  exit 0
fi

if [[ -z $ATOMIC_NB ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

ELEMENT_INFO=$($PSQL "SELECT symbol,name FROM elements WHERE atomic_number=$ATOMIC_NB")
ELEMENT_PROPERTIES=$($PSQL "SELECT * FROM properties INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NB")
IFS='|' read -r symbol name <<< "$ELEMENT_INFO"
symbol=$(echo "$symbol" | xargs)
name=$(echo "$name" | xargs)  # Preserve spaces in name but trim edges

IFS='|' read -r type_id atomic_number atomic_mass melting_point_celsius boiling_point_celsius type  <<< "$ELEMENT_PROPERTIES"
echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
