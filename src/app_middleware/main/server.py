#!/usr/src/Python-3.7.4/python

# coding: utf-8

import socket
import re
import os

socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.bind(('', 15555))

while True:
        socket.listen(5)
        client, address = socket.accept()
        print("{} connected".format(address))

        response = client.recv(1024)

        if response != "":
                print("\n response {} ".format(response))


        # clean files
        files = [f for f in os.listdir('.') if re.match(r'^data$', f)]
        for f in files:
           print("'{}' removed".format(f))
           os.remove(f)

        # create file
        data = open('data', "w+")

        # fill file
        print("{}".format(response.decode('utf-8')))
        data = open('data', "wb")
        while response:
                data.write(response)
                response = client.recv(1024)
        data.close()




print("Close")
client.close()
stock.close()
