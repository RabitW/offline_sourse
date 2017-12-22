#apt-get install pptpd
dpkg -i bcrelay_1.3.4+27+gddb30f8-1ubuntu1.1_amd64.deb
dpkg -i pptpd_1.3.4+27+gddb30f8-1ubuntu1.1_amd64.deb
vim /etc/pptpd.conf
localip 你的主机ip
remoteip 10.100.0.2-10

设置dns
vim /etc/ppp/pptpd-options

ms-dns 114.114.114.114
ms-dns 8.8.4.4

vim /etc/ppp/chap-secrets

# client	server	secret			IP addresses
test   pptpd    test  *

sudo /etc/init.d/pptpd restart

vim /etc/sysctl.conf
net.ipv4.ip_forward=1

sudo sysctl -p

iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE

#iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -j SNAT --to 192.168.15.50 

iptables-save >/etc/iptables-rules

vim  /etc/network/interfaces
pre-up iptables-restore </etc/iptables-rules

设置MTU，防止包过大：
sudo iptables -A FORWARD -s 10.100.0.0/24 -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1200

iptables-save >/etc/iptables-rules

iptables -nL --line-numbers