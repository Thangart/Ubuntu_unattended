STNAME='working'
USERNAME='tdo'
# IPADDRESS='10.0.5.5'
# NETMASK='255.255.240.0'
# GATEWAY='10.0.0.1'
# NAMESERVER='10.0.1.3 10.0.1.4'
PACKAGES='htop python3 vim rsync dnsutils less ntp'

###########################################
################ Repo #####################
###########################################
## sets the repo to the internal apt server

wget "" > /etc/apt/sources.list

###########################################
################# Updates #################
###########################################
apt-get update && apt-get upgrade -y
# apt-get dist-upgrade

###########################################
################## Apps ###################
###########################################
apt-get install $PACKAGES -y

###########################################
################## SSH ####################
###########################################

## Add SSH Key for default user
mkdir /home/$USERNAME/.ssh/
cat > /home/$USERNAME/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC8dQJ0fad01olNY9go8OAJd/YffKi3SfZc0X5iweQCE/iS35+kJEq3JOoITaX3BEO/eHZ5WrwnH1CO1h0RlgSDq8VSTN+8dDJEcb4KlGRSO46pnMLBtWHqL725TqvrXnVe4HRBsIlphlGRCPPKRPPqm9ZgM/HiU1IqbyqVBNPMXeVfH3qVS+QNRHluirQAO3Opv11MNm8ggj8fozuZHuOCNMWmEJlt7WDHmGE8ihL5gaQOFy3GFU/pmZls+IWGm6pMQ774aQV3kRFcCHECPZ6O6C+XU0SVTDqmu0aRawYlMlxu4XspMstHo21izwAPvzQhkYcqX7pGEDnog/OmGA3 stefan@Thangardium
EOF
chmod 700 /home/$USERNAME/.ssh
chmod 600 /home/$USERNAME/.ssh/authorized_keys
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh
## Add SSH Key for root user
#mkdir /root/.ssh/
#cat > /root/.ssh/authorized_keys <<EOF
#SSH-KEY HERE
#EOF
#chmod 700 /root/.ssh
#chmod 600 /root/.ssh/authorized_keys
#chown -R root:root /root/.ssh
#
## Edit /etc/ssh/sshd_config
sed -i '/^PermitRootLogin/s/prohibit-password/yes/' /etc/ssh/sshd_config
sed -i -e 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config

###########################################
################# Network #################
###########################################
#mv /etc/network/interfaces /etc/network/interfaces.bk
#cat > /etc/network/interfaces <<EOF
#auto lo eth0
#iface lo inet loopback
#iface eth0 inet static
#address $IPADDRESS
#netmask $NETMASK
#gateway $GATEWAY
#dns-nameservers $NAMESERVER
#EOF

###########################################
############# Change Hostname #############
###########################################
#hostn=$(cat /etc/hostname)
#sudo sed -i "s/$hostn/$HOSTNAME/g" /etc/hosts
#sudo sed -i "s/$hostn/$HOSTNAME/g" /etc/hostname
sudo reboot
