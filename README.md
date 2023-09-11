
# DNS-Change-and-Docker-Install

This project is a Bash script designed for users managing Linux VPS servers. It simplifies the configuration of DNS server settings, allowing users to switch between default and custom DNS values effortlessly. Additionally, the script provides an option to install Docker and Docker Compose, making it an ideal choice for developers, system administrators, and anyone seeking to optimize their VPS server's network performance and streamline Docker deployment. Whether you're a seasoned sysadmin or a newcomer to server management, this project offers a user-friendly solution to enhance your server's functionality and security.

## Installation

#### Step 1: Update Your System
 ##### Before proceeding, it's a good practice to ensure your system is up to date. Open your terminal and run the following command:

```bash
  sudo apt update && sudo apt upgrade -y
```
#### Step 2: Execute the Bash Script
 ##### To use the script, execute the following command in your terminal:
```bash
  bash <(curl -Ls https://raw.githubusercontent.com/dry-stan/DNS-Change-and-Docker-Install/main/Docker-DNS-Config.sh)
``` 
##### This command will download and run the script from the GitHub repository.
#### Step 3: Choose an Option    
##### After running the script, you will be presented with three options:
##### Option 1: Enable Shecan DNS servers (Default DNS servers).
##### Option 2: Use custom DNS servers.
##### Option 3: Enable Shecan DNS servers and install Docker & Docker Compose.
#### Step 4: Follow the On-Screen Prompts
 ##### Depending on your choice, the script will guide you through the process of configuring DNS servers and, if selected, installing Docker and Docker Compose.For custom DNS servers (Option 2), you will be prompted to enter the IP addresses of your custom DNS servers.
#### Step 5: Script Completion
##### Once the script completes its actions, it will provide you with a custom message confirming the changes made to your system.That's it! You've successfully configured your DNS settings and, if chosen, installed Docker and Docker Compose using the script. Enjoy using your optimized VPS server.
## License

This project is licensed under the [GNU General Public License v3.0](https://choosealicense.com/licenses/gpl-3.0/)

