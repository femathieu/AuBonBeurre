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


conn=pymysql.connect(host='database', user='root', passwd='9zknCUd,789ZyUu:', db='aubonbeurre')
cursor=conn.cursor()
cursor.execute('INSERT INTO test (label) VALUES (\'salutpierrotlasticot\')')