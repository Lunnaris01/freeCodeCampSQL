#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"



SALON_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read ID BAR SERVICE_NAME
  do
    echo -e "$ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SALON_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME ]]
    then
      SALON_MENU "I could not find that service. What would you like today?"
    else
      SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_INFO=$($PSQL "SELECT customer_id,name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_INFO ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi
      CUSTOMER_INFO=$($PSQL "SELECT customer_id,name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      read CUSTOMER_ID BAR CUSTOMER_NAME <<< $CUSTOMER_INFO
      echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi


}

SALON_MENU
