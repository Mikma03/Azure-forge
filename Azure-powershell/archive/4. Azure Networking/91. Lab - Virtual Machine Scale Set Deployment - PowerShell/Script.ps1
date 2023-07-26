<#
Command Reference

1. New-AzVmssIpConfig
https://docs.microsoft.com/en-us/powershell/module/az.compute/new-azvmssipconfig?view=azps-7.3.0

2. New-AzVmssConfig
https://docs.microsoft.com/en-us/powershell/module/az.compute/new-azvmssconfig?view=azps-7.3.0

3. Set-AzVmssStorageProfile
https://docs.microsoft.com/en-us/powershell/module/az.compute/set-azvmssstorageprofile?view=azps-7.3.0

4. Set-AzVmssOsProfile
https://docs.microsoft.com/en-us/powershell/module/az.compute/set-azvmssosprofile?view=azps-7.3.0

5. Add-AzVmssNetworkInterfaceConfiguration
https://docs.microsoft.com/en-us/powershell/module/az.compute/remove-azvmssnetworkinterfaceconfiguration?view=azps-7.3.0

6. New-AzVmss
https://docs.microsoft.com/en-us/powershell/module/az.compute/new-azvmss?view=azps-7.3.0

#>
$ResourceGroupName ="powershell-grp"
$Location="North Europe"

$VirtualNetworkName="app-network"
$VirtualNetworkAddressSpace="10.0.0.0/16"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"

# Create the subnet resource

$Subnet=New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressSpace

# Next we can create the virtual network

$VirtualNetwork = New-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName `
-Location $Location -AddressPrefix $VirtualNetworkAddressSpace -Subnet $Subnet

# Deploy the Azure Load Balancer

$PublicIPDetails=@{
    Name='load-ip'
    Location=$Location
    Sku='Standard'
    AllocationMethod='Static'
    ResourceGroupName=$ResourceGroupName
}

$PublicIP=New-AzPublicIpAddress @PublicIPDetails

$FrontEndIP=New-AzLoadBalancerFrontendIpConfig -Name "load-frontendip" `
-PublicIpAddress $PublicIP

$LoadBalancerName="app-balancer"

New-AzLoadBalancer -ResourceGroupName $ResourceGroupName -Name $LoadBalancerName `
-Location $Location -Sku "Standard" -FrontendIpConfiguration $FrontEndIP

# Backend Pool
$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$LoadBalancer | Add-AzLoadBalancerBackendAddressPoolConfig -Name "vmpool"

$LoadBalancer | Set-AzLoadBalancer

# Here we will deploy the Azure Virtual Machine Scale set

$ScaleSetName="app-set"
$VMSize = "Standard_DS2_v2"

$Location ="North Europe"
$UserName="demousr"
$Password="Azure@123"

$LoadBalancer=Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName `
-Name $LoadBalancerName

$BackendAddressPool=Get-AzLoadBalancerBackendAddressPoolConfig -Name "vmpool" `
-LoadBalancer $LoadBalancer

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

# We want to ensure that the Virtual Machine Scale Set backend IP Addresses of the 
# Virtual Machines are added to the backend pool of the Load Balancer

$VmssIPConfig=New-AzVmssIpConfig -Name "IPConfigScaleSet" `
-SubnetId $VirtualNetwork.Subnets[0].Id -Primary `
-LoadBalancerBackendAddressPoolsId $BackendAddressPool.Id

$VmssConfig=New-AzVmssConfig -SkuName $VMSize -Location $Location `
-UpgradePolicyMode "Automatic" -SkuCapacity 2

Set-AzVmssStorageProfile $VmssConfig -ImageReferenceOffer "WindowsServer" `
-ImageReferenceSku "2019-Datacenter" -ImageReferencePublisher "MicrosoftWindowsServer" `
-ImageReferenceVersion "latest" -OsDiskCreateOption "FromImage"

Set-AzVmssOsProfile $VmssConfig -ComputerNamePrefix "app" `
-AdminUsername $UserName -AdminPassword $Password

Add-AzVmssNetworkInterfaceConfiguration -Name "NetworkConfig" `
-IpConfiguration $VmssIPConfig -VirtualMachineScaleSet $VmssConfig `
-Primary $true

New-AzVmss -ResourceGroupName $ResourceGroupName -VirtualMachineScaleSet $VmssConfig `
-Name $ScaleSetName

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

# Work with the Custom Script Extension
$config=@{
    "fileUris"=(,"https://vmstore40008989.blob.core.windows.net/scripts/IIS_Config.ps1");
    "commandToExecute" ="powershell -ExecutionPolicy Unrestricted -File IIS_Config.ps1"    
}

$ScaleSetName="app-set"

$VirtualMachineScaleSet=Get-AzVmss -ResourceGroupName $ResourceGroupName `
-VMScaleSetName $ScaleSetName

$VirtualMachineScaleSet=Add-AzVmssExtension -VirtualMachineScaleSet $VirtualMachineScaleSet `
-Name "WebScript" -Publisher "Microsoft.Compute" `
-Type "CustomScriptExtension" -TypeHandlerVersion 1.9 -Setting $config

Update-AzVmss -ResourceGroupName $ResourceGroupName -Name $ScaleSetName `
-VirtualMachineScaleSet $VirtualMachineScaleSet

# Then apply the Network Security Group

$ResourceGroupName ="powershell-grp"
$VirtualNetworkName="app-network"

$SecurityRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-HTTP" -Description "Allow-HTTP" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 200 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 80

$NetworkSecurityGroupName="app-nsg"
$Location ="North Europe"

$NetworkSecurityGroup=New-AzNetworkSecurityGroup -Name $NetworkSecurityGroupName `
-ResourceGroupName $ResourceGroupName -Location $Location `
-SecurityRules $SecurityRule1

$VirtualNetworkName="app-network"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

Set-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork `
-NetworkSecurityGroup $NetworkSecurityGroup `
-AddressPrefix $SubnetAddressSpace

$VirtualNetwork | Set-AzVirtualNetwork
