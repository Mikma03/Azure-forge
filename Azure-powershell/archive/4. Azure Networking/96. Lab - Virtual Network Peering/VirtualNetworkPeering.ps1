<#
Command Reference

1. Add-AzVirtualNetworkPeering
https://docs.microsoft.com/en-us/powershell/module/az.network/add-azvirtualnetworkpeering?view=azps-7.3.2

#>


$NetworkNames ="staging-network","test-network"

$VirtualNetworks=@{}
foreach($NetworkName in $NetworkNames)
{
    $VirtualNetworks.Add($NetworkName,(Get-AzVirtualNetwork -Name $NetworkName))
}

# We need to add a virtual network peering connections both ways

    Add-AzVirtualNetworkPeering `
    -Name "Staging-Test" `
    -VirtualNetwork $VirtualNetworks["staging-network"] `
    -RemoteVirtualNetworkId $VirtualNetworks["test-network"].Id


    Add-AzVirtualNetworkPeering `
    -Name "Test-Staging" `
    -VirtualNetwork $VirtualNetworks["test-network"] `
    -RemoteVirtualNetworkId $VirtualNetworks["staging-network"].Id
