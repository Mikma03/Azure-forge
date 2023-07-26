
<#
Command Reference
1. New-AzADUser
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azaduser?view=azps-7.3.2

2. Get-AzADUser
https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azaduser?view=azps-7.3.2

#>

Connect-AzAccount

$UserName="UserA"
$UserPrincipalName="UserA@techsup4000gmail.onmicrosoft.com"
$Password="Azure@123"
$PasswordSecure=ConvertTo-SecureString -String $Password -AsPlainText -Force

# The following command can be used to create a user in Azure AD
New-AzADUser -DisplayName $UserName `
-Password $PasswordSecure -UserPrincipalName $UserPrincipalName `
-MailNickName $UserName

# If you want to display all of the users
Get-AzADUser

# If you want to get certain user details

$UserPrincipalName="UserA@techsup4000gmail.onmicrosoft.com"
$User=Get-AzADUser -ObjectId $UserPrincipalName

# We can then assign an RBAC role to the user

$UserObjectID=$User.Id

$ResourceGroupName = "powershell-grp"
$Subcription=Get-AzSubscription -SubscriptionName "Azure Subscription 1"
$scope="/subscriptions/$Subcription/resourcegroups/$ResourceGroupName"
$RoleDefinition="Storage Account Contributor"

New-AzRoleAssignment -ObjectId $UserObjectID -RoleDefinitionName $RoleDefinition `
-Scope $scope

