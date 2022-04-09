#!/bin/bash

rm -f regions

# Canonical-Ubuntu-20.04-Minimal-2021.10.19-0
wget -q https://docs.oracle.com/en-us/iaas/images/image/8f0cbe71-0f53-49f7-894c-0d27d895fc65/ -O regions

for region in $(grep '\.image\.' regions|awk '{$1=$1};1'|rev|cut -c 6-|rev|cut -c 5-);do
    local=$(echo "$region"|cut -d. -f4)
    sed "/$local/s/\".*\"/\"$region\"/g" variables.tf>temp
    mv temp variables.tf
    rm -f regions
done
