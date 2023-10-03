output "virtual-network-name" {
    description     =   "Print the name of the virtual network"
    value           =   azurerm_virtual_network.vnet.name
}

output "virtual-network-ip-range" {
    description     =   "Print the ip range of the virtual network"
    value           =   azurerm_virtual_network.vnet.address_space
}

output "subnet-name" {
    description     =   "Print the name of the subnet"
    value           =   azurerm_subnet.web.name
}

output "subnet" {
    description     =   "Print the subnet"
    value           =   azurerm_subnet.web
}

output "subnet-ip-range" {
    description     =   "Print the ip range of the subnet"
    value           =   [azurerm_subnet.web.address_prefixes]
}
