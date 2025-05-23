#!/bin/bash

API_URL="http://192.168.58.51"

# Get initial version
current_version=$(curl -s "$API_URL" | jq .message)

while true; do
    new_version=$(curl -s "$API_URL" | jq .message)
    
    if [ "$new_version" != "$current_version" ]; then
        echo "Version changed from $current_version to $new_version"
        break
    fi
    
    echo "Still $current_version"
    sleep 30
done
