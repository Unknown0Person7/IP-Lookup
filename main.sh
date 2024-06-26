#!/bin/bash

# created by JH Hacker
# IP Lookup Tool

source ./banner.sh

main(){
# Prompt the user to enter an IP address if not provided as an argument
if [ -z "$1" ]; then
    read -p "Enter IP address: " IP
else
    IP=$1
fi

# Check if IP address is empty
if [ -z "$IP" ]; then
    echo "No IP address provided. Exiting."
    exit 1
fi

# Fetch IP information
RESPONSE=$(curl -s http://ipinfo.io/$IP)

# Check if curl request was successful
if [ $? -ne 0 ]; then
    echo "Failed to fetch IP information. Please check your internet connection."
    exit 1
fi
}

dtails(){
# Extract and display the information
echo "IP Information for $IP:"
echo "  IP: $(echo "$RESPONSE" | grep '"ip"' | cut -d '"' -f 4)"
echo "  Hostname: $(echo "$RESPONSE" | grep '"hostname"' | cut -d '"' -f 4)"
echo "  City: $(echo "$RESPONSE" | grep '"city"' | cut -d '"' -f 4)"
echo "  Region: $(echo "$RESPONSE" | grep '"region"' | cut -d '"' -f 4)"
echo "  Country: $(echo "$RESPONSE" | grep '"country"' | cut -d '"' -f 4)"
echo "  Location: $(echo "$RESPONSE" | grep '"loc"' | cut -d '"' -f 4)"
echo "  Organization: $(echo "$RESPONSE" | grep '"org"' | cut -d '"' -f 4)"
echo "  Postal: $(echo "$RESPONSE" | grep '"postal"' | cut -d '"' -f 4)"
echo "  Timezone: $(echo "$RESPONSE" | grep '"timezone"' | cut -d '"' -f 4)"
}

# Function Called

main
dtails
