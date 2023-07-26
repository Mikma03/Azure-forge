<#
Command Reference
1. Invoke-AzResourceAction
https://docs.microsoft.com/en-us/powershell/module/az.resources/invoke-azresourceaction?view=azps-7.3.2

2. Move-AzResource
https://docs.microsoft.com/en-us/powershell/module/az.resources/move-azresource?view=azps-7.3.2

#>

function Get-ResourceGroupName {
    param (
        [String] $ResourceName
    )

    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.ResourceGroupName
    
}


function Get-ResourceGroupID {
    param (
        [String] $ResourceGroupName
    )

    $ResourceGroup=Get-AzResourceGroup -Name $ResourceGroupName
    return $ResourceGroup.ResourceId
}

function Get-ResourceId {
    param (
        [String] $ResourceName
    )

    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.ResourceId
    
}

$ResourceName="webapp98989"
$DestinationGroupName="staging-grp"

$SourceResourceGroupName=(Get-ResourceGroupName $ResourceName)
$SourceResourceGroupId=(Get-ResourceGroupID $SourceResourceGroupName)
$DestinationResourceGroupId=(Get-ResourceGroupID $DestinationGroupName)
$ResourceId=(Get-ResourceId $ResourceName)

# First we can validate the resource move

Invoke-AzResourceAction -Action validateMoveResources `
-ResourceId $SourceResourceGroupId `
-Parameters @{resources=@($ResourceId);targetResourceGroup= $DestinationResourceGroupId} `
-Force

# Then finally we can perform the resource move

Move-AzResource -DestinationResourceGroupName $DestinationGroupName `
-ResourceId $ResourceId