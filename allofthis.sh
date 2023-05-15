#!/bin/bash
# Configure eth0 network interface
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE="eth0"
BOOTPROTO="static"
IPADDR="10.200.200.7"
NETMASK="255.255.255.240"
GATEWAY="10.200.200.1"
DNS1="8.8.8.8"
DNS2="8.8.4.4"
MTU="1500"
NM_CONTROLLED="yes"
ONBOOT="yes"
EOF
service network restart
# Set up local YUM repository
mkdir /TIGO
cp -v "/media/RHEL_6.0 i386 Disc 1/Packages"/* /TIGO
yum install deltarpm python-deltarpm createrepo -y
createrepo -v /TIGO
cat <<EOF > /etc/yum.repos.d/james.repo
[server]
name=linux server
baseurl=file:///TIGO
enabled=1
gpgcheck=0
EOF
yum repolist
rm -rf /etc/yum.repos.d/packagekit.media.repo
yum repolist
# Install and configure DHCP server
yum install dhcp -y
cp -vf "/usr/share/doc/dhcp-4.1.1/dhcpd.conf.sample" /etc/dhcp/dhcpd.conf
sed -i '47s/.*/subnet 10.200.200.0 netmask 255.255.255.240 {/' /etc/dhcp/dhcpd.conf
sed -i '48s/.*/range 10.200.200.1 10.200.200.14; /' /etc/dhcp/dhcpd.conf
sed -i '49s/.*/option domain-name-servers 10.200.200.2; /' /etc/dhcp/dhcpd.conf
sed -i '50s/.*/option domain-name "asome.health"; /' /etc/dhcp/dhcpd.conf
sed -i '51s/.*/option routers 10.200.200.1 ; /' /etc/dhcp/dhcpd.conf
sed -i '52s/.*/default-lease-time 28800 ;/' /etc/dhcp/dhcpd.conf
sed -i '53s/.*/max-lease-time 45200; /' /etc/dhcp/dhcpd.conf
chkconfig dhcpd on
service dhcpd restart
# Install and configure Telnet server
yum install xinetd telnet telnet-server -y
service xinetd restart
chkconfig xinetd on
# Install and configure SSH server
yum install portmap -y
yum install openssh-askpass openssh-clients openssh-server -y
service sshd restart
service rpcbind restart
service xinetd restart
# Add a user for testing Telnet
useradd james
# Display ASCII art
cat <<EOF
      ________
     /  _____/\\
    /  /     \\ \\
   /  /       \\ \\
  /  /         \\ \\
 /__/__________\\ \\
 \\__\\__________/ \\
  \\ |         | |
   \\|  O   O  |/
    |    ∆    |
    |  \\___/  |
     \\_______/
EOF

