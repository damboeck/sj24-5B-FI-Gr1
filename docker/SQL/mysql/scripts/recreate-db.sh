#!/bin/bash

# Löscht und erzeugt eine Datenbank ohne Benutzer ohne Rechte setzen

# 1.Parameter Datenbankname

if [ -n "$1" ] ; then
  echo recreate database $1
  mysql -uroot -p$MYSQL_ROOT_PASSWORD --default-character-set=utf8mb4 -e"drop database if exists $1;" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD --default-character-set=utf8mb4 -e"create database if not exists $1;" 2>/dev/null
else
  echo löscht und erzeugt eine Datenbank ohne Benutzer ohne Rechte setzen
  echo
  echo rcdb database
  echo
fi
