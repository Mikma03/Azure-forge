<#
Command Reference

1. Loading assemblies in Windows PowerShell
https://docs.microsoft.com/en-us/sql/powershell/load-the-smo-assemblies-in-windows-powershell?view=sql-server-ver15

2. Install-PackageProvider
https://docs.microsoft.com/en-us/powershell/module/packagemanagement/install-packageprovider?view=powershell-7.2

3. Set-PSRepository
https://docs.microsoft.com/en-us/powershell/module/powershellget/set-psrepository?view=powershell-7.2

4. Install-Module
https://docs.microsoft.com/en-us/powershell/module/powershellget/install-module?view=powershell-7.2

5. New-NetFirewallRule
https://docs.microsoft.com/en-us/powershell/module/netsecurity/new-netfirewallrule?view=windowsserver2022-ps

#>

$assemblylist =
"Microsoft.SqlServer.Management.Common",  
"Microsoft.SqlServer.Smo",  
"Microsoft.SqlServer.Dmf ",  
"Microsoft.SqlServer.Instapi ",  
"Microsoft.SqlServer.SqlWmiManagement ",  
"Microsoft.SqlServer.ConnectionInfo ",  
"Microsoft.SqlServer.SmoExtended ",  
"Microsoft.SqlServer.SqlTDiagM ",  
"Microsoft.SqlServer.SString ",  
"Microsoft.SqlServer.Management.RegisteredServers ",  
"Microsoft.SqlServer.Management.Sdk.Sfc ",  
"Microsoft.SqlServer.SqlEnum ",  
"Microsoft.SqlServer.RegSvrEnum ",  
"Microsoft.SqlServer.WmiEnum ",  
"Microsoft.SqlServer.ServiceBrokerEnum ",  
"Microsoft.SqlServer.ConnectionInfoExtended ",  
"Microsoft.SqlServer.Management.Collector ",  
"Microsoft.SqlServer.Management.CollectorEnum",  
"Microsoft.SqlServer.Management.Dac",  
"Microsoft.SqlServer.Management.DacEnum",  
"Microsoft.SqlServer.Management.Utility"  
  
foreach ($asm in $assemblylist)  
{  
    $asm = [Reflection.Assembly]::LoadWithPartialName($asm)  
}  

$ServerName="dbvm"
$SQLServer = New-Object Microsoft.SqlServer.Management.Smo.Server($ServerName)
$SQLServer.Settings.LoginMode = 'Mixed'
$SQLServer.Alter()
Get-Service -Name 'MSSQLSERVER' | Restart-Service -Force

$LoginName="dbadmin"
$LoginPassword="Azure@123"
$ServerName="dbvm"

$PasswordSecure=ConvertTo-SecureString -String $LoginPassword -AsPlainText -Force

$DBCredentials = New-Object `
-TypeName System.Management.Automation.PSCredential -ArgumentList $LoginName,$PasswordSecure


$UserLogin = New-Object Microsoft.SqlServer.Management.Smo.Login($ServerName, $DBCredentials.UserName)
$UserLogin.LoginType = [Microsoft.SqlServer.Management.Smo.LoginType]::SqlLogin
$UserLogin.Create($DBCredentials.Password)
$UserLogin.AddToRole("sysadmin")
$UserLogin.Alter()


'1: Changed to Mixed Authentication Mode'

# Next we can create the database and create the User for the Login

Install-PackageProvider -Name NuGet -Force -Confirm:$False
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name SqlServer -AllowClobber -Confirm:$False

$LoginName="dbadmin"
$LoginPassword="Azure@123"
$DatabaseName="appdb"
$ServerName="dbvm"
$DBQuery="CREATE DATABASE appdb"


Invoke-SqlCmd -ServerInstance $ServerName -U $LoginName -p $LoginPassword -Query $DBQuery
'2: Created the database'


# We can then create the tables

$LoginName="dbadmin"
$LoginPassword="Azure@123"
$ServerName="dbvm"
$DatabaseName="appdb"
$ScriptFile="https://scriptstore4008989.blob.core.windows.net/scripts/init.sql"
$Destination="D:\init.sql"
'3: Tables created'

Invoke-WebRequest -Uri $ScriptFile -OutFile $Destination
Invoke-SqlCmd -ServerInstance $ServerName -InputFile $Destination -Database $DatabaseName -Username $LoginName -Password $LoginPassword

# We also need to allow traffic on port 1433 for the SQL Server
New-NetFirewallRule -DisplayName "Allow_1433" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
'4: Added the Firewall rule'

