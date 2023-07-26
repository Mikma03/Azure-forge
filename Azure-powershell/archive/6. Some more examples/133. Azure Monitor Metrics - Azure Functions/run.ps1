using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$ItemName=$Request.body.data.essentials.configurationItems[0]
$FunctionName=$TriggerMetadata.FunctionName
if($ItemName -ne $FunctionName)
{
    $OperationName=$Request.body.data.alertContext.operationName
    $OperationName
    if($OperationName -eq "Microsoft.Compute/virtualMachines/deallocate/action")
    {

        Write-Host $ItemName "has been deallocated"
        Write-Host "Starting the machine"

        $AppId=$env:AppId
        $AppSecret=$env:AppSecret

        $SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

        $Credential = New-Object -TypeName System.Management.Automation.PSCredential `
        -ArgumentList $AppId,$SecureSecret

        $TenantID="70c0f6d9-7f3b-4425-a6b6-09b47643ec58"

        Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantID 

        $Resource=Get-AzResource -Name $ItemName
        Start-AzVM -Name $ItemName -ResourceGroupName $Resource.ResourceGroupName
    }
}




