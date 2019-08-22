#!/usr/local/bin/python3.7

# coding: utf-8

import socket
import re
import os

hote = "172.168.1.2"
port = 15555

socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.connect((hote, port))
print("Connection on {}".format(port))

# f = open("paramunite_1_1566310765.0.json", "rb")
f = 0
date = ""
files = [f for f in os.listdir('/opt/data/') if re.match(r'.*\.json', f)]
for file in files:
    date = "{}".format(re.search(r'\d*\.\d*', file).group())
    f = open("/opt/data/{}".format(file), "rb")

data = f.read(1024)

socket.send(str.encode(date))

while data:
    socket.send(data)
    data = f.read(1024)


# socket.send("Hey my name is Olivier!")

print("Close")
socket.close()