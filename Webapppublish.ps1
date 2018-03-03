
Login-AzureRmAccount


$resourcegpname=New-AzureRMResourceGroup -Name $testResoucesGroup -Location $location

New-AzureRmAppServicePlan -Name $webappname -Location $location -ResourceGroupName $resourcegpname -Tier Free

New-AzureRmWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $resourcegpname

#moving code for STG to PROD

$staging=New-AzureRmWebAppSlot -Name $webappname -ResourceGroupName $resourcegpname -Slot STG -ConnectionStrings @{ STGDB = @{$STGDBCONNECTIONSTIRNG} }
$production=New-AzureRmWebAppSlot -Name $webappname -ResourceGroupName $resourcegpname -Slot PROD -ConnectionStrings @{ PRODDB = @{$PRODDBCONNECTIONSTIRNG} }

$PropertiesObject = @{
    repoUrl = "$coderepogitory";
    branch = "master";
}
Set-AzureRmResource -PropertyObject $PropertiesObject -ResourceGroupName $resourcegpname -ResourceType Microsoft.Web/sites/slots/sourcecontrols `
-ResourceName $webappname/$staging/web -ApiVersion 2015-08-01 -Force

Switch-AzureRmWebAppSlot -Name $webappname -ResourceGroupName $resourcegpname -SourceSlotName $staging -DestinationSlotName $production