
<#
Command Reference
1. New-AzOperationalInsightsWorkspace
https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/new-azoperationalinsightsworkspace?view=azps-7.3.2

2. New-AzOperationalInsightsWindowsEventDataSource
https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/new-azoperationalinsightswindowseventdatasource?view=azps-7.3.2

3. Get-AzOperationalInsightsWorkspace
https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/get-azoperationalinsightsworkspace?view=azps-7.3.2

4. Get-AzOperationalInsightsWorkspaceSharedKeys
https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/get-azoperationalinsightsworkspacesharedkey?view=azps-7.3.2

#>

# The following snippet of code is used to create the Log Analytics workspace
# ---------------------------------------------------------------------------

$WorkspaceName="vmworkspace300499"
$ResourceGroupName="powershell-grp"
$Location="North Europe"

$LogAnalyticsWorkspace=New-AzOperationalInsightsWorkspace -Location $Location `
-Name $WorkspaceName -ResourceGroupName $ResourceGroupName

New-AzOperationalInsightsWindowsEventDataSource -ResourceGroupName $ResourceGroupName `
-WorkspaceName $WorkspaceName -EventLogName "Application" -CollectErrors `
-CollectWarnings -CollectInformation -Name "Application Event Logs"

# -----------------------------------------------------------------------------------

# The following snippet of code is used to connect a set of VM's to the  Log Analytics workspace
# ----------------------------------------------------------------------------------------------

$WorkspaceName="vmworkspace300499"
$ResourceGroupName="powershell-grp"
$Location="North Europe"

$LogAnalyticsWorkspace=Get-AzOperationalInsightsWorkspace -Name $WorkspaceName `
-ResourceGroupName $ResourceGroupName

$WorkspaceID=$LogAnalyticsWorkspace.CustomerId
$WorkspaceKey=(Get-AzOperationalInsightsWorkspaceSharedKeys `
-ResourceGroupName $ResourceGroupName -Name $WorkspaceName).PrimarySharedKey

$VMNames="appvm","appvm1"
$PublicSettings=@{"workspaceId" = $WorkspaceID}
$ProtectedSettings=@{"workspaceKey" = $WorkspaceKey}

foreach($VM in $VMNames)
{
    Set-AzVMExtension -ExtensionName "MicrosoftMonitoringAgent" `
    -ResourceGroupName $ResourceGroupName -VMName $VM `
    -Publisher "Microsoft.EnterpriseCloud.Monitoring" `
    -ExtensionType "MicrosoftMonitoringAgent" `
    -TypeHandlerVersion 1.0 `
    -Location $Location `
    -Settings $PublicSettings `
    -ProtectedSettings $ProtectedSettings
}

# ----------------------------------------------------------------------------------------------