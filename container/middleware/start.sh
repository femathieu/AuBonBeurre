#!/bin/bash

service cron start
python3.7 /opt/aubonbeurre/main/server.py
tail -f /start.sh