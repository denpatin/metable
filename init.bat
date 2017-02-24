@echo off
if %3.==. (
  echo Three parameters are needed: DB user, DB password, and DB name.
) else (
  SetLocal enableDelayedExpansion
  set sql=DROP DATABASE IF EXISTS `%3`; ^
CREATE DATABASE IF NOT EXISTS `%3` ^
CHARACTER SET utf8 ^
COLLATE utf8_general_ci;
  mysql -u%1 -p%2 -e "!sql!"
  mysql -u%1 -p%2 %3 < schema.sql
)
