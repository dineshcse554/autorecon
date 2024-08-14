#!/bin/bash

# Check if the required tools are installed
required_tools=("whois" "subfinder" "nmap" "jq" "nuclei")
for tool in "${required_tools[@]}"; do
  if ! command -v $tool &> /dev/null; then
    echo "Error: $tool is not installed. Please install it and try again."
    exit 1
  fi
done

# Check if domain is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <domain>"
  exit 1
fi

DOMAIN=$1

echo "Starting reconnaissance for domain: $DOMAIN"

# Whois information
echo -e "\n[1] Whois Information:"
whois $DOMAIN

# Subdomain enumeration
echo -e "\n[2] Subdomain Enumeration:"
subfinder -d $DOMAIN -o subdomains.txt
cat subdomains.txt

# Basic port scan
echo -e "\n[3] Basic Port Scan:"
nmap -p- $DOMAIN -oN nmap_scan.txt
cat nmap_scan.txt

# Nuclei scan
echo -e "\n[4] Nuclei Scan:"
nuclei -l subdomains.txt -o nuclei_scan.txt
cat nuclei_scan.txt

# Get the number of found subdomains
SUBDOMAINS_COUNT=$(wc -l < subdomains.txt)
echo -e "\nFound $SUBDOMAINS_COUNT subdomains."

echo "Reconnaissance completed."

# Cleanup
rm -f subdomains.txt nmap_scan.txt nuclei_scan.txt
