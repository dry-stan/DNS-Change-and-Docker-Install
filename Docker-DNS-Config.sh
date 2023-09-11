#!/bin/bash

# Check if the script is run as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Function to validate an IP address
validate_ip() {
    local ip="$1"
    if [[ ! "$ip" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "Invalid IP address format: $ip"
        exit 1
    fi
}

# Function to install Docker and Docker Compose
install_docker() {
    echo "Installing Docker and Docker Compose..."
    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    # Install Docker Compose
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo "Docker and Docker Compose installed successfully!"
}

# Custom message by Dry-Stan Nex
custom_message() {
    echo "-------------------------------------------------------------"
    echo "This script is powered by Dry-Stan Nex, your script assistant!"
    echo "Enjoy using this script to configure your VPS and Docker."
    echo "-------------------------------------------------------------"
}

# Prompt the user to choose an option
echo "Select an option:"
echo "1. Use default DNS servers (shecan)"
echo "2. Enter custom DNS servers"
echo "3. Enable default settings and install Docker"
read -p "Enter your choice (1/2/3): " choice

# Default DNS servers (shecan)
default_dns1="185.51.200.2"
default_dns2="178.22.122.100"

# Function to change DNS servers
change_dns() {
    echo "Changing DNS servers..."
    sed -i '/^DNS=/d' /etc/systemd/resolved.conf
    sed -i '/^FallbackDNS=/d' /etc/systemd/resolved.conf
    bash -c "echo 'DNS=$1' >> /etc/systemd/resolved.conf"
    bash -c "echo 'FallbackDNS=$2' >> /etc/systemd/resolved.conf"
    systemctl restart systemd-resolved
    echo "DNS servers updated successfully!"
}

if [ "$choice" == "1" ]; then
    # Use default DNS servers (shecan)
    change_dns "$default_dns1" "$default_dns2"
    custom_message
elif [ "$choice" == "2" ]; then
    # Prompt the user to enter custom DNS servers
    read -p "Enter the first DNS server IP: " custom_dns1
    read -p "Enter the second DNS server IP: " custom_dns2

    # Validate custom DNS server IP addresses
    validate_ip "$custom_dns1"
    validate_ip "$custom_dns2"

    change_dns "$custom_dns1" "$custom_dns2"
    custom_message
elif [ "$choice" == "3" ]; then
    # Enable default settings and install Docker
    change_dns "$default_dns1" "$default_dns2"
    install_docker
    custom_message
else
    echo "Invalid choice. Please select 1, 2, or 3."
fi




