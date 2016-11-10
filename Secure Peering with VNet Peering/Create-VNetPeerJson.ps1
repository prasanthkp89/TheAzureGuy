# Load the login and select subscription script
.\Login-AzureSubscription.ps1

$RgName = (Get-AzureRmResourceGroup -Name "TheAzureGuy").ResourceGroupName
New-AzureRmResourceGroupDeployment -Name "NewStorage" -TemplateFile .\ProvisionStorageAccount.json -ResourceGroupName $RgName `
    -name "saeuntheazureguy" `
    -accountType "Standard_LRS" `
    -location "northeurope" `
    -encryptionEnabled $false