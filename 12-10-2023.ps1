$rgname = "dev-app-rg"
$location = "west us"
$rgnamecheck = (Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue).ResourceGroupName
$locationcheck = (Get-AzResourceGroup -Name $rgname -ErrorAction SilentlyContinue).location
if(($rgname -eq $rgnamecheck) -and ($location.Replace(" ","").ToLower() -eq $locationcheck)){
    Write-Host "$rgname is exisitng" -ForegroundColor Green
}
elseif($rgname -eq $rgnamecheck){
    Write-Host "wrong location" -ForegroundColor Red
    Remove-AzResourceGroup -Name $rgname -Force
    New-AzResourceGroup -Name $rgname -Location $location
}
else {
    New-AzResourceGroup -Name $rgname -Location $location
}



#for loop
$rgnames = "dev-rg1","qa-rg1","uat-rg1","prod-rg1"
$location = "southcentralus","westus","eastus","westindia"
for($i=0; $i -lt $rgnames.Count; $i++){
    New-AzResourceGroup -Name $rgnames[$i] -location $location[$i]
}

for($i=1; $i -lt 101; $i++){
    $i
    $rgname = "devapp-rg" + $i
    New-AzResourceGroup -Name $rgname -Location 'westindia'
}

$i = 2
$name = "dev-rg" + $i
$name



for(1stpart ; 2ndpart ; 3rdpart){

}

1st part - where to start
2nd part- where to end
3rd part - how to iterate

for($i = 50; $i -lt 100; $i+=5){
    $i
}



cd - change directory
ls - list files and folders
cls - clear screen
mkdir - make directory
New-Item - helps you to create files
Get-Content - helps you to read file content