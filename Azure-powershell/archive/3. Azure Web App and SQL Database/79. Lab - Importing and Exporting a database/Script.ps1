<#
Command Reference

1. New-AzSqlDatabaseExport
https://docs.microsoft.com/en-us/powershell/module/az.sql/new-azsqldatabaseexport?view=azps-7.3.0

2. Get-AzSqlDatabaseImportExportStatus
https://docs.microsoft.com/en-us/powershell/module/az.sql/get-azsqldatabaseimportexportstatus?view=azps-7.3.0

3. New-AzSqlDatabaseImport
https://docs.microsoft.com/en-us/powershell/module/az.sql/new-azsqldatabaseimport?view=azps-7.3.0

#>

# We are first going to create the storage account that is going to be used for storing the database backup 

$ResourceGroupName = "powershell-grp"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS"
$Location="North Europe"
$ContainerName="sqlbackup"
$AccountName="dbstore50009898"

$StorageAccount =New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
-Name $AccountName -Location $Location -Kind $AccountKind -SkuName $AccountSKU

$Container=$null

$Container=New-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context `
-Permission Blob

# We will then export our source database

$SourceDatabaseName ="appdb"
$SourceDatabaseServer="dbserver78e482"
$UserName="sqladmin"
$Password="Azure@123"

$PasswordSecure=ConvertTo-SecureString -String $Password -AsPlainText -Force

$blobUri=$Container.CloudBlobContainer.Uri.AbsoluteUri + "/sqlbackup.bacpac"

$StorageAccountKey=(Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName `
-AccountName $AccountName) | Where-Object {$_.KeyName -eq "key1"}

$StorageAccountKeyValue=$StorageAccountKey.Value

$DatabaseExport=New-AzSqlDatabaseExport -ResourceGroupName $ResourceGroupName `
-ServerName $SourceDatabaseServer -DatabaseName $SourceDatabaseName `
-AdministratorLogin $UserName -AdministratorLoginPassword $PasswordSecure `
-StorageKeyType StorageAccessKey -StorageKey $StorageAccountKeyValue -StorageUri $blobUri

# To see the database export status

Get-AzSqlDatabaseImportExportStatus -OperationStatusLink `
$DatabaseExport.OperationStatusLink

# Creating the new database

$ResourceGroupName="powershell-grp"

$TargetLocation="UK South"
$TargetServerName="newserver" + (New-Guid).ToString().Substring(1,6)
$TargetAdminUser="sqladmin"
$TargetAdminPassword="Azure@123"
$TargetDatabaseName="newdb"

$TargetPasswordSecure=ConvertTo-SecureString -String $TargetAdminPassword -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $TargetAdminUser,$TargetPasswordSecure

New-AzSQLServer -ResourceGroupName $ResourceGroupName -ServerName $TargetServerName `
-Location $TargetLocation -SqlAdministratorCredentials $Credential

New-AzSqlDatabase -ResourceGroupName $ResourceGroupName -DatabaseName $TargetDatabaseName `
-RequestedServiceObjectiveName "S0" -ServerName $TargetServerName

$IPAddress=Invoke-WebRequest -uri "https://ifconfig.me/ip" | Select-Object Content

New-AzSqlServerFirewallRule -ResourceGroupName $ResourceGroupName `
-ServerName $TargetServerName -FirewallRuleName "Allow-Client" `
-StartIpAddress $IPAddress.Content -EndIpAddress $IPAddress.Content

# Then perform the database import process

$DatabaseImport=New-AzSqlDatabaseImport -DatabaseName $TargetDatabaseName `
-ServiceObjectiveName "S3" -Edition "Standard" -DatabaseMaxSizeBytes 268435456000 `
-AdministratorLogin $TargetAdminUser -AdministratorLoginPassword $TargetPasswordSecure `
-ServerName $TargetServerName -ResourceGroupName $ResourceGroupName `
-StorageKeyType StorageAccessKey -StorageKey $StorageAccountKeyValue -StorageUri $blobUri

# To see the database import status

Get-AzSqlDatabaseImportExportStatus -OperationStatusLink `
$DatabaseImport.OperationStatusLink
