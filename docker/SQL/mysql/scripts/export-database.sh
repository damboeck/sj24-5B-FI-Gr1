#!/bin/bash

if [ -n "$1" ] ; then
  if [ -n "$2" ] ; then
    name=$1
    file=$2
    if [[ $file =~ ^.*sql$ ]] ; then
      file=$(echo $file | sed 's/\.sql$//g')
    fi
  else
    file=$1
    name=$1
  fi

  echo export database $name to $file.sql
  mysqldump --force --opt -uroot -p$MYSQL_ROOT_PASSWORD --databases "$name" 2>/dev/null >"/opt/dump/$file.sql"
else
  echo Export database in gzipped Dumpfile datebasename.sql
  echo
  echo export databasename
  echo export databasename dumpfile
fi