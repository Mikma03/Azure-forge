$TrafficManagerProfileName="app-profile1000"
$ResourceGroupName ="powershell-grp"

$TrafficManagerProfile = New-AzTrafficManagerProfile -Name $TrafficManagerProfileName `
-ResourceGroupName $ResourceGroupName -TrafficRoutingMethod Priority -Ttl 30 `
-MonitorProtocol HTTP -MonitorPort 80 -MonitorPath "/" -RelativeDnsName "cloudportalhub"

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

