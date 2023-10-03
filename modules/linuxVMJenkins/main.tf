#
# - Public IP (To Login to Linux VM)
#

resource "azurerm_public_ip" "pip" {
    name                              =   "${var.prefix}-linuxvm-public-ip"
    resource_group_name               =   var.resource_group_name
    location                          =   var.location
    allocation_method                 =   var.allocation_method[0]
    tags                              =   var.tags
}

#
# - Create a Network Interface Card for Virtual Machine
#

resource "azurerm_network_interface" "nic" {
    name                              =   "${var.prefix}-linuxvm-nic"
    resource_group_name               =   var.resource_group_name
    location                          =   var.location
    tags                              =   var.tags
    ip_configuration                  {
        name                          =  "${var.prefix}-nic-ipconfig"
        #subnet_id                     =   azurerm_subnet.web.id
        subnet_id                     =   var.subnet_id
        public_ip_address_id          =   azurerm_public_ip.pip.id
        private_ip_address_allocation =   var.allocation_method[1]
    }
}


#
# - Create a Linux Virtual Machine
# 

resource "azurerm_linux_virtual_machine" "LinuxVMWithJenkins" {
  location              = var.location
  name                  = "LinuxVMWithJenkins"
#   network_interface_ids = [
#     azurerm_network_interface.networkInterface.id
#   ]
  network_interface_ids             =   [azurerm_network_interface.nic.id]
  resource_group_name              = var.resource_group_name
  admin_username = var.admin_username
  size = "Standard_DS1_v2"

  os_disk {
    name              = "Linux"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    public_key = file("./ssh/id_rsa.pub")    
    username   = var.admin_username
  }
}

#
# - Run Custom scripts on the virtual machine using Azure Custom Script VM Extension resource
#

resource "azurerm_virtual_machine_extension" "SetupJenkins" {
  name                 = "setupJenkins"
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"
  virtual_machine_id   = azurerm_linux_virtual_machine.LinuxVMWithJenkins.id

  settings = <<SETTINGS
  {
    "script": "${filebase64("./scripts/setup.sh")}"
  }
  SETTINGS
}

