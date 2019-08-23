#!/usr/local/bin/python3.7

import random
import time
import datetime
import os
import re
import json


class InfoEntity:

    def __init__(self):
        self.nom = "first_unity"

    def unityNumber(self):
        number = random.randint(1, 5)
        return number

    def automateNumber(self):
        number = random.randint(1, 10)
        return number

    def systemMainId(self):
        with open("/opt/config/id", "r") as f:
            id = f.read()
        return id

    def cuveTemp(self):
        temp = round(random.uniform(2.5, 4.0), 1)
        return temp

    def extTemp(self):
        temp = round(random.uniform(8.0, 14.0), 1)
        return temp

    def milkWeight(self):
        weight = random.randint(3512, 4607)
        return weight

    def phMeasure(self):
        measure = round(random.uniform(6.8, 7.2), 1)
        return measure

    def kMeasure(self):
        measure = random.randint(35, 47)
        return measure

    def concentration(self):
        measure = round(random.uniform(1.0, 1.7), 1)
        return measure

    def salmonelleLevel(self):
        measure = random.randint(17, 37)
        return measure

    def ecoliLevel(self):
        level = random.randint(35, 49)
        return level

    def listeriaLevel(self):
        level = random.randint(28, 54)
        return level

    def date(self):
        date = datetime.datetime.now()
        return date

    def unixtime(self):
        date = datetime.datetime.now()
        unixtime = time.mktime(date.timetuple())
        return unixtime


Info = InfoEntity()

# print("{} ; {} ; {} ; {} ; {} ; {} ; {} ; {} ; {} ; {} ; {} ; {}".format(
#                                             Info.unityNumber(),
#                                           Info.automateNumber(),
#                                           Info.automateType(),
#                                           Info.cuveTemp(),
#                                           Info.extTemp(),
#                                           Info.milkWeight(),
#                                           Info.phMeasure(),
#                                           Info.kMeasure(),
#                                           Info.concentration(),
#                                           Info.salmonelleLevel(),
#                                           Info.ecoliLevel(),
#                                           Info.listeriaLevel()
#                                       )
#       )
print(
    " 1 : type d'automate \n 2: Température cuve\n 3: Température exterieure\n 4: Poid lait en cuve\n 5: Mesure ph\n 6: Mesure K+ \n 7: Concentration de NaCI \n 8: Niveau bactérien salmonelle \n 9: Niveau bactérien E-Coli \n 10: Niveau bactérien Listéria")

jsondata = (json.dumps({
    1: Info.systemMainId(),
    2: Info.cuveTemp(),
    3: Info.extTemp(),
    4: Info.milkWeight(),
    5: Info.phMeasure(),
    6: Info.kMeasure(),
    7: Info.concentration(),
    8: Info.salmonelleLevel(),
    9: Info.ecoliLevel(),
    10: Info.listeriaLevel(),
    11: Info.unixtime()
}, indent=4))

date = datetime.datetime.now()
print(date)
unixtime = time.mktime(date.timetuple())

#files = [f for f in os.listdir('.') if re.match(r'.*\.json', f)]
#
#for f in files:
#    print("'{}' removed".format(f))
#    os.remove(f)

with open("/opt/data/paramunite_1_{}.json".format(unixtime), "w+") as f:
    f.write(jsondata)