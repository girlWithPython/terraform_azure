module "ResourceGroup" {
  source = "./modules/ResourceGroup"
  base_name = "TerraformExample01"
  location = "West US"
}

module "StorageAccount" {
  source = "./modules/StorageAccount"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = module.ResourceGroup.rg_location_out

  depends_on = [module.ResourceGroup]
}

module "VnetSubnet" {

  source = "./modules/VnetSubnet"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = module.ResourceGroup.rg_location_out 

  depends_on = [module.ResourceGroup]   
}

module "LinuxVM" {

  source = "./modules/linuxVM"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = module.ResourceGroup.rg_location_out 
  subnet_id = module.VnetSubnet.subnet.id

  depends_on = [module.ResourceGroup, module.VnetSubnet]   
}

module "LinuxVMJenkins" {

  source = "./modules/linuxVMJenkins"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = module.ResourceGroup.rg_location_out 
  subnet_id = module.VnetSubnet.subnet.id

  depends_on = [module.ResourceGroup, module.VnetSubnet]   
}