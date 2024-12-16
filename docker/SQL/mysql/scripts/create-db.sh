#!/bin/bash

# Erzeugt eine Datenbank ohne Benutzer ohne Rechte setzen

# 1.Parameter Datenbankname

if [ -n "$1" ] ; then
  echo create database $1
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"create database if not exists $1;" 2>/dev/null
else
  echo Erzeugt eine Datenbank ohne Benutzer ohne Rechte setzen
  echo
  echo cdb database
  echo
fi
