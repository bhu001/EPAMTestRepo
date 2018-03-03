#Create Azure Amutomation account
#Deplo Scale in and Scale out power shell script
#Then set up the alert and webhook using below scripts



$actionEmail = New-AzureRmAlertRuleEmail -CustomEmail user@contoso.com
$actionWebhook = New-AzureRmAlertRuleWebhook -ServiceUri webhookurl
#$threshold = 50
#$resourcegpname="TestResourceGroup"
#$location="Central India"
#$id = resource-id-to-add-the-alert-to

#$alertName = "testalert"
#$metricName = metric-to-fire-the-alert-on  #CPU,IO,SIZE
#$timeWindow = time-window-in-hh:mm:ss-format
#$condition = condition-for-the-threshold
#$description = description-for-the-alert

Add-AzureRmMetricAlertRule  -Name  $alertName `
                            -Location  $location `
                            -ResourceGroup $rg `
                            -TargetResourceId $id `
                            -MetricName $metricName `
                            -Operator  $condition `
                            -Threshold $threshold `
                            -WindowSize  $timeWindow `
                            -TimeAggregationOperator Average `
                            -Actions $actionEmail, $actionWebhook `
                            -Description $description