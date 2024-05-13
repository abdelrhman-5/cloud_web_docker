CREATE DATABASE IF NOT EXISTS cloud;
USE cloud;
SOURCE /docker-entrypoint-initdb.d/sql.sql;
CREATE USER 'root'@'%' IDENTIFIED BY '2004';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '2004';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON cloud.* TO 'root'@'%';
FLUSH PRIVILEGES;