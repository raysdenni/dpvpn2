#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/raysdenni/dpvpn2/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
exit 0
fi
clear
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
echo -e "Change Port SSTP Account"
echo -e "=========================" | lolcat
echo -e "Change Port  : $sstp"
read -p "New Port sstp: " sstp2
if [ -z $sstp2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $sstp2)
if [[ -z $cek ]]; then
sed -i "s/$sstp/$sstp2/g" /etc/accel-ppp.conf
sed -i "s/   - SSTP VPN                : $sstp/   - SSTP VPN                : $sstp2/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $sstp -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $sstp -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $sstp2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $sstp2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart accel-ppp> /dev/null
echo -e "\e[032;1mPort $sstp2 modified successfully\e[0m"
else
echo "Port $sstp2 is used"
fi

