<#
Command Reference

1. New-AzFirewallPolicy
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewallpolicy?view=azps-7.3.2

2. New-AzFirewall
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewall?view=azps-7.3.2

#>

# We first need to add a subnet to the Azure Virtual Network for hosting the Azure Firewall resource

$VirtualNetworkName="app-network"
$ResourceGroupName="powershell-grp"
$BastionSubnetName="AzureFirewallSubnet"
$BastionSubnetAddressSpace="10.0.1.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

Add-AzVirtualNetworkSubnetConfig -Name $BastionSubnetName `
-VirtualNetwork $virtualNetwork -AddressPrefix $BastionSubnetAddressSpace

$virtualNetwork | Set-AzVirtualNetwork

# We also need a public IP Address that is going to be assigned to the Azure Firewall resource

$PublicIPDetails=@{
    Name='firewall-ip'
    Location=$Location
    Sku='Standard'
    AllocationMethod='Static'
    ResourceGroupName=$ResourceGroupName
}

$FirewallPublicIP=New-AzPublicIpAddress @PublicIPDetails

# Now we need to deploy the Azure Firewall resource

$FirewallName="app-firewall"
$ResourceGroupName="powershell-grp"
$Location="North Europe"
$VirtualNetworkName="app-network"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

# We will also create a Firewall policy that will be attached to the Firewall resource
$FirewallPolicyName="firewall-policy"
$FirewallPolicy=New-AzFirewallPolicy -Name $FirewallPolicyName -ResourceGroupName $ResourceGroupName `
-Location $Location

$FirewallPublicIP=Get-AzPublicIpAddress -Name $PublicIPDetails.Name

$AzureFirewall = New-AzFirewall -Name $FirewallName -ResourceGroupName $ResourceGroupName `
-Location $Location -VirtualNetwork $VirtualNetwork -PublicIpAddress $FirewallPublicIP `
-FirewallPolicyId $FirewallPolicy.Id