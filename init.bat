mysql -u%1 -p%2 -e "DROP DATABASE IF EXISTS `%3`;"
mysql -u%1 -p%2 -e "CREATE DATABASE IF NOT EXISTS `%3` CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u%1 -p%2 %3 < schema.sql
