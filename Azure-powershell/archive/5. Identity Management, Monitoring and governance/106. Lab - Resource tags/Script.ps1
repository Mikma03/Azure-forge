<#
Command Reference
1. New-AzTag
https://docs.microsoft.com/en-us/powershell/module/az.resources/new-aztag?view=azps-7.3.2

2. Get-AzTag
https://docs.microsoft.com/en-us/powershell/module/az.resources/get-aztag?view=azps-7.3.2

#>

function Get-ResourceId
{
    param([String] $ResourceName)
    
    $Resource=Get-AzResource -Name $ResourceName
    return $Resource.Id
}

# The following snippet of code is used to add tags to a resource
# ---------------------------------------------------------------

$Tags = @{
    "Department" = "Logistics";
    "Tier" ="1"
}


$ResourceName="appvm"

New-AzTag -Tag $Tags -ResourceId (Get-ResourceId $ResourceName)

# ---------------------------------------------------------------

# The following snippet of code is used to get the tag keys and values
# --------------------------------------------------------------------

$ResourceName="appvm"
$TagsAssigned=Get-AzTag -ResourceId (Get-ResourceId $ResourceName)

$Keys=$TagsAssigned.Properties.TagsProperty.Keys

foreach($Key in $Keys)
{
    $TagsAssigned.Properties.TagsProperty.Item($Key)
}

# ---------------------------------------------------------------
