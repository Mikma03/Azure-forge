using namespace System.Net

# Input bindings are passed in via param block.

param($Request, $TriggerMetadata)

Import-Module Az.Resources
Import-Module Az.Accounts

$AppId="30f052d3-afd5-42ca-a55f-8a8236f6493b"
$AppSecret="idV7Q~P5VP0MUBIzCOPFDV5ve7UWP5YLEDLV8"

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

$TenantID="70c0f6d9-7f3b-4425-a6b6-09b47643ec58"

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantID 

$AccountName = $Request.Query.StorageAccountName
$ResourceGroupName="powershell-grp"

$StorageAccount=Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName
$ResponseMessage="The kind of storage account is " + $StorageAccount.kind

Push-OutputBinding -Name response -Value ([HttpResponseContext]@{
    StatusCode = [System.Net.HttpStatusCode]::OK
    Body = $ResponseMessage })
