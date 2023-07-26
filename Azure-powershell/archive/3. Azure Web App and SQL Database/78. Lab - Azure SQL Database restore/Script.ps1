<#
Command Reference

1. Get-AzSqlDatabase
https://docs.microsoft.com/en-us/powershell/module/az.sql/get-azsqldatabase?view=azps-7.3.0

2. Restore-AzSqlDatabase
https://docs.microsoft.com/en-us/powershell/module/az.sql/restore-azsqldatabase?view=azps-7.3.0

#>

$ResourceGroupName="powershell-grp"
$ServerName="dbserver78e482"
$SourceDatabaseName="appdb"
$TargetDatabaseName="restored-db"

# We are just mentioning a time when it comes to the restore point

$RestorePointTime=(Get-Date).AddMinutes(-30)

# We first need to get our Azure SQL database

$Database=Get-AzSqlDatabase -ResourceGroupName $ResourceGroupName `
-ServerName $ServerName -DatabaseName $SourceDatabaseName

# Then we can restore the Azure SQL database

Restore-AzSqlDatabase -FromPointInTimeBackup -PointInTime $RestorePointTime `
-ResourceGroupName $ResourceGroupName -ServerName $Database.ServerName `
-TargetDatabaseName $TargetDatabaseName -ResourceId $Database.ResourceId `
-Edition "Standard" -ServiceObjectiveName "S0"