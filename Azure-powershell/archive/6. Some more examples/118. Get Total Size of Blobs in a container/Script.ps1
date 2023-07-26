$AccountName = "vmstore3465663"
$ResourceGroupName="powershell-grp"
$ContainerName="data"

$StorageAccount=Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName

$Container=Get-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context

$Blobs=Get-AzStorageBlob -Name $ContainerName -Context $StorageAccount.Context

$TotalSize=0
foreach($Blob in $Blobs)
{
    $TotalSize+=$Blob.Length
}

"Total Size is " + ($TotalSize/1024/1024) + "MB"