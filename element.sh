#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# Element information lookup script
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    QUERY=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p USING(atomic_number) JOIN types t USING(type_id) WHERE e.atomic_number=$1;")
  else
    QUERY=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM elements e JOIN properties p USING(atomic_number) JOIN types t USING(type_id) WHERE e.symbol=INITCAP('$1') OR e.name=INITCAP('$1');")
  fi

  if [[ -z $QUERY ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$QUERY" | while IFS="|" read NUMBER NAME SYMBOL TYPE MASS MELT BOIL
    do
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  fi
fi
