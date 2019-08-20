#!/bin/bash

service mysql start
mysql --user=root -e "source /database_user.sql"
mysql --user=root --password=9zknCUd,789ZyUu: -e "source /db.sql"

tail -f /start.sh
