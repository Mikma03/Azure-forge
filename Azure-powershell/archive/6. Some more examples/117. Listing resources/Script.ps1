# First we need to list down all of the resource groups

$ResourceGroups=Get-AzResourceGroup

# Then we can get resources under the resource group
foreach($ResourceGroup in $ResourceGroups)
{
    $Resources+=Get-AzResource -ResourceGroupName $ResourceGroup.ResourceGroupName
}

# Then we can go through each resource 
# We can create an array of objects
$ResourceInformation=@()

foreach($Resource in $Resources)
{
    $ResourceInfo=[PSCustomObject]@{
    Name=$Resource.Name
    ResourceGroupName=$Resource.ResourceGroupName
    Location=$Resource.Location}
    $ResourceInformation+=$ResourceInfo
}

$ResourceInformation 
