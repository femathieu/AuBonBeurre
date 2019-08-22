#!/usr/src/Python-3.7.4/python

import json
import os
import re
import pymysql


files = [f for f in os.listdir('.') if re.match(r'.*\.json', f)]


for f in files:
        with open(f) as json_file:
            data = json.load(json_file)
            print(data)


conn=pymysql.connect(host='database', port=3306, user='root', passwd='9zknCUd,789ZyUu:', db='aubonbeurre')

try:
    with conn.cursor() as cursor:
        # insert new record
        sql = "INSERT INTO `test` (`id`,`label`) VALUES (%s, %s)";
        cursor.execute(sql, (4, 'test@test.org'))

    # connection is not auto commit by default so you need to commit
    conn.commit()
finally:
    conn.close()



