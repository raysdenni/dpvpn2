#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo -e  "${RED}Checking VPS${NC}"
sleep 2
IZIN=$( curl https://raw.githubusercontent.com/dpvpn09/ipvps/main/ipvps | grep $MYIP )
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
rm setup.sh
exit 0
fi
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi

echo -e "═════════════════════════════════════════════\e[m" | lolcat
echo -e "        $bl [System Auto Reboot Menu]          \e[m"
echo -e "═════════════════════════════════════════════\e[m" | lolcat
echo -e "$bd 1$bl] \e[m $bdSet Auto-Reboot Setiap 1 Jam"
echo -e "$bd 2$bl] \e[m $bdSet Auto-Reboot Setiap 6 Jam"
echo -e "$bd 3$bl] \e[m $bdSet Auto-Reboot Setiap 12 Jam"
echo -e "$bd 4$bl] \e[m $bdSet Auto-Reboot Setiap 1 Hari"
echo -e "$bd 5$bl] \e[m $bdSet Auto-Reboot Setiap 1 Minggu"
echo -e "$bd 6$bl] \e[m $bdSet Auto-Reboot Setiap 1 Bulan"
echo -e "$bd 7$bl] \e[m $bdMatikan Auto-Reboot"
echo -e "$bd 8$bl] \e[m $bdView reboot log"
echo -e "$bd 9$bl] \e[m $bdRemove reboot log"
echo -e "══════════════════════════════════════════════\e[m" | lolcat
echo -e "$bd Press CTRL+C to return\e[m"
read -p " Select options from (1-9):" x

if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
elif test $x -eq 6; then
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
elif test $x -eq 7; then
rm -f /etc/cron.d/reboot_otomatis
echo "Auto-Reboot successfully TURNED OFF."
elif test $x -eq 8; then
if [ ! -e /root/log-reboot.txt ]; then
	echo "No reboot activity found"
	else 
	echo 'LOG REBOOT'
	echo "-------"
	cat /root/log-reboot.txt
fi
elif test $x -eq 9; then
echo "" > /root/log-reboot.txt
echo "Auto Reboot Log successfully deleted!" | lolcat
else
echo "Options Not Found In Menu"
exit
fi
