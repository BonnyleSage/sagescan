#!/bin/bash

# Sagescan - Advanced Nmap Automation Tool
# Automates and simplifies Nmap scans with advanced features.

# Check if Nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "[!] Nmap is not installed. Please install it first."
    exit 1
fi

# Function for displaying the banner
display_banner() {
    echo "===================================="
    echo "   sagescan - Nmap Automation Tool"
    echo "   By: Bonny leSage" 
    echo "  Contact:telegram=>@france205 ::Email=>thecybercoach971@gmail.com"   
    echo "===================================="
}

# Function for usage information
usage() {
    echo "Usage: $0 -t <target> -m <mode>"
    echo "Modes:"
    echo "  1) Quick Scan"
    echo "  2) Full Scan"
    echo "  3) OS Detection"
    echo "  4) Stealth Scan"
    echo "  5) WAF Detection and Bypass"
    echo "  6) Custom Script Scan"
    echo
    exit 1
}

# Function for WAF detection and bypass
detect_and_bypass_waf() {
    echo "[+] Detecting WAF..."
    wafw00f "$TARGET"
    echo "[+] Attempting WAF bypass with fragmented packets..."
    nmap -f "$TARGET" -p- -T4 --script=http-waf-detect,http-waf-fingerprint
}

# Perform the selected scan
perform_scan() {
    case $MODE in
        1)
            echo "[+] Performing Quick Scan..."
            nmap -T4 -F "$TARGET"
            ;;
        2)
            echo "[+] Performing Full Scan..."
            nmap -p- -T4 "$TARGET"
            ;;
        3)
            echo "[+] Performing OS Detection..."
            nmap -O "$TARGET"
            ;;
        4)
            echo "[+] Performing Stealth Scan..."
            nmap -sS -T2 "$TARGET"
            ;;
        5)
            detect_and_bypass_waf
            ;;
        6)
            echo "[+] Performing Custom Script Scan..."
            echo "Enter the Nmap script (e.g., http-title):"
            read -r SCRIPT
            nmap --script="$SCRIPT" "$TARGET"
            ;;
        *)
            echo "[!] Invalid mode selected."
            usage
            ;;
    esac
}

# Main script logic
main() {
    display_banner

    # Check if target is provided
    if [ -z "$TARGET" ] || [ -z "$MODE" ]; then
        usage
    fi

    echo "[+] Target: $TARGET"
    echo "[+] Mode: $MODE"

    perform_scan
}

# Parse command-line arguments
while getopts "t:m:" opt; do
    case $opt in
        t)
            TARGET=$OPTARG
            ;;
        m)
            MODE=$OPTARG
            ;;
        *)
            usage
            ;;
    esac
done

# Run the main function
main
