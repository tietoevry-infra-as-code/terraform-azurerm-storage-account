module "storage" {
  source = "github.com/tietoevry-infra-as-code/terraform-azurerm-storage?ref=v2.0.0"

  # By default, this module will create a resource group, proivde the name here
  # to use an existing resource group, specify the existing resource group name, 
  # and set the argument to `create_resource_group = false`. Location will be same as existing RG. 
  # RG name must follow Azure naming convention. ex.: rg-<App or project name>-<Subscription type>-<Region>-<###>
  # Resource group is named like this: rg-tieto-internal-prod-westeurope-001
  create_resource_group = false
  resource_group_name   = "rg-tieto-internal-shared-westeurope-001"
  location              = "westeurope"

  # To enable advanced threat protection set argument to `true`
  enable_advanced_threat_protection = true

  # (Required) Project_Name, Subscription_type and environment are must to create resource names.
  project_name      = "tieto-internal"
  subscription_type = "shared"
  environment       = "dev"

  # Container lists with access_type to create
  containers_list = [
    { name = "mystore250", access_type = "private" },
    { name = "blobstore251", access_type = "blob" },
    { name = "containter252", access_type = "container" }
  ]
  # Adding TAG's to your Azure resources (Required)
  # ProjectName and Env are already declared above, to use them here, create a varible. 
  tags = {
    ProjectName  = "tieto-internal"
    Env          = "dev"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}
