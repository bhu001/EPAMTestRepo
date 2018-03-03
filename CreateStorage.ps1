Login-AzureRmAccount
#$testResoucesGroup="TestResourceGroup"
#$location="Central India"

$resourcegpname=New-AzureRMResourceGroup -Name $testResoucesGroup -Location $location


#$storageAccountName = "testblbstorage"
$storageAccount = New-AzureRmStorageAccount -ResourceGroupName $resourcegpname -Name $storageAccountName -Location $location 