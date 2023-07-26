<#
Command Reference
1. Get-AzRoleDefinition
https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroledefinition?view=azps-7.3.2

2. New-AzRoleAssignment
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azroleassignment?view=azps-7.3.2

#>

# First we need to get a current role definition
# Then we make the required changes to the Role definition

Connect-AzAccount

$RoleDefinition="Storage Account Contributor"
$Role=Get-AzRoleDefinition -Name $RoleDefinition

$Role.Id=$null
$Role.Name="Storage And Virtual Machine Contributor"
$Role.Description="Custom Role for Storage accounts and virtual machines"
$Role.Actions.Add("Microsoft.Compute/*/read")
$Role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$Role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")

$ResourceGroupName="powershell-grp"
$Subcription=Get-AzSubscription -SubscriptionName "Azure Subscription 1"
$scope="/subscriptions/$Subcription/resourcegroups/$ResourceGroupName"

$Role.AssignableScopes.Clear()
$Role.AssignableScopes.Add($scope)

New-AzRoleDefinition -Role $Role

# We can then assign the role to a service principal
$CustomRoleDefinition="Storage And Virtual Machine Contributor"
$CustomRole=Get-AzRoleDefinition -Name $CustomRoleDefinition

$ResourceGroupName = "powershell-grp"
$Subcription=Get-AzSubscription -SubscriptionName "Azure Subscription 1"
$scope="/subscriptions/$Subcription/resourcegroups/$ResourceGroupName"


$ServicePrincipalName="powershell"
$ServicePrincipal =Get-AzADServicePrincipal -DisplayName $ServicePrincipalName
$ServicePrincipalId=$ServicePrincipal.Id

New-AzRoleAssignment -ObjectId $ServicePrincipalId -RoleDefinitionId $CustomRole.Id `
-Scope $scope