#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo -e  "${RED}Checking VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/raysdenni/dpvpn2/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${GREEN}Permission Accepted...${NC}"
sleep 2 
else
clear
echo -e ""
echo -e "======================================="
echo -e ""
echo -e "${RED}Permission Denied...!!! ${NC}"
echo -e "IP VPS ANDA BELUM TERDAFTAR"
echo -e "Contact WA https//wa.me/+6281285970456"
echo -e "For Registration IP VPS"
echo -e ""
echo -e "======================================="
echo -e ""
exit 0
fi

clear
echo "Starting Update" | lolcat
echo "" | lolcat
echo "................." | lolcat
# update
cd /usr/bin

wget -O set-br "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/set-br.sh"
wget -O /usr/bin/set-br https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/set-br.sh && chmod +x /usr/bin/set-br && cd /usr/bin && apt install -y dos2unix && dos2unix set-br
wget -O host "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/host.sh"
wget -O /usr/bin/host https://raw.githubusercontent.com/raysdenni/dpvpn2/main/host.sh && chmod +x /usr/bin/host && cd /usr/bin && apt install -y dos2unix && dos2unix host
wget -O /usr/bin/trialws https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/trialws.sh && chmod +x /usr/bin/trialws && cd /usr/bin && apt install -y dos2unix && dos2unix trialws
wget -O menu "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/menu.sh"
wget -O l2tp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/l2tp.sh"
wget -O ssh "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/ssh.sh"
wget -O ssssr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/ssssr.sh"
wget -O sstpp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/sstpp.sh"
wget -O trojaan "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/trojaan.sh"
#wget -O trojanGO "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/trojanGO.sh"
wget -O v2raay "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/v2raay.sh"
wget -O wgr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/wgr.sh"
wget -O vleess "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/vleess.sh"
wget -O bbr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/bbr.sh"
wget -O bannerku "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/bannerku"
wget -O add-host "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-host.sh"
wget -O about "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/about.sh"
wget -O usernew "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/hapus.sh"
wget -O member "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/member.sh"
wget -O delete "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/delete.sh"
wget -O cek "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek.sh"
wget -O restart "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/restart.sh"
wget -O info "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/info.sh"
wget -O ram "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/ram.sh"
wget -O renew "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-wg.sh"
wget -O port-tr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-tr.sh"
wget -O port-sstp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-sstp.sh"
wget -O port-squid "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-squid.sh"
wget -O port-ws "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-ws.sh"
wget -O port-vless "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/port-vless.sh"
wget -O swap "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/swapkvm.sh"
wget -O user-limit "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/user-limit.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/auto-reboot.sh"
wget -O running "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/running.sh"
#wget -O /usr/bin/geo https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/geo.sh && chmod +x /usr/bin/geo && cd /usr/bin && apt install -y dos2unix && dos2unix geo
wget -O update "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kepo/update.sh"
wget -O cfd "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cfd.sh"
wget -O cff "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cff.sh"
wget -O cfh "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cfh.sh"
wget -O add-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/add-trgo.sh"
wget -O xp-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/xp-trgo.sh"
wget -O cek-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/cek-trgo.sh"
wget -O renew-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/renew-trgo.sh"
wget -O port-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/men/port-trgo.sh"
wget -O del-trgo "https://raw.githubusercontent.com/raysdenni/dpvpn2e/main/men/del-trgo.sh"
wget -O add-ws "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/geogabut/private/main/kebu/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-tr.shsh"
wget -O add-l2tp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-l2tp.sh"
wget -O del-l2tp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-l2tp.sh"
wget -O add-pptp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-pptp.sh"
wget -O del-pptp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-pptp.sh"
wget -O cek-pptp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-pptp.sh"
wget -O renew-pptp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-pptp.sh"
wget -O renew-l2tp "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-l2tp.sh"
wget -O add-ss "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-ss.sh"
wget -O del-ss "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-ss.sh"
wget -O cek-ss "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-ss.sh"
wget -O renew-ss "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-ss.sh"
wget -O add-ssr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-ssr.sh"
wget -O del-ssr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-ssr.sh"
wget -O renew-ssr "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-ssr.sh"
Wget -O add-wg "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/add-wg.sh"
wget -O del-wg "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/del-wg.sh"
wget -O cek-wg "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/cek-wg.sh"
wget -O renew-wg "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/kebu/renew-wg.sh"
wget -O /usr/bin/bw https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/bw.sh && chmod +x /usr/bin/bw && cd /usr/bin && apt install -y dos2unix && dos2unix bw
wget -O format "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/format"
wget -O /usr/bin/format https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/format && chmod +x /usr/bin/format && cd /usr/bin && apt install -y dos2unix && dos2unix format
wget -O panel-domain "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/panel-domain.sh"
wget -O /usr/bin/panel-domain https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/panel-domain.sh && chmod +x /usr/bin/panel-domain && cd /usr/bin && apt install -y dos2unix && dos2unix panel-domain
wget -O panel-domain "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/panel-domain.sh"
wget -O user-delete-expired "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-delete-expired"
wget -O user-generate "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-generate"
wget -O user-list "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-list"
wget -O user-lock "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-lock"
wget -O user-password "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-password"
wget -O user-unlock "https://raw.githubusercontent.com/raysdenni/dpvpn2/main/wes/user-unlock"

chmod +x set-br
chmod +x bw
chmod +x format
chmod +x panel-domain
chmod +x user-delete-expired
chmod +x user-generate
chmod +x user-list
chmod +x user-lock
chmod +x user-password
chmod +x user-unlock
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
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x add-l2tp
chmod +x del-l2tp
chmod +x add-pptp
chmod +x del-pptp
chmod +x cek-pptp
chmod +x renew-pptp
chmod +x renew-l2tp
chmod +x add-ss
chmod +x del-ss
chmod +x cek-ss
chmod +x renew-ss
chmod +x add-ssr
chmod +x del-ssr
chmod +x renew-ssr
chmod +x add-wg
chmod +x del-wg
chmod +x cek-wg
chmod +x renew-wg

sed -i -e 's/\r$//' add-l2tp

clear
echo " Successfully Update :" | lolcat
echo " - Fix minor Bugs"
echo " ................." | lolcat
sleep 5
rm -f update.sh
