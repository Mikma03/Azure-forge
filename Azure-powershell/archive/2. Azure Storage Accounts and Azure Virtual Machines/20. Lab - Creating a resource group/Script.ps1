<#
Command Reference
1. Disable-AzContextAutosave
https://docs.microsoft.com/en-us/powershell/module/az.accounts/disable-azcontextautosave?view=azps-7.3.0

2. Connect-AzAccount
https://docs.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount?view=azps-7.3.0

3. New-AzResourceGroup
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-7.3.0

#>

# Here we don't want to save the Login information
 
Disable-AzContextAutosave

# Here we are connecting to our Azure Account

Connect-AzAccount

# Here we are creating a resource group

$ResourceGroupName ="powershell-grp"
$Location = "North Europe"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location