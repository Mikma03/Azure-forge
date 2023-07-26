<#
Command Reference
1. New-AzResourceLock 
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcelock?view=azps-7.3.2

2. Get-AzResourceLock
https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azresourcelock?view=azps-7.3.2

3. Remove-AzResourceLock
https://docs.microsoft.com/en-us/powershell/module/az.resources/remove-azresourcelock?view=azps-7.3.2

#>

function Get-ResourceType
{
    param([String] $ResourceName)

    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.ResourceType
}

function Get-ResourceGroup
{
    param([String] $ResourceName)

    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.ResourceGroupName
}

Connect-AzAccount

# The following snippet of code is used to lock a resource based on the resource name
# -----------------------------------------------------------------------------------

$ResourceName="appvm"

New-AzResourceLock -LockLevel ReadOnly -LockName "LockA" `
-ResourceName $ResourceName -ResourceType (Get-ResourceType $ResourceName) `
-ResourceGroupName (Get-ResourceGroup $ResourceName) -Force

# -----------------------------------------------------------------------------------


# The following snippet of code is used to remove the resource lock
# -----------------------------------------------------------------

$Lock=Get-AzResourceLock -LockName "LockA" `
-ResourceName $ResourceName -ResourceType (Get-ResourceType $ResourceName) `
-ResourceGroupName (Get-ResourceGroup $ResourceName)

if($Lock -ne $null)
{
    Remove-AzResourceLock -LockName "LockA" `
    -ResourceName $ResourceName -ResourceType (Get-ResourceType $ResourceName) `
    -ResourceGroupName (Get-ResourceGroup $ResourceName) -Force
}

# -----------------------------------------------------------------------------------
