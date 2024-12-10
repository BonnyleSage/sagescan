# sagescan
sagescan is a Bash-based tool that automates Nmap scans with advanced features like stealth methods, WAF detection, and bypassing capabilities. It simplifies penetration testing tasks, providing a quick and powerful way to assess targets.

## FEATURES

1. **Quick Scan:** Quickly scan the top 100 ports.
2. **Full Scan:** Scans all 65,535 ports.
3. **OS Detection:** Identifies the target's operating system.
4. **Stealth Scan:** Conducts a stealthy SYN scan with minimal detection.
5. **WAF Detection and Bypass:** Detects Web Application Firewalls (WAFs) and attempts bypass techniques using Nmap scripts and fragmented packets.
6. **Custom Script Scan:** Allows you to use any Nmap script for a targeted scan.

---

## INSTALLATION

1. Clone this repository:
   🆗 git clone https://github.com/BonnyleSage/sagescan.git
   🆗 cd bonny
   
2.Change permissions :
   🆗 chmod +x bonny.sh

3.  Install additional dependencies for WAF detection==>>  This  is  optional :
   🆗 pip install wafw00f

## USAGE
  Run sagescan with the following syntax:
  🆗  ./bonny.sh -t <target> -m <mode>

  Modes:
        1: Quick Scan
        2: Full Scan
        3: OS Detection
        4: Stealth Scan
        5: WAF Detection and Bypass
        6: Custom Script Scan
## Examples

  1-Quick Scan
  🆗  ./bonny.sh -t example.com -m 1
  ||2-Full Scan
  🆗  ./bonny.sh -t example.com -m 2
  ||3-OS Detection
  🆗 ./bonny.sh -t example.com -m 3
  ||4-Stealth Scan
  🆗 ./bonny.sh -t example.com -m 4
  ||5-WAF Detection and Bypass
  🆗 ./bonny.sh -t example.com -m 5
  ||6- Custom Script Scan
  🆗 ./bonny.sh -t example.com -m 6  |||Then enter the script name when prompted, e.g., http-title.

## Dependencies
 ❗❗Nmap: Ensure it is installed:
   sudo apt install nmap
 ❗❗ WafW00f (Optional for WAF detection):
   pip install wafw00f
## Disclaimer
As I  used to say in  all my  tools, Sagescan is intended for ethical penetration testing and educational purposes only. Use it responsibly and only on systems you have explicit permission to test.
## Contributing 
Contributions are welcome! Feel free to submit a pull request or open an issue for any enhancements or bugs.(Let's make it  together one of the best  tool for the community)

## License
MIT License











