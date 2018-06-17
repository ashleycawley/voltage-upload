#!/bin/bash

# Takes a photo at 640 x 480 resolution and 75% JPG quality
raspistill -w 640 -h 480 -q 75 -o /home/pi/voltage-upload/voltage.jpg

# Pauses for 2 seconds
sleep 2

# Uploads the photo to the server
scp -P 2223 -i /home/pi/.ssh/id_rsa_solar voltage.jpg acawley@solar.ashleycawley.co.uk:/home/acawley/solar.ashleycawley.co.uk

# Exits
exit 0
