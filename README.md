# autorecon
A comprehensive Bash script for automating reconnaissance tasks in bug bounty hunting. This script performs Whois lookups, subdomain enumeration, port scanning with nmap, and vulnerability scanning using nuclei. Designed to streamline the initial information gathering phase, it helps identify potential security issues quickly and efficiently.

# Bug Bounty Reconnaissance Script

## Overview

This repository contains a Bash script designed to automate reconnaissance for bug bounty hunting. The script performs a series of tasks to gather information about a target domain, including Whois lookups, subdomain enumeration, port scanning, and vulnerability scanning using `nuclei`.

## Features

- **Whois Lookup:** Retrieves and displays Whois information for the provided domain.
- **Subdomain Enumeration:** Uses `subfinder` to find subdomains of the target domain.
- **Port Scanning:** Performs a basic port scan of the target domain using `nmap`.
- **Nuclei Vulnerability Scan:** Scans the discovered subdomains for vulnerabilities using `nuclei`.

## Prerequisites

Before running the script, ensure the following tools are installed on your system:

- `whois`
- `subfinder`
- `nmap`
- `nuclei`
- `jq`

You can install these tools using your package manager or by following the installation instructions for each tool.

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/sharatkvs/autorecon.git
   cd autorecon
