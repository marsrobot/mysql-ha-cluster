# No need to use sudo
mysql -u root -p

CREATE USER 'repl'@'10.0.100.64' IDENTIFIED WITH mysql_native_password BY 'password';

GRANT REPLICATION SLAVE ON *.* TO 'repl'@'10.0.100.64';

FLUSH PRIVILEGES;