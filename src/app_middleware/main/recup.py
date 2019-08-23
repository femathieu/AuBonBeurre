#!/usr/local/bin/python3.7


import pymysql.cursors
import os
import re
import json

files = [f for f in os.listdir('.') if re.match(r'data', f)]


for f in files:
    with open(f) as json_file:
        json = json.load(json_file)
        systemMainId = (json["1"])
        cuveTemp = (json["2"])
        extTemp = json["3"]
        milkWeight = json["4"]
        phMeasure = json["5"]
        kMeasure = json["6"]
        concentration = json["7"]
        salmonelleLevel = json["8"]
        ecoliLevel = json["9"]
        listeriaLevel = json["10"]
print("----------------------")
print (systemMainId, cuveTemp, extTemp, milkWeight, phMeasure, kMeasure, concentration, salmonelleLevel, ecoliLevel, listeriaLevel)


# Connect to the database
connection = pymysql.connect(host='database',
    user='root',
    passwd='9zknCUd,789ZyUu:',
    db='aubonbeurre',
    cursorclass=pymysql.cursors.DictCursor)

try:
    with connection.cursor() as cursor:
        # Create a new record
                  
        sql = """ INSERT INTO `system_detail` ( `system_main_id`, 
                                                `tank_temperature`, 
                                                `outside_temperature`, 
                                                `milk_weight`,
                                                `pH`, 
                                                `Kplus`, 
                                                `NaCI`, 
                                                `salmonelle`, 
                                                `E_coli`, 
                                                `Listeria`
                                                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);"""
        cursor.execute(sql, (systemMainId, cuveTemp, extTemp, milkWeight, phMeasure, kMeasure, concentration, salmonelleLevel, ecoliLevel, listeriaLevel))
        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()

    # with connection.cursor() as cursor:
    #     # Read a single record
    #     sql = "SELECT * FROM `test`"
    #     cursor.execute(sql)
    #     result = cursor.fetchone()
    #     print(result)
finally:
    connection.close()
