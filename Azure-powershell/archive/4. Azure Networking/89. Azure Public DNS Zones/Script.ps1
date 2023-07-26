<#
Command Reference

1. New-AzDnsZone
https://docs.microsoft.com/en-us/powershell/module/az.dns/new-azdnszone?view=azps-7.3.0

2. New-AzDnsRecordSet
https://docs.microsoft.com/en-us/powershell/module/az.dns/new-azdnsrecordset?view=azps-7.3.0

3. New-AzDnsRecordConfig
https://docs.microsoft.com/en-us/powershell/module/az.dns/new-azdnsrecordconfig?view=azps-7.3.0

#>

$ResourceGroupName ="powershell-grp"
$DNSZoneName="cloudportalhub.com"

# Here we are creating a new Azure DNS Zone

$DNSZone=New-AzDnsZone -Name $DNSZoneName -ResourceGroupName $ResourceGroupName

foreach($NameServer in $DNSZone.NameServers)
{
    $NameServer
}

# We want to get the Public IP Address assigned to a Load Balancer

$LoadBalancerName="app-balancer"
$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$PublicIPAddressId=$LoadBalancer.FrontendIpConfigurations[0].PublicIpAddress.Id

$PublicIPAddressObj=Get-AzResource -ResourceId $PublicIPAddressId

$PublicIPAddress=Get-AzPublicIpAddress -Name $PublicIPAddressObj.Name

# We then create a new record set

New-AzDnsRecordSet -Name www -RecordType A -ZoneName $DNSZoneName `
-ResourceGroupName $ResourceGroupName -Ttl 3600 `
-DnsRecords (New-AzDnsRecordConfig -Ipv4Address $PublicIPAddress.IpAddress)


