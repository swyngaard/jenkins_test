#!/usr/bin/env python3
import requests

print("hello world!")

ip_address = requests.get('http://ipinfo.io/ip').text

print("my ip address is {}".format(ip_address))
