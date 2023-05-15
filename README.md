# scripts
Networking project about setting a DHCP,local repository, and ssh and telnet in redhat 6.0

Configures the network interface eth0 with a static IP address, netmask, gateway, DNS servers, and other settings.
Restarts the network service to apply the new configuration.
Creates a directory "/TIGO" and copies RPM packages from a specified source to that directory.
Installs the deltarpm, python-deltarpm, and createrepo packages and creates a local YUM repository using the /TIGO directory.
Configures a YUM repository file named "james.repo" with the base URL pointing to the local repository.
Refreshes the YUM repository list and removes the packagekit.media repository.
Installs the DHCP server package and copies the sample configuration file to /etc/dhcp/dhcpd.conf.
Modifies the DHCP configuration file to set the subnet, IP range, domain name servers, routers, lease times, etc.
Enables and restarts the DHCP server service.
Installs the xinetd, telnet, and telnet-server packages for Telnet server support.
Restarts the xinetd service and configures it to start automatically.
Installs the portmap package required for remote procedure calls (RPC).
Installs the openssh-askpass, openssh-clients, and openssh-server packages for SSH server support.
Restarts the SSH, RPC, and xinetd services.
Creates a user named "james" for testing Telnet configurations.
Displays an ASCII art graphic.
