#!/bin/bash

if [ -n "$1" ] ; then
  if [ -n "$2" ] ; then
    file=$1
    name=$2
  else
    file=$1
    name=$1
  fi

  if [ -e /opt/dump/$file ] ; then
     if [[ $file =~ ^.*sql$ ]] ; then
       file=$(echo $file | sed 's/\.sql$//g')
       if ! [ -n "$2" ] ; then
         name=$file
       fi
     else
       echo only .sql files are allowed to import
       exit 1
     fi
  fi

  if [ -e /opt/dump/$file.sql ] ; then
    echo import database $name from $file.sql
    mysql -uroot -p$MYSQL_ROOT_PASSWORD --default-character-set=utf8mb4 -e"drop database if exists $name;create database $name;" 2>/dev/null
    sed -E "s/(CREATE DATABASE .* \`)[^\`]+(\`.*)/\\1$name\\2/g" /opt/dump/$file.sql |\
    sed -E "s/(USE \`)[^\`]+(\`)/\\1$name\\2/g" |\
    mysql -uroot -p$MYSQL_ROOT_PASSWORD $name --default-character-set=utf8mb4
#     zcat /opt/dump/$1.sql.gz | mysql -uroot -p$MYSQL_ROOT_PASSWORD $1
  else
    echo database dumpfile $file.sql not exists, nothing to do !
  fi
else
  echo Import database from dump-file
  echo
  echo import databasename
  echo import dumpfile databasename
fi
