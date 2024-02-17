#!/usr/bin/env python3

import psutil

battery = psutil.sensors_battery()
print(battery, end='') if battery != None else print("No battery")
