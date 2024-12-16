@echo off

docker volume create htl-mysql
docker network create nw-htl

docker compose up -d

rem Hier sollte ein Delay ausgeführt werden

docker exec -i mysql-htl-24 initialize
