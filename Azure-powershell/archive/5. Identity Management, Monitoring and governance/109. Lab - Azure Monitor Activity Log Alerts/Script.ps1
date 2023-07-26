<#
Command Reference
1. New-AzActivityLogAlertCondition
https://docs.microsoft.com/en-us/powershell/module/az.monitor/new-azactivitylogalertcondition?view=azps-7.3.2

2. Set-AzActivityLogAlert
https://docs.microsoft.com/en-us/powershell/module/az.monitor/set-azactivitylogalert?view=azps-7.3.2

#>


$ResourceGroupName="powershell-grp"
$ActionGroupName="AdminGroup"
$ActionGroup=Get-AzActionGroup -Name $ActionGroupName -ResourceGroupName $ResourceGroupName

$AlertName="ActivityLogAlert"
$Location="Global"
$Subcription=Get-AzSubscription -SubscriptionName "Azure Subscription 1"
$scope="/subscriptions/$Subcription"

<# We are creating an alert rule whenever a deallocation operation is performed on 
any Virtual machine within the scope of the subscription
#>

$Conditions=@()
$Conditions+=New-AzActivityLogAlertCondition -Field "category" -Equal "Administrative"
$Conditions+=New-AzActivityLogAlertCondition -Field "operationName" `
-Equal "Microsoft.Compute/virtualMachines/deallocate/action"

Set-AzActivityLogAlert -Location $Location `
-Name $AlertName -ResourceGroupName $ResourceGroupName `
-Scope $scope -Condition $Conditions `
-Action (New-Object Microsoft.Azure.Management.Monitor.Models.ActivityLogAlertActionGroup $ActionGroup.Id)