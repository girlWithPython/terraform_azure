output "StgActName" {
  value = module.StorageAccount.str_act_name
}

output "RGName" {
  value = module.ResourceGroup.rg_name_out
}

output "VnetName" {    
    value = module.VnetSubnet.virtual-network-name
}

output "VnetIPs" {    
    value = module.VnetSubnet.virtual-network-ip-range
}

output "SubnetName" {    
    value = module.VnetSubnet.subnet-name
}

output "SubnetIPs" {    
    value = module.VnetSubnet.subnet-ip-range
}




