<#
Command Reference
1. New-AzActionGroupReceiver
https://docs.microsoft.com/en-us/powershell/module/az.monitor/new-azactiongroupreceiver?view=azps-7.3.2

2. Set-AzActionGroup
https://docs.microsoft.com/en-us/powershell/module/az.monitor/set-azactiongroup?view=azps-7.3.2

3. New-TimeSpan
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/new-timespan?view=powershell-7.2

4. New-AzMetricAlertRuleV2Criteria
https://docs.microsoft.com/en-us/powershell/module/az.monitor/new-azmetricalertrulev2criteria?view=azps-7.3.2

5. Add-AzMetricAlertRuleV2
https://docs.microsoft.com/en-us/powershell/module/az.monitor/add-azmetricalertrulev2?view=azps-7.3.2

#>

function Get-ResourceId
{
    param([String] $ResourceName)

    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.Id
}

# First we are creating an action group that will be attached to the alert rule

$ResourceGroupName="powershell-grp"
$ActionGroupName="AdminGroup"
$ReceiverGroupName="EmailAdmin"
$ReceiverGroupEmail="techsup4000@gmail.com"

$Receiver=New-AzActionGroupReceiver -Name $ReceiverGroupName `
-EmailReceiver -EmailAddress $ReceiverGroupEmail

$ActionGroup=Set-AzActionGroup -Name $ActionGroupName -ResourceGroupName $ResourceGroupName `
-ShortName $ActionGroupName -Receiver $Receiver

# Then finally we can create an alert rule
# The alert rule will check for the CPU Usage utilization of appvm
# If the CPU Utilization goes beyond 70% in the last 5 minutes , then the alert will be raised

$ResourceName="appvm"
$AlertName="CPUAlert"
$Threshold=70
$MetricName="Percentage CPU"
$Description="Alert when CPU percentage goes beyond 70%"
$WindowSize=New-TimeSpan -Minutes 5
$Frequency=New-TimeSpan -Minutes 5

$Condition=New-AzMetricAlertRuleV2Criteria -MetricName $MetricName `
-TimeAggregation Average -Operator GreaterThanOrEqual -Threshold $Threshold

Add-AzMetricAlertRuleV2 -Name $AlertName -ResourceGroupName $ResourceGroupName `
-Severity 3 -TargetResourceId (Get-ResourceId $ResourceName) `
-Description $Description -Condition $Condition `
-WindowSize $WindowSize -Frequency $Frequency -ActionGroupId $ActionGroup.Id

