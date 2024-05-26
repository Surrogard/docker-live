#!/bin/bash

#swap - not necessary if you have enough RAM, I have 2GB so I need it
swapon /dev/sda1

# setting the hostname to the mac address minus the colons
mac=$(cat /sys/class/net/enp*/address)
mac=${mac//[:]}
hostnamectl set-hostname "$mac"

#restart dhcpclient to communicate new hostname with dns server
dhclient -r; dhclient

#feeling sleepy
sleep 5
#join swarm
docker swarm join --token SWMTKN-<...> 192.168.2.79:2377
