

Import-Module NetAdapter

###############
## Variables ##
###############

$NetAdapterAlias = Read-Host -Prompt "Enter the Network Interface You would like to set"
$NetAdapter = Get-NetAdapter -Name $NetAdapterAlias
$NetAdapterNewName = Read-Host -Prompt "Enter the New Name for the interface $NetAdapterAlias"
$NetIpAddress = Read-Host -Prompt "Enter your IP Address"
$NetIpLength = Read-Host -Prompt "Enter your IP Length"
$NetDefaultGateway = Read-Host -Prompt "Enter your Default Gateway"
$NetDNSAddress = Read-Host -Prompt "Enter your DNS Server Address"
$Hostname = Read-Host -Prompt "Enter your Hostname"

#################
## Main Script ##
#################

# Network Config
$NetAdapter | Set-NetIPInterface -DHCP Disabled
$NetAdapter | New-NetIPAddress -AddressFamily IPv4 -IPAddress $NetIpAddress -PrefixLength $NetIpLength -Type Unicast -DefaultGateway $NetDefaultGateway
Set-DnsClientServerAddress -InterfaceAlias $NetAdapterAlias -ServerAddresses $NetDNSAddress
Rename-NetAdapter -Name $NetAdapterAlias -NewName $NetAdapterNewName
###

# Hostname Config
Rename-Computer -NewName $Hostname
###

# Restart
Restart-Computer -Force
###