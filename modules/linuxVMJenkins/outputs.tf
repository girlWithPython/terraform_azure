output "linuxJenkins_nic_name" {
    value           =   azurerm_network_interface.nic.name
}

output "azurerm_Jenkins_public_ip_value" {
  value = azurerm_public_ip.pip.ip_address
}

output "azurerm_Jenkins_public_ip_domain_name_label" {
  value = azurerm_public_ip.pip.domain_name_label
}

output "azurerm_Jenkins_public_sku_value" {
  value = azurerm_public_ip.pip.sku
}

output "azurerm_Jenkins_network_interface_private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "azurerm_Jenkins_network_interface_vm_id" {
  value = azurerm_network_interface.nic.id
}

output "azurerm_linux_virtual_machine_with_Jenkins_id" {
  value = azurerm_linux_virtual_machine.LinuxVMWithJenkins.id
}
