
<#
Command Reference

1. New-AzTrafficManagerProfile
https://docs.microsoft.com/en-us/powershell/module/az.trafficmanager/new-aztrafficmanagerprofile?view=azps-7.3.2

2. Add-AzTrafficManagerEndpointConfig
https://docs.microsoft.com/en-us/powershell/module/az.trafficmanager/add-aztrafficmanagerendpointconfig?view=azps-7.3.2

3. Set-AzTrafficManagerProfile
https://docs.microsoft.com/en-us/powershell/module/az.trafficmanager/set-aztrafficmanagerprofile?view=azps-7.3.2

#>

# First we create the Traffic Manager Profile

$TrafficManagerProfileName="app-profile1000"
$ResourceGroupName ="powershell-grp"

$TrafficManagerProfile = New-AzTrafficManagerProfile -Name $TrafficManagerProfileName `
-ResourceGroupName $ResourceGroupName -TrafficRoutingMethod Priority -Ttl 30 `
-MonitorProtocol HTTP -MonitorPort 80 -MonitorPath "/" -RelativeDnsName "cloudportalhub"

# Then we add the Endpoints to the Traffic Manager Profile

$PublicIPAddresses=@()

$PublicIPAddresses=Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName `
| Where-Object {$_.Name -Like "app*"}

$i=1
foreach($PublicIPAddress in $PublicIPAddresses)
{
    Add-AzTrafficManagerEndpointConfig -EndpointName "Endpoint$i" `
-TrafficManagerProfile $TrafficManagerProfile -Type ExternalEndpoints `
-Target $PublicIPAddress.IpAddress -EndpointStatus Enabled `
-Priority $i

Set-AzTrafficManagerProfile -TrafficManagerProfile $TrafficManagerProfile

$i++
}

