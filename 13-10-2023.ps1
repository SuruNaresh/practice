$a = @( 
@{
    "name" = "uat-rg"
    "location" = "westus"
},
@{
    "name" = "prod-rg"
    "location" = "eastus"
}
)
for($i=0; $i -lt $a.Count; $i++){
    New-AzResourceGroup -Name $a.name[$i] -Location $a.location[$i]
}

$a.Count

foreach($b in $a){
    
    New-AzResourceGroup -Name $b.name -Location $b.location
}




function create-env
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $env
    )

    Process
    {
        $location = "eastus"
        $rgname = $env + '-rg1'
        $storagename = $env+'sa13refv'
        $containernames = "images","documents","backups"

        New-AzResourceGroup -Name $rgname -Location $location

        $storagedata = New-AzStorageAccount -ResourceGroupName $rgname -Name $storagename -SkuName Standard_LRS -Location 'westus' -Kind StorageV2
        $storagedata

        $keys = (Get-AzStorageAccountKey -ResourceGroupName $rgname -Name $storagedata.StorageAccountName).Value
        $keys

        $context = New-AzStorageContext -StorageAccountName $storagedata.StorageAccountName -StorageAccountKey $keys[0]
        $context

        foreach($container in $containernames){
            New-AzStorageContainer -Name $container -Context $context
        }
    }
}



function deleteall {
    Get-AzResourceGroup | Remove-AzResourceGroup -Force
}


$storagedata = New-AzStorageAccount -ResourceGroupName $rgname -Name $storagename -SkuName Standard_LRS -Location 'westus' -Kind StorageV2
$storagedata

$keys = (Get-AzStorageAccountKey -ResourceGroupName $rgname -Name $storagedata.StorageAccountName).Value
$keys

$context = New-AzStorageContext -StorageAccountName $storagedata.StorageAccountName -StorageAccountKey $keys[0]
$context

New-AzStorageContainer -Name 'test' -Context $context
New-AzStorageContainer -Name 'images' -Context $context


function add{
$a = Read-Host "add a first number "
$b = Read-Host "add a second number "
$c = [int]$a + [int]$b
$c
}


