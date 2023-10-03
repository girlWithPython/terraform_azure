output "linux_nic_name" {
    value           =   azurerm_network_interface.nic.name
}

output "public_ip_address" {
    value           =   azurerm_public_ip.pip.ip_address
}

output "linux_vm_login" {
    value           = {
        "username"  =   azurerm_linux_virtual_machine.vm.admin_username
        "password"  =   azurerm_linux_virtual_machine.vm.admin_password
    }  
}

output "azurerm_public_ip_value" {
  value = azurerm_public_ip.pip.ip_address
}

# output "azurerm_public_ip_domain_name_label" {
#   value = azurerm_public_ip.JenkinsPublicIp.domain_name_label
# }

# output "azurerm_public_sku_value" {
#   value = azurerm_public_ip.JenkinsPublicIp.sku
# }

output "azurerm_network_interface_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "azurerm_network_interface_vm_id" {
  value = azurerm_network_interface.nic.virtual_machine_id
}

output "azurerm_linux_virtual_machine_id" {
  value = azurerm_linux_virtual_machine.vm.id
}
