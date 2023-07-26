
# We need to set the Authorization header first
# We need to get a bearer token first

$AppId="30f052d3-afd5-42ca-a55f-8a8236f6493b"
$AppSecret="idV7Q~P5VP0MUBIzCOPFDV5ve7UWP5YLEDLV8"
$TokenURI="https://login.microsoftonline.com/70c0f6d9-7f3b-4425-a6b6-09b47643ec58/oauth2/token"
$Resource="https://management.core.windows.net/"

$BodyRequest="grant_type=client_credentials&client_id=$AppId&client_secret=$AppSecret&resource=$Resource"

$AccessToken=Invoke-RestMethod -Method Post -Uri $TokenURI `
-Body $BodyRequest -ContentType  'application/x-www-form-urlencoded'

# Now we can make the request to list all resources
$SubscriptionId="6912d7a0-bc28-459a-9407-33bbba641c07"

$RequestURI="
https://management.azure.com/subscriptions/$SubscriptionId/resources?api-version=2021-04-01"

$Headers=@{}
$Headers.Add("Authorization","Bearer " + $AccessToken.access_token) 

$ResourceRequest=Invoke-RestMethod -Method Get -Uri $RequestURI -Headers $Headers

# Get all of the resources

$ResourceRequest.value