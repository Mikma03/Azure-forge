# Here we want to ensure that SQLServerScript.ps1 runs as the VM administrator

$ScriptFile="https://scriptstore4008989.blob.core.windows.net/scripts/SQLServerScript.ps1"
$Destination="D:\SQLServerScript.ps1"

Invoke-WebRequest -Uri $ScriptFile -OutFile $Destination

$Domain="dbvm"
$AdminUser="sqladmin"
$AdminPassword="Azure@123"

$credential = New-Object System.Management.Automation.PSCredential @(($Domain + "\" + $AdminUser), (ConvertTo-SecureString -String $AdminPassword -AsPlainText -Force))

Invoke-Command -FilePath $Destination -Credential $credential -ComputerName $Domain