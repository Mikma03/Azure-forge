<#
Command Reference

1. New-AzOperationalInsightsWorkspace
https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/new-azoperationalinsightsworkspace?view=azps-7.3.0

2. Set-AzSqlDatabaseAudit
https://docs.microsoft.com/en-us/powershell/module/az.sql/set-azsqldatabaseaudit?view=azps-7.3.0

#>

$ResourceGroupName="powershell-grp"
$DatabaseName="appdb"

$ServerName=$null

$SQLServers=Get-AzSqlServer -ResourceGroupName $ResourceGroupName

foreach($SQLServer in $SQLServers)
{
    if(($SQLServer.ServerName.Contains("dbserver")))
    {
        $ServerName=$SQLServer.ServerName
        'The Server Name is ' + $ServerName
    }
}

# Here we are creating an Azure Log Analytics workspace

$WorkspaceName="db-workspace200"

$LogAnalyticsWorkspace=New-AzOperationalInsightsWorkspace -Location $Location `
-Name $WorkspaceName -ResourceGroupName $ResourceGroupName

# We can then stream the audit logs to the Log Analytics workspace

Set-AzSqlDatabaseAudit -ResourceGroupName $ResourceGroupName -ServerName $ServerName `
-DatabaseName $DatabaseName -LogAnalyticsTargetState Enabled `
-WorkspaceResourceId $LogAnalyticsWorkspace.ResourceId