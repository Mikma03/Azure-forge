Connect-AzAccount

$scope="/subscriptions/6912d7a0-bc28-459a-9407-33bbba641c07/resourceGroups/powershell-grp"
$RoleAssignments=Get-AzRoleAssignment -Scope $scope

