using namespace System.Net

# Input bindings are passed in via param block.

param($Request, $TriggerMetadata)

Import-Module Az.Resources
Import-Module Az.Accounts

$AppId=$env:AppId
$AppSecret=$env:AppSecret

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

$TenantID="70c0f6d9-7f3b-4425-a6b6-09b47643ec58"

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantID 

# Lets get the storage account details from the Body of the request
$AccountName=$Request.Body.AccountName
$AccountKind=$Request.Body.AccountKind
$AccountSKU=$Request.Body.AccountSKU
$ResourceGroupName=$Request.Body.ResourceGroupName
$Location=$Request.Body.Location

try {

    $StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
    -Location $Location -Kind $AccountKind -SkuName $AccountSKU  
    
    $ResponseMessage="The storage account got successfully created"
    Push-OutputBinding -Name response -Value ([HttpResponseContext]@{
        StatusCode = [System.Net.HttpStatusCode]::OK
        Body = ConvertTo-Json $ResponseMessage })
}
catch {
    $ResponseMessage="An Error has occured whilst creating the storage account - " + $_
    Push-OutputBinding -Name response -Value ([HttpResponseContext]@{
        StatusCode = [System.Net.HttpStatusCode]::OK
        Body = ConvertTo-Json $ResponseMessage })
    
}