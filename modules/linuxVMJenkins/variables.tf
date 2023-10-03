# Prefix and Tags

variable "prefix" {
    description =   "Prefix to append to all resource names"
    type        =   string
    default     =   "tf"
}

variable "tags" {
    description =   "Resouce tags"
    type        =   map(string)
    default     =   {
        "author"        =   "Nobody"
        "deployed_with" =   "Terraform"
    }
}

# Resource Group

variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "location" {
  type = string
  description = "The location for the deployment"
}

# Vnet and Subnet

variable "subnet_id" {
  type = string
  description = "ID for the subnet"
}

# Public IP and NIC Allocation Method

variable "allocation_method" {
    description =   "Allocation method for Public IP Address and NIC Private ip address"
    type        =   list(string)
    default     =   ["Static", "Dynamic"]
}

# VM 

variable "admin_username" {
    description =   "Username to login to the VM"
    type        =   string
    default     =   "linuxadmin"
}

