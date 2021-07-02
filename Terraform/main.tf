provider "azurerm" {
  version = "1.38.0"
}

# Create resource group
resource "azurerm_resource_group" "gopl_resource_group" {
    name     = "goplTerraformRG01"
    location = "West Europe"
}

# Create Azure DataBricks
module "databricks_workspace" {
  source                                          = "./modules/databricks-workspace"
  gopl_resource_group_name                        = azurerm_resource_group.gopl_resource_group.name
  gopl_databricks_workspace_location              = azurerm_resource_group.gopl_resource_group.location
  enable_databricks_worspace                      = true
}

# Create Key Vault
module "key_vault" {
  source                                  = "./modules/key-vault"
  gopl_key_vault_resource_group_name      = azurerm_resource_group.gopl_resource_group.name
  gopl_key_vault_location                 = azurerm_resource_group.gopl_resource_group.location
  create_gopl_key_vault                   = true
}

# Add Role Assigments for Resource Group
module "role_assigment" {
  source                              = "./modules/rg-roleAssigments"
  gopl_resource_group_name            = azurerm_resource_group.gopl_resource_group.name
  gopl_addRBACToResource              = true
  gopl_resource_group_id              = azurerm_resource_group.gopl_resource_group.id
}

# Create Storage Account
module "storage-account" {
  source                              = "./modules/storage-account"
  gopl_resource_group_name            = azurerm_resource_group.gopl_resource_group.name
  gopl_resource_location              = azurerm_resource_group.gopl_resource_group.location
  create_gopl_storage_account         = true
}