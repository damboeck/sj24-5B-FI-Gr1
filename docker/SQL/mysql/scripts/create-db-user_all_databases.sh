#!/bin/bash

# Erzeugt eine Datenbank mit einem gleichnamigen Benutzer der alle Rechte darauf hat
# Ebenfalls hat der Benutzer die Rechte auf alle Datenbanken die mit benutzername_ beginnen

# 1.Parameter Benutzername
# 2.Parameter Passwort

if [ -n "$1" -a -n "$2" ] ; then
  echo create database and user $1
  # mysql -uroot -p$password -hlocalhost -e"create database if not exists $1;"
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE USER '$1'@'%' IDENTIFIED WITH caching_sha2_password BY '$2';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"GRANT USAGE ON *.* TO '$1'@'%';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"ALTER USER '$1'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"CREATE DATABASE IF NOT EXISTS $1;"  2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"GRANT ALL PRIVILEGES ON $1.* TO '$1'@'%';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"GRANT ALL PRIVILEGES ON \`$1_%\`.* TO '$1'@'%';" 2>/dev/null
  mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"flush privileges;" 2>/dev/null
else
  echo Erzeugt eine Datenbank mit einem gleichnamigen Benutzer der alle Rechte darauf hat
  echo Ebenfalls hat der Benutzer die Rechte auf alle Datenbanken die mit benutzername_ beginnen
  echo
  echo cua user passwort
  echo
fi
