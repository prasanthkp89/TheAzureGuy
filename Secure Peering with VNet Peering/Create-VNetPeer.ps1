# Load the login and select subscription script
.\Login-AzureSubscription.ps1

# Get both of the virtual networks
$VNetA = Get-AzureRmVirtualNetwork -ResourceGroupName "RG-EUN-VirtualNetworks" -Name vnet1
$VNetB = Get-AzureRmVirtualNetwork -ResourceGroupName "RG-EUN-VirtualNetworks" -Name vnet2

# Add a peer in each direction
Add-AzureRmVirtualNetworkPeering -Name LinkToVNet2 -VirtualNetwork $VNetA -RemoteVirtualNetworkId $VNetB.Id
Add-AzureRmVirtualNetworkPeering -Name LinkToVNet1 -VirtualNetwork $VnetB -RemoteVirtualNetworkId $VNetA.Id