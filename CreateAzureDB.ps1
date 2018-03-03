Login-AzureRmAccount
#$testResoucesGroup="TestResourceGroup"
#$location="Central India"

$resourcegpname=New-AzureRMResourceGroup -Name $testResoucesGroup -Location $location

#$adminlogin = "Admin1"
#$password = "12345@db"
#$servername = "tstenvdb"
#$databasename = "TestDB"

$server = New-AzureRmSqlServer -ResourceGroupName $resourcegroupname `
    -ServerName $servername `
    -Location $location `
    -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminlogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))

$database = New-AzureRmSqlDatabase  -ResourceGroupName $resourcegpname `
    -ServerName $servername `
    -DatabaseName $databasename `
    -RequestedServiceObjectiveName "S0" `
    -SampleName "AdventureWorksLT"