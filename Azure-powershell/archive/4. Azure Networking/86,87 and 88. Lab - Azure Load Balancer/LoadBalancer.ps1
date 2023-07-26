<#
Command Reference

1. New-AzLoadBalancerFrontendIpConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azloadbalancerfrontendipconfig?view=azps-7.3.0

2. New-AzLoadBalancer
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azloadbalancer?view=azps-7.3.0

3. Get-AzLoadBalancer
https://docs.microsoft.com/en-us/powershell/module/az.network/get-azloadbalancer?view=azps-7.3.0

4. Add-AzLoadBalancerBackendAddressPoolConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/add-azloadbalancerbackendaddresspoolconfig?view=azps-7.3.0

5. Set-AzLoadBalancer
https://docs.microsoft.com/en-us/powershell/module/az.network/set-azloadbalancer?view=azps-7.3.0

6. Get-AzLoadBalancerBackendAddressPoolConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/get-azloadbalancerbackendaddresspoolconfig?view=azps-7.3.0

7. Add-AzLoadBalancerProbeConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/add-azloadbalancerprobeconfig?view=azps-7.3.0

8. Get-AzLoadBalancerProbeConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/get-azloadbalancerprobeconfig?view=azps-7.3.0

9. Add-AzLoadBalancerRuleConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/add-azloadbalancerruleconfig?view=azps-7.3.0

#>


$ResourceGroupName ="powershell-grp"
$Location="North Europe"

$PublicIPDetails=@{
    Name='load-ip'
    Location=$Location
    Sku='Standard'
    AllocationMethod='Static'
    ResourceGroupName=$ResourceGroupName
}

# First we are going to create the Public IP Address that is going to be used by the Load Balancer
$PublicIP=New-AzPublicIpAddress @PublicIPDetails

$FrontEndIP=New-AzLoadBalancerFrontendIpConfig -Name "load-frontendip" `
-PublicIpAddress $PublicIP

# Then we will create the Azure Load Balancer

$LoadBalancerName="app-balancer"

New-AzLoadBalancer -ResourceGroupName $ResourceGroupName -Name $LoadBalancerName `
-Location $Location -Sku "Standard" -FrontendIpConfiguration $FrontEndIP

# Here we will add the backend pool
$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$LoadBalancer | Add-AzLoadBalancerBackendAddressPoolConfig -Name "vmpool"

$LoadBalancer | Set-AzLoadBalancer

# Then we need to add the network interfaces of the virtual machines to the backend pool

$NetworkInterfaces=@()

$NetworkInterfaces=Get-AzNetworkInterface -ResourceGroupName $ResourceGroupName `
| Where-Object {$_.Name -Like "app-interface*"}

$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$BackendAddressPool=Get-AzLoadBalancerBackendAddressPoolConfig -Name "vmpool" `
-LoadBalancer $LoadBalancer

foreach($NetworkInterface in $NetworkInterfaces)
{
    $NetworkInterface.IpConfigurations[0].LoadBalancerBackendAddressPools=$BackendAddressPool
    $NetworkInterface | Set-AzNetworkInterface    
}

# Adding the Health Probe

$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$LoadBalancer | Add-AzLoadBalancerProbeConfig -Name "ProbeA" -Protocol "tcp" -Port "80" `
-IntervalInSeconds "10" -ProbeCount "2"

$LoadBalancer | Set-AzLoadBalancer

# Adding the Load Balancing Rule

$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$BackendAddressPool=Get-AzLoadBalancerBackendAddressPoolConfig -Name "vmpool" `
-LoadBalancer $LoadBalancer

$Probe=Get-AzLoadBalancerProbeConfig -Name "ProbeA" -LoadBalancer $LoadBalancer

$LoadBalancer | Add-AzLoadBalancerRuleConfig -Name "RuleA" -FrontendIpConfiguration $LoadBalancer.FrontendIpConfigurations[0] `
-Protocol "Tcp" -FrontendPort 80 -BackendPort 80 -BackendAddressPool $BackendAddressPool `
-Probe $Probe

$LoadBalancer | Set-AzLoadBalancer



