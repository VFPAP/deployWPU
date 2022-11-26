#!/bin/bash

rm -f regions

# Canonical-Ubuntu-20.04-Minimal-2022.10.31-0
wget -q https://docs.oracle.com/en-us/iaas/images/image/1755009b-9f4d-45a4-8bcc-3b916ba95797/ -O regions

for region in $(grep '\.image\.' regions|awk '{$1=$1};1'|rev|cut -c 6-|rev|cut -c 5-);do
    local=$(echo "$region"|cut -d. -f4)
    sed "/$local/s/\".*\"/\"$region\"/g" variables.tf>temp
    mv temp variables.tf
    rm -f regions
done
