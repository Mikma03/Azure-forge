# Next let's ensure that all traffic is diverted via the Firewall

# We have to first create a new route table
$ResourceGroupName="powershell-grp"
$Location="North Europe"

$RouteTable=New-AzRouteTable -Name "FirewallRouteTable" -ResourceGroupName $ResourceGroupName `
-Location $Location -DisableBgpRoutePropagation

# We then need to create a route
$FirewallName="app-firewall"
$Firewall=Get-AzFirewall -Name $FirewallName -ResourceGroupName $ResourceGroupName
$FirewallPrivateIPAddress=$Firewall.IpConfigurations[0].PrivateIPAddress

Add-AzRouteConfig -Name "FirewallRoute" -RouteTable $RouteTable `
-AddressPrefix 0.0.0.0/0 -NextHopType "VirtualAppliance" `
-NextHopIpAddress $FirewallPrivateIPAddress | Set-AzRouteTable

# Then we need to associate the route with the subnet of the Virtual Network

$VirtualNetworkName="app-network"
$ResourceGroupName="powershell-grp"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

Set-AzVirtualNetworkSubnetConfig -VirtualNetwork $VirtualNetwork -Name $SubnetName `
-AddressPrefix $SubnetAddressSpace -RouteTable $RouteTable | Set-AzVirtualNetwork

