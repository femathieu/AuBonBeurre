SET PASSWORD FOR 'root'@'localhost' = PASSWORD('9zknCUd,789ZyUu:');
CREATE USER 'root'@'%' IDENTIFIED BY '9zknCUd,789ZyUu:';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost%' IDENTIFIED BY '9zknCUd,789ZyUu:' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '9zknCUd,789ZyUu:' WITH GRANT OPTION;

use mysql;
update user set plugin='' where User='root';
flush privileges;

CREATE DATABASE aubonbeurre;


-- FLUSH PRIVILEGES;