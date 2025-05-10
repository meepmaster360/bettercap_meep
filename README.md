# bettercap_meep

How to Use the Script
Save the script

bash
nano bettercap_automator.sh
(Paste the code, then save with Ctrl+O → Enter → Ctrl+X.)

Make it executable

bash
chmod +x bettercap_automator.sh
Run with sudo

bash
sudo ./bettercap_automator.sh
Select an attack

1) ARP Spoofing (Man-in-the-Middle)

2) DNS Spoofing (Redirect websites)

3) Wi-Fi Deauth (Kick devices off Wi-Fi)

4) HTTP/HTTPS Sniffing (Capture login credentials)

5) Web UI (Control via browser)

Example Attack: ARP Spoofing
Choose Option 1 (ARP Spoofing).

Enter target IP (e.g., 192.168.1.100).

Enter network interface (eth0 for Ethernet, wlan0 for Wi-Fi).

Bettercap will start poisoning ARP and sniffing traffic.

⚠️ Legal & Ethical Warning
Only use on networks you own or have permission to test.

Unauthorized hacking is illegal.

Why This Script?
✅ Automates repetitive Bettercap commands
✅ User-friendly menu for beginners
✅ Works on Raspberry Pi (ARM compatible)
