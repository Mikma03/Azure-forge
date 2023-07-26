<#
Command Reference

1. New-AzFirewallPolicyRuleCollectionGroup
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewallpolicyrulecollectiongroup?view=azps-7.3.2

2. New-AzFirewallPolicyNatRule
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewallpolicynatrule?view=azps-7.3.2

3. New-AzFirewallPolicyNatRuleCollection
https://docs.microsoft.com/en-us/powershell/module/az.network/new-azfirewallpolicynatrulecollection?view=azps-7.3.2

4. Get-AzFirewallPolicyRuleCollectionGroup
https://docs.microsoft.com/en-us/powershell/module/az.network/get-azfirewallpolicyrulecollectiongroup?view=azps-7.3.2

5. Get-AzFirewallPolicy
https://docs.microsoft.com/en-us/powershell/module/az.network/get-azfirewallpolicy?view=azps-7.3.2

6. Set-AzFirewallPolicyRuleCollectionGroup 
https://docs.microsoft.com/en-us/powershell/module/az.network/set-azfirewallpolicyrulecollectiongroup?view=azps-7.3.2

#>

# We can then create a NAT Rule to ensure we can RDP into our VM

$FirewallPolicyName="firewall-policy"
$ResourceGroupName="powershell-grp"

$PublicIPDetails=@{
    Name='firewall-ip'
    Location=$Location
    Sku='Standard'
    AllocationMethod='Static'
    ResourceGroupName=$ResourceGroupName
}


$CollectionGroup = New-AzFirewallPolicyRuleCollectionGroup -Name "NATCollectionGroup" -Priority 200 `
-ResourceGroupName $ResourceGroupName -FirewallPolicyName $FirewallPolicyName

$VmName="appvm"
$NATRuleName="Allow-RDP-$VmName"
$MyIPAddress=Invoke-WebRequest -uri "https://ifconfig.me/ip" | Select-Object Content

$FirewallPublicIPAddress=(Get-AzPublicIpAddress -Name $PublicIPDetails.Name).IpAddress

# We need to get the private IP address assigned to appvm
$VMNetworkProfile=(Get-AzVm -Name $VmName).NetworkProfile
$NetworkInterface=Get-AzNetworkInterface -ResourceId $VMNetworkProfile.NetworkInterfaces[0].Id
$VMPrivateIPAddress=$NetworkInterface.IpConfigurations[0].PrivateIpAddress

$Rule1=New-AzFirewallPolicyNatRule -Name $NATRuleName -Protocol "TCP" -SourceAddress $MyIPAddress.Content `
-DestinationAddress $FirewallPublicIPAddress -DestinationPort "4000" `
-TranslatedAddress $VMPrivateIPAddress -TranslatedPort "3389"

$Collection=New-AzFirewallPolicyNatRuleCollection -Name "CollectionA" -Priority 1000 -Rule $Rule1 `
-ActionType "Dnat"

$CollectionGroup = Get-AzFirewallPolicyRuleCollectionGroup -Name "NATCollectionGroup" `
-ResourceGroupName $ResourceGroupName -AzureFirewallPolicyName $FirewallPolicyName

$CollectionGroup.Properties.RuleCollection.Add($Collection)

# We then update the Firewall accordingly
$FirewallPolicy = Get-AzFirewallPolicy -Name $FirewallPolicyName -ResourceGroupName $ResourceGroupName

Set-AzFirewallPolicyRuleCollectionGroup -Name "NATCollectionGroup" -Priority 200 `
-FirewallPolicyObject $FirewallPolicy -RuleCollection $CollectionGroup.Properties.RuleCollection
