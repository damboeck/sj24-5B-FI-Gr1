#!/bin/bash

# Führt ein SQL-Script aus

# 1.Parameter Name des Scripts, welche im Dump-Verzeichnis liegen muss
# 2.Parameter Datenbankname der verwendeten Datenbank

if [ -n "$1" ] ; then
  if [ -e /opt/dump/$1 ] ; then
    file=$1;
  elif [ -e /opt/dump/$1.sql ] ; then
    file=$1.sql
  else
    echo file $1 not found - stopped
    exit 1
  fi
  if [ -n "$2" ] ; then
    name=$2
    sed -E "s/(USE \`)[^\`]+(\`)/\\1$name\\2/g" /opt/dump/$file |\
        mysql -uroot -p$MYSQL_ROOT_PASSWORD $name
  else
    mysql -uroot -p$MYSQL_ROOT_PASSWORD $name </opt/dump/$file
  fi
else
  echo Führt ein SQL-Script aus
  echo
  echo run file
  echo run file database
  echo
fi
