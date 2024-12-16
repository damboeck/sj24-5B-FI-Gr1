#!/bin/bash

# Erzeugt eine Datenbank mit einem gleichnamigen Benutzer der alle Rechte darauf hat

# 1.Parameter Benutzername
# 2.Parameter Passwort

if [ -n "$1" -a -n "$2" ] ; then
  echo create database $1 with user $1
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"create database if not exists $1;" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE USER if not exists '$1'@'%' IDENTIFIED WITH caching_sha2_password BY '$2';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"GRANT ALL PRIVILEGES ON $1 . * TO '$1'@'%';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"flush privileges;" 2>/dev/null
else
  echo Erzeugt eine Datenbank mit einem gleichnamigen Benutzer der alle Rechte darauf hat
  echo
  echo cu user passwort
  echo
fi
