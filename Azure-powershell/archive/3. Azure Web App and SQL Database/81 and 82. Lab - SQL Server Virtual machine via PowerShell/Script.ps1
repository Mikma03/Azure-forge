<#
Most of the aspects of creating a SQL virtual machine is similar to that of creating
a normal virtual machine

For the Lab - Applying scripts on the SQL Server VM , the scripts are also contained
in this folder

#>

$ResourceGroupName ="powershell-grp"
$Location="North Europe"

$VirtualNetworkName="app-network"
$VirtualNetworkAddressSpace="10.0.0.0/16"
$SubnetName="dbsubnet"
$SubnetAddressSpace="10.0.1.0/24"

# Create the subnet resource

$SubnetA=New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressSpace

# Creating the Virtual Network

$VirtualNetwork = New-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName `
-Location $Location -AddressPrefix $VirtualNetworkAddressSpace -Subnet $SubnetA

$Subnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork

# Creating the Network Interface

$NetworkInterfaceName="db-interface"

$NetworkInterface = New-AzNetworkInterface -Name $NetworkInterfaceName `
-ResourceGroupName $ResourceGroupName -Location $Location `
-Subnet $Subnet

# Creating the Public IP Addresss

$PublicIPAddressName="db-ip"

$PublicIPAddress = New-AzPublicIpAddress -Name $PublicIPAddressName -ResourceGroupName $ResourceGroupName `
-Location $Location -Sku "Standard" -AllocationMethod "Static"

$IpConfig=Get-AzNetworkInterfaceIpConfig -NetworkInterface $NetworkInterface

$NetworkInterface | Set-AzNetworkInterfaceIpConfig -PublicIpAddress $PublicIPAddress `
-Name $IpConfig.Name

$NetworkInterface | Set-AzNetworkInterface

# Creating the Network Security Group

$SecurityRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Description "Allow-RDP" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 3389

$SecurityRule2=New-AzNetworkSecurityRuleConfig -Name "Allow-SQL" -Description "Allow-SQL" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 200 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 1433

$NetworkSecurityGroupName="db-nsg"

$NetworkSecurityGroup=New-AzNetworkSecurityGroup -Name $NetworkSecurityGroupName `
-ResourceGroupName $ResourceGroupName -Location $Location `
-SecurityRules $SecurityRule1,$SecurityRule2

$VirtualNetworkName="app-network"
$SubnetName="dbsubnet"
$SubnetAddressSpace="10.0.1.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetworkName -ResourceGroupName $ResourceGroupName

Set-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork `
-NetworkSecurityGroup $NetworkSecurityGroup `
-AddressPrefix $SubnetAddressSpace

$VirtualNetwork | Set-AzVirtualNetwork

# Creating the Azure Virtual Machine

$VmName="dbvm"
$VMSize = "Standard_DS2_v2"

$Location ="North Europe"
$UserName="sqladmin"
$Password="Azure@123"

$PasswordSecure=ConvertTo-SecureString -String $Password -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $UserName,$PasswordSecure

$NetworkInterfaceName="db-interface"
$NetworkInterface= Get-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $ResourceGroupName

$VmConfig=New-AzVMConfig -Name $VmName -VMSize $VMSize

Set-AzVMOperatingSystem -VM $VmConfig -ComputerName $VmName `
-Credential $Credential -Windows

Set-AzVMSourceImage -VM $VmConfig -PublisherName "MicrosoftSQLServer" `
-Offer "sql2019-ws2019" -Skus "sqldev" -Version "latest"

$Vm=Add-AzVMNetworkInterface -VM $VmConfig -Id $NetworkInterface.Id

Set-AzVMBootDiagnostic -Disable -VM $Vm

New-AzVM -ResourceGroupName $ResourceGroupName -Location $Location `
-VM $Vm

# Then we need to set the Custom Script Extensions to execute our custom PowerShell script
$AccountName="dbstore50009898"
$ResourceGroupName = "powershell-grp"
$ContainerName="scripts"
$StorageAccount=Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName 

$Blob=Get-AzStorageBlob -Blob "InitScript.ps1" -Container $ContainerName `
-Context $StorageAccount.Context
$blobUri=@($Blob.ICloudBlob.Uri.AbsoluteUri)
$settings = @{"fileUris" = $blobUri}


$StorageAccountKey=(Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -AccountName $AccountName)| Where-Object {$_.KeyName -eq "key1"}
$StorageAccountKeyValue=$StorageAccountKey.Value
$protectedSettings = @{"storageAccountName" = $AccountName; "storageAccountKey" = $StorageAccountKeyValue; "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File InitScript.ps1"};
$protectedSettings

Set-AzVMExtension -ResourceGroupName $ResourceGroupName -Location $Location `
-VMName $VMName -Name "ConfigureSQL" -Publisher "Microsoft.Compute" `
-ExtensionType "CustomScriptExtension" -TypeHandlerVersion "1.10" `
-Settings $settings -ProtectedSettings $protectedSettings







