#!/bin/bash

# Prompt the user to enter a file name
read -p "Enter the name of the file you want to transfer: " filename

# Calculate the size of the file in bytes
filesize=$(dd if=$filename bs=1 count=0 2>/dev/null | awk '{print $1}')

# Transfer the file to the destination using netcat
read -p "Enter the IP address and port number of the destination in the format IP:port: " destination
cat $filename | netcat $destination

# Count the number of lines in the file
numlines=$(wc -l $filename | awk '{print $1}')

# Print the file size and number of lines
echo "The size of the file is $filesize bytes."
echo "The number of lines in the file is $numlines."
