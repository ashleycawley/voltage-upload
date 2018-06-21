#!/bin/bash

# Takes a photo at 640 x 480 resolution and 75% JPG quality
raspistill -w 640 -h 480 -q 75 -o /home/pi/voltage-upload/voltage.jpg

# Pauses for 2 seconds
sleep 2

for file in voltage.jpg ; do
   convert /home/pi/voltage-upload/"$file" -font Helvetica-Bold \
-pointsize 34 -fill white -annotate +25+455  \
      %[exif:DateTimeOriginal] /home/pi/voltage-upload/"${file}"
done

# Pauses for 2 seconds
sleep 2

# Uploads the photo to the server
scp -q -P 2223 -i /home/pi/.ssh/id_rsa_solar /home/pi/voltage-upload/voltage.jpg acawley@solar.ashleycawley.co.uk:/home/acawley/solar.ashleycawley.co.uk &>/dev/null

# Exits
exit 0
