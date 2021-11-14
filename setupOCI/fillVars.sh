#!/bin/bash

if !( (command -v readlink &> /dev/null) && (command -v openssl &> /dev/null) && (command -v awk &> /dev/null) )
then
    echo 'Command could not be found'
    exit
fi

oracle_api_key_fingerprint=$(openssl rsa -pubout -outform DER -in ~/.oci/oci_api_key.pem 2>/dev/null | openssl md5 -c | awk '{print $2}')
oracle_api_private_key_path=$(readlink -f ~/.oci/oci_api_key.pem)

ssh_public_key=$(readlink -f ~/.ssh/id_rsa.pub)
ssh_public_key=$(awk '{print $1" "$2}' "$ssh_public_key")

ssh_private_key_path=$(readlink -f ~/.ssh/id_rsa)

instance_display_name="pihole-wireguard"

read -p 'User OCID: ' user_ocid

read -p 'Tenancy OCID: ' tenancy_ocid

read -p 'Region: ' region

read -p 'Availability Domain: ' free_tier_availability_domain

compartment_ocid="$tenancy_ocid"

echo "oracle_api_key_fingerprint = \"$oracle_api_key_fingerprint\"" > terraform.tfvars
echo "oracle_api_private_key_path = \"$oracle_api_private_key_path\"" >> terraform.tfvars
echo "user_ocid = \"$user_ocid\"" >> terraform.tfvars
echo "tenancy_ocid = \"$tenancy_ocid\"" >> terraform.tfvars
echo "compartment_ocid = \"$compartment_ocid\"" >> terraform.tfvars
echo "region = \"$region\"" >> terraform.tfvars
echo "free_tier_availability_domain = \"$free_tier_availability_domain\"" >> terraform.tfvars
echo "ssh_public_key = \"$ssh_public_key\"" >> terraform.tfvars
echo "ssh_private_key_path = \"$ssh_private_key_path\"" >> terraform.tfvars
echo "instance_display_name = \"pihole-wireguard\"" >> terraform.tfvars
