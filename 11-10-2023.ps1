Install
Import
Export
New
Get
Set
Remove
update
select

Connect-AzAccount

Get-AzSubscription

Select-AzSubscription -Subscription 'demo-azure'

New-AzResourceGroup -Name 'test-rg' -Location 'westus'
Get-AzResourceGroup -Name 'test-rg'

#foreach and for loop

$rgnames = "dev-app-rg1","qa-app-rg1","uat-app-rg1","prod-app-rg1"
$location = "southindia"

foreach($rg in $rgnames){
    $rg
    New-AzResourceGroup -Name $rg -Location $location 
    Write-Host "###########"
}

New-AzStorageAccount -ResourceGroupName 'dev-app-rg1' -Name 'devappsa1343f' -SkuName Standard_LRS -Location 'southindia' -Kind StorageV2


$env = "qa"
$rgname = $env + "-app-rg2"
$location = "westus"
$rgnamecheck = (Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue).ResourceGroupName
if($rgname -eq $rgnamecheck){
    Write-Host "$rgname already exists enter new name to create below"
    Get-AzResourceGroup | Where-Object {$_.ResourceGroupName -like "$env*"} | Format-Table
    $rg = Read-Host "enter a resourcegroup name"
    New-AzResourceGroup -Name $rg -Location $location
}
else{
    New-AzResourceGroup -Name $rgname -Location $location
}


$env = "qa"
$rgname = $env + "-app-rg2"
$location = "soUth inDia"
$rgnamecheck = (Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue).ResourceGroupName
if($rgname -eq $rgnamecheck){
    Write-Host "$rgname already exists"
    $locationcheck = (Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue).location
    if($location.Replace(" ","").ToLower() -eq $locationcheck){
        Write-Host "$location is valid"
    }
    else{
        Write-Host "Remove resource group as it is in wrong location"
        Remove-AzResourceGroup -Name $rgname -Force
        New-AzResourceGroup -Name $rgname -Location $location.Replace(" ","").ToLower()
    }
}
else{
    New-AzResourceGroup -Name $rgname -Location $location.Replace(" ","").ToLower()
}



$location = "SoUth InDia"
$locationcheck = "southindia"
if($location.Replace(" ","").ToLower() -eq $locationcheck){
    Write-Host "true" -ForegroundColor "Green"
}
else{
    Write-Host "false" -ForegroundColor "red"
}


