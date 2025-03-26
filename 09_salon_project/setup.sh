#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

RESET_PSQL=$($PSQL "TRUNCATE customers,appointments,services RESTART IDENTITY")
echo "Reset Result: $RESET_PSQL"

SERVICES_INSERTION=$($PSQL "INSERT INTO services (name) VALUES ('cut'),('color'),('perm'),('style'),('trim')")
echo "Inser Service Result: $SERVICES_INSERTION"

