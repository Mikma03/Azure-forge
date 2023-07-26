
$FunctionURL="https://powershellfunctionapp120030.azurewebsites.net/api/storagefunction?code=D1C77FiXuFY1QaAGROraQEQaxaz/8l5Zl7yTRoIuNzY3wB8fMbYi7Q=="

$StorageDetails=@{
    "AccountName"="finalstore40008989"
    "AccountKind"="StorageV2"
    "AccountSku"="Standard_LRS"
    "ResourceGroupName"="powershell-grp"
    "Location"="North Europe"
} | ConvertTo-Json

$Response=Invoke-RestMethod -Uri $FunctionURL -Body $StorageDetails -Method Post -ContentType 'application/json'

$Response

