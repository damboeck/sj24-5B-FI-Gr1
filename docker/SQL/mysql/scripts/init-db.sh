#!/bin/bash

# Ermöglicht dem Benutzer root sich über das Netzwerk zu verbinden
mysql -uroot mysql -e"ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$MYSQL_ROOT_PASSWORD'; flush privileges; "  2>/dev/null
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"flush privileges;"  2>/dev/null
mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" 2>/dev/null
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"flush privileges;" 2>/dev/null
mysql -uroot -p$MYSQL_ROOT_PASSWORD mysql -e"UPDATE user SET host='%' where user='root';" 2>/dev/null
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e"flush privileges;" 2>/dev/null
