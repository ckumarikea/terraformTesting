provider "azurerm" {
  version = "1.38.0"
}

# Create resource group
resource "azurerm_resource_group" "rg" {
    name     = "rg-MyFirstTerraform"
    location = "westus"
}

# Create Azure DataBricks
module "databricks_workspace" {
  source                    = "./modules/databricks-workspace"
  rgname                    = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  managedResourceGroupName  = "testdbmanagedrg"

}
# Create Key Vault
module "key_vault" {
  source      = "./modules/key-vault"
  rgname      = azurerm_resource_group.rg.name
  location    = azurerm_resource_group.rg.location
  addKeyVault = true
}

# Add Role Assigments for Resource Group
module "role_assigment" {
  source            = "./modules/rg-roleAssigments"
  rgname            = azurerm_resource_group.rg.name
  addRBACToResource = true
  rgid              = azurerm_resource_group.rg.id
}
