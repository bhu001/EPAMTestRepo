Set-ExecutionPolicy RemoteSigned
Add-AzureAccount

Publish-WebApptemplication.ps1 `  #Webapp power shell script
-Configuration C:\Path\ADVM-VM-test.json ` #Json tepmlate of VM
-SubscriptionName Testsubs `
-WebDeployPackage C:\Path\ADVM.zip `  #Peblisher profile of created web app
-AllowUntrusted `
-VMPassword @{name = "admin"; password = "12345678"} `
-Verbose