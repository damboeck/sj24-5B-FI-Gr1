#!/bin/bash

echo "use this commands to adminstrate databases: help, import, export, cu "
echo
echo "initialize : prepare database with password for external access with user root"
echo "import : imports a database from sql-file"
echo "export : exports a database to a sql-file"
echo "cu     : creates a user and his own database"
echo "cua    : creates a user and his own database and rights to all databases with name starts with username_"
echo "cdb    : creates a database"
echo "rcdb   : remove and create a database"