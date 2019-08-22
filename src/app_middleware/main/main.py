import json
import os
import re
import MySQLdb


files = [f for f in os.listdir('.') if re.match(r'.*\.json', f)]


for f in files:
        with open(f) as json_file:
            data = json.load(json_file)
            print(data)


conn=MySQLdb.connect(host='database', user='root', passwd='9zknCUd,789ZyUu:')
cursor=conn.cursor()
cursor.execute('CREATE DATABASE pierrrolastico')