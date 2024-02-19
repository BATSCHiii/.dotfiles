#!/usr/bin/env python3

import psutil

battery = psutil.sensors_battery()[0]
print(battery, end='') if battery != None else print("No battery")
