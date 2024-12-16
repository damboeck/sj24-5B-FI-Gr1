#!/bin/bash

echo [client]>/root/mycred.cnf
echo user=root>>/root/mycred.cnf
echo password=$MYSQL_ROOT_PASSWORD>>/root/mycred.cnf
echo host=localhost>>/root/mycred.cnf
