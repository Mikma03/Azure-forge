<#
Command Reference

1. New-AzApplicationGatewayIPConfiguration
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayipconfiguration?view=azps-7.3.2

2. New-AzApplicationGatewayFrontendIPConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayfrontendipconfig?view=azps-7.3.2

3. New-AzApplicationGatewayFrontendPort
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayfrontendport?view=azps-7.3.2

4. New-AzApplicationGatewayBackendAddressPool
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewaybackendaddresspool?view=azps-7.3.2

5. New-AzApplicationGatewayBackendHttpSetting
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewaybackendhttpsetting?view=azps-7.3.2

6. New-AzApplicationGatewayHttpListener
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayhttplistener?view=azps-7.3.2

7. New-AzApplicationGatewayPathRuleConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewaypathruleconfig?view=azps-7.3.2

8. New-AzApplicationGatewayUrlPathMapConfig
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayurlpathmapconfig?view=azps-7.3.2

9. New-AzApplicationGatewayRequestRoutingRule
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewayrequestroutingrule?view=azps-7.3.2

10. New-AzApplicationGatewaySku
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgatewaysku?view=azps-7.3.2

11. New-AzApplicationGateway
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azapplicationgateway?view=azps-7.3.2

#>


# We need to give our service principal Contributor access at the Subscription Level
# This allows to add the Network Interfaces to the backend address pool of the Azure Application Gateway
# First we need to create a seperate subnet for the Application Gateway

$VirtualNetworkName="app-network"
$ResourceGroupName="powershell-grp"
$BastionSubnetName="AppGatewaySubnet"
$BastionSubnetAddressSpace="10.0.1.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

Add-AzVirtualNetworkSubnetConfig -Name $BastionSubnetName `
-VirtualNetwork $virtualNetwork -AddressPrefix $BastionSubnetAddressSpace

$virtualNetwork | Set-AzVirtualNetwork

# We also need a public IP Address that is going to be assigned to the Azure Application Gateway

$PublicIPDetails=@{
    Name='gateway-ip'
    Location=$Location
    Sku='Standard'
    AllocationMethod='Static'
    ResourceGroupName=$ResourceGroupName
}

# First we are going to create the Public IP Address that is going to be used by the Load Balancer
$PublicIP=New-AzPublicIpAddress @PublicIPDetails

# Then lets create the different initial configurations for the Application Gateway

# First is associating the gateway to the subnet

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

$AppGatewayConfig=New-AzApplicationGatewayIPConfiguration -Name "AppGatewayConfig" `
-Subnet $VirtualNetwork.Subnets[1]

# Then the FrontEnd IP Config

$PublicIP=Get-AzPublicIpAddress -Name $PublicIPDetails.Name

$AppGatewayFrontEndIPConfig=New-AzApplicationGatewayFrontendIPConfig `
-Name "FrontEndIPConfig" -PublicIPAddress $PublicIP

# Then the Frontend Port number

$AppGatewayFrontEndPort=New-AzApplicationGatewayFrontendPort `
-Name "FrontEndIPPort" -Port 80

# Then we will create the BackendAddress Pool and the HTTP Setting

$ResourceGroupName="powershell-grp"
$ImageNetworkInterface=Get-AzNetworkInterface -Name "img-interface" -ResourceGroupName $ResourceGroupName
$VideoNetworkInterface=Get-AzNetworkInterface -Name "vid-interface" -ResourceGroupName $ResourceGroupName

$VideoBackendAddressPool=New-AzApplicationGatewayBackendAddressPool -Name "VideoPool" `
-BackendIPAddresses $VideoNetworkInterface.IpConfigurations[0].PrivateIpAddress

$ImageBackendAddressPool=New-AzApplicationGatewayBackendAddressPool -Name "ImagePool" `
-BackendIPAddresses $ImageNetworkInterface.IpConfigurations[0].PrivateIpAddress

$HTTPSetting=New-AzApplicationGatewayBackendHttpSetting -Name "HTTPSetting" `
-Port 80 -Protocol Http -RequestTimeout 120 -CookieBasedAffinity Enabled



# We will then create the Listener
$Listener=New-AzApplicationGatewayHttpListener -Name "ListenerA" `
-Protocol Http -FrontendIPConfiguration $AppGatewayFrontEndIPConfig `
-FrontendPort $AppGatewayFrontEndPort

# We then need to add two path-based rules

$ImagePathRule=New-AzApplicationGatewayPathRuleConfig -Name "ImageRule" `
-Paths "/images/*" -BackendAddressPool $ImageBackendAddressPool -BackendHttpSettings $HTTPSetting

$VideoPathRule=New-AzApplicationGatewayPathRuleConfig -Name "VideoRule" `
-Paths "/videos/*" -BackendAddressPool $VideoBackendAddressPool -BackendHttpSettings $HTTPSetting

$PathMapConfig=New-AzApplicationGatewayUrlPathMapConfig -Name "URLMap" `
-PathRules $ImagePathRule,$VideoPathRule -DefaultBackendAddressPool $ImageBackendAddressPool `
-DefaultBackendHttpSettings $HTTPSetting

$RoutingRule=New-AzApplicationGatewayRequestRoutingRule -Name "RuleA" `
-RuleType PathBasedRouting -HttpListener $Listener -UrlPathMap $PathMapConfig

# Then we create the Azure Application gateway

$GatewaySku = New-AzApplicationGatewaySku -Name Standard_v2 -Tier Standard_v2 -Capacity 2

$ResourceGroupName="powershell-grp"
$Location="North Europe"

$ApplicationGateway=New-AzApplicationGateway -ResourceGroupName $ResourceGroupName `
-Name "app-gateway" -Sku $GatewaySku -Location $Location `
-GatewayIPConfigurations $AppGatewayConfig -FrontendIPConfigurations $AppGatewayFrontEndIPConfig `
-FrontendPorts $AppGatewayFrontEndPort -BackendAddressPools $ImageBackendAddressPool,$VideoBackendAddressPool `
-HttpListeners $Listener -BackendHttpSettingsCollection $HTTPSetting `
-RequestRoutingRules $RoutingRule -UrlPathMaps $PathMapConfig

