# Basic_Firewall_ACLS
Block incoming requests from protocols that should only be used locally (ICMP,  DHCP, OSPF, SMB)
his script configures iptables to block incoming requests for ICMP, DHCP, OSPF, and SMB. It also sets default policies for input and forward chains.

## Usage

1. Download the script
2. Make the script executable:  chmod +x basicacls.sh
3. Open the script in a text editor to customize the RULES_FILE variable based on your preferred location for saving the iptables rules: 
nano firewall.sh 
Inside the script, locate the line: RULES_FILE="/etc/iptables/rules.v4"
Change /etc/iptables/rules.v4 to your desired path and file name.
4. run the script: sudo ./basicacls.sh 
