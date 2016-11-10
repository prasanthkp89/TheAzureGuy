# Load the login and select subscription script
.\Login-AzureSubscription.ps1

$RgName = (Get-AzureRmResourceGroup -Name "TheAzureGuy").ResourceGroupName
New-AzureRmResourceGroupDeployment -Name "VNetPeer1" -TemplateFile .\VNetPeer1.json -ResourceGroupName $RgName
New-AzureRmResourceGroupDeployment -Name "VNetPeer2" -TemplateFile .\VNetPeer2.json -ResourceGroupName $RgName