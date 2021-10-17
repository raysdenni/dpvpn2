#!/bin/bash
# Script By SSH GEO GABUT
# ==================================================

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=geoganteng.my.id
organizationalunit=geoganteng.my.id
commonname=geoganteng.my.id
email=paoandest@gmail.com

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/password"
chmod +x /etc/pam.d/common-password

# go to root
cd
apt install lolcat -y
apt install figlet -y

# Getting Proxy Template
wget -q -O /usr/local/bin/edu-ssh https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/edu/proxy-template.py
chmod +x /usr/local/bin/edu-ssh

# Installing Service
cat > /etc/systemd/system/edussh-nontls.service << END
[Unit]
Description=Ssh Websocket By DP VPN
Documentation=https://t.me/Dpvpb
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ssh 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edussh-nontls
systemctl restart edussh-nontls

# Installing Service
cat > /etc/systemd/system/edussh-tls.service << END
[Unit]
Description=Ssh Websocket By Geo Gabut
Documentation=https://t.me/sampiiiiu
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ssh 1945
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edussh-tls
systemctl restart edussh-tls

# Ovpn Websocket !!!
# =================================

# Getting Ovpn Ws Template
wget -q -O /usr/local/bin/edu-ovpn https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/edu/edu-op.py
chmod +x /usr/local/bin/edu-ovpn


# Installing Service Ovpn Websocket
cat > /etc/systemd/system/edu-ovpn.service << END
[Unit]
Description=Ovpn Websocket By GEO GABUT
Documentation=https://t.me/sampiiiiu
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/edu-ovpn 2082
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable edu-ovpn
systemctl restart edu-ovpn

clear
echo -e "===============================" | lolcat
echo -e "Done Install Ssh & Ovpn Websocket" | lolcat
echo -e "===============================" | lolcat
echo -e "PORT SSH NONTLS : 8880" | lolcat
echo -e "PORT SSH TLS    : 443" | lolcat
echo -e "PORT OVPN WS    : 2083" | lolcat
echo -e "==============================="
echo -e "Script By DP VPN" | lolcat
echo -e ""
echo -e ""
figlet DP VPN | lolcat -d 5

#EDUSSHSSL
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/edu/ws-stunnel
chmod +x /usr/local/bin/ws-stunnel

# INSTALLING SERVICE
cat > /etc/systemd/system/ws-stunnel.service << END
[Unit]
Description=Python Edu Ssl Proxy By DP VPN
Documentation=https://link.dpvpn.tk
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-stunnel
systemctl restart ws-stunnel

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local

[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99

[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# install wget and curl
apt -y install wget curl
apt -y install python

# text gambar
apt-get install boxes

# color text
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/wes/.bashrc"

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat -y

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat
apt install sslh -y

#konfigurasi
wget -O /etc/default/sslh "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/sslh/sslh-conf"
service sslh restart

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "figlet -f slant DP VPN | lolcat" >> .profile
echo "sleep 1" >> .profile
echo "clear" >> .profile
echo "neofetch" >> .profile
echo "echo -e \"\x1b[96m - Geo Gabut\x1b[m\"" >> .profile
echo "echo -e \"\x1b[96m - Silahkan Ketik\x1b[m \x1b[92mmenu\x1b[m \x1b[96mUntuk Melihat daftar Perintah\x1b[m\"" >> .profile

# install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/nginx.conf"
mkdir -p /home/vps/public_html
echo "<h1><center>Script Installer By : DP VPN</center></h1>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/vps.conf"
/etc/init.d/nginx restart

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# setting port ssh
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config

# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 69 -p 77"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# install squid
cd
apt -y install squid3
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[Sslws]
accept = 443
connect = 127.0.0.1:8880

[dropbear]
accept = 990
connect = 127.0.0.1:109

[dropbear]
accept = 445
connect = 127.0.0.1:22

[openvpn]
accept = 442
connect = 127.0.0.1:1194



END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# install python
apt -y install ruby
gem install lolcat
apt -y install figlet
apt -y install dos2unix

# download script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/menu.sh"
wget -O l2tp "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/l2tp.sh"
wget -O ssh "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/ssh.sh"
wget -O ssssr "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/ssssr.sh"
wget -O sstpp "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/sstpp.sh"
wget -O trojaan "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/trojaan.sh"
wget -O trojanGO "https://raw.githubusercontent.com/YakkoRasZ14/private/main/men/trojanGO.sh"
wget -O v2raay "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/v2raay.sh"
wget -O wgr "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/wgr.sh"
wget -O vleess "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/vleess.sh"
wget -O bbr "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/bbr.sh"
wget -O bannerku "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/bannerku"
wget -O add-host "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/add-host.sh"
wget -O about "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/about.sh"
wget -O usernew "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/hapus.sh"
wget -O member "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/member.sh"
wget -O delete "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/delete.sh"
wget -O cek "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/cek.sh"
wget -O restart "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/info.sh"
wget -O ram "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/ram.sh"
wget -O renew "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kenu/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/port-vless.sh"
wget -O wbmn "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/webmin.sh"
wget -O xp "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/xp.sh"
wget -O swap "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/swapkvm.sh"
wget -O user-limit "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/user-limit.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/auto-reboot.sh"
wget -O running "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/running.sh"
wget -O update "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kepo/update.sh"
wget -O cfd "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/cfd.sh"
wget -O cff "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/cff.sh"
wget -O cfh "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/cfh.sh"
wget -O add-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/add-trgo.sh"
wget -O xp-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/xp-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/cek-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/renew-trgo.sh"
wget -O port-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/port-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/men/del-trgo.sh"
wget -O /usr/bin/pointing https://www.dropbox.com/s/80b8hsh556jp774/pointing.sh && chmod +x /usr/bin/pointing && cd /usr/bin && apt install -y dos2unix && dos2unix pointing
wget -O /usr/bin/set-br https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/kebu/set-br.sh && chmod +x /usr/bin/set-br && cd /usr/bin && apt install -y dos2unix && dos2unix set-br
wget -O panel-domain "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/wes/panel-domain.sh"
wget -O /usr/bin/panel-domain https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/wes/panel-domain.sh && chmod +x /usr/bin/panel-domain && cd /usr/bin && apt install -y dos2unix && dos2unix panel-domain
wget -O panel-domain "https://raw.githubusercontent.com/dpvpn09/dpvpn2/main/wes/panel-domain.sh"
chmod +x menu
chmod +x l2tp
chmod +x ssh
chmod +x ssssr
chmod +x sstpp
chmod +x trojaan
chmod +x trojanGO
chmod +x v2raay
chmod +x wgr
chmod +x vleess
chmod +x bbr
chmod +x bannerku
chmod +x add-host
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x swap
chmod +x auto-reboot
chmod +x running
chmod +x update
chmod +x cfd
chmod +x cff
chmod +x cfh
chmod +x add-trgo
chmod +x xp-trgo
chmod +x cek-trgo
chmod +x renew-trgo
chmod +x port-trgo
chmod +x del-trgo

echo "0 5 * * * root clear-log" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
# remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh

apt install dnsutils jq -y
apt-get install net-tools -y
apt-get install tcpdump -y
apt-get install dsniff -y
apt install grepcidr -y

# finihsing
clear
