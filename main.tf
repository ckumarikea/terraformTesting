terraform {
  required_providers {
    databricks = {
      source = "databrickslabs/databricks"
    }
  }
}
provider "azurerm" {
    features {}
}

provider "databricks" {
  azure_workspace_resource_id = module.databricks_workspace.workspace_id
}

# Create resource group
resource "azurerm_resource_group" "resource_group" {
    name     = var.RESOURCE_GROUP_NAME
    location = var.RESOURCE_GROUP_LOCATION
}

# Create Azure DataBricks
module "databricks_workspace" {
  source                                     = "./modules/databricks-workspace"
  resource_group_name                        = azurerm_resource_group.resource_group.name
  databricks_workspace_location              = azurerm_resource_group.resource_group.location
  enable_databricks_workspace                = var.ENABLE_DATABRICKS_WORKSPACE
  databricks_workspace_name                  = var.DATABRICKS_WORKSPACE_NAME
  databricks_sku                             = var.DATABRICKS_SKU
  databricks_managed_resource_group_name     = var.DATABRICKS_MANAGED_RESOURCE_GROUP_NAME
  databricks_workspace_tags                  = var.DATABRICKS_WORKSPACE_TAGS

}


# Create Azure DataBricks Cluster
module "databricks_cluster" {
  source                                          = "./modules/databricks-cluster"
  create_databricks_cluster                      = var.CREATE_DATABRICKS_CLUSTER
  databricks_workspace_id                        = var.DATABRICKS_WORKSPACE_ID
  DefaultClusterProperty                         = var.DEFAULTCLUSTERPROPERTY
   providers = {
    databricks = databricks 
   }
}

# Create Key Vault
module "key_vault" {
  source                                  = "./modules/key-vault"
  key_vault_resource_group_name      = azurerm_resource_group.resource_group.name
  key_vault_location                 = azurerm_resource_group.resource_group.location
  key_vault_name                     = var.KEY_VAULT_NAME
  create_key_vault                   = var.CREATE_KEY_VAULT
  key_vault_sku_name                 = var.KEY_VAULT_SKU_NAME
  key_vault_enabled_for_disk_encryption = var.KEY_VAULT_ENABLED_FOR_DISK_ENCRYPTION
  enabledForTemplateDeployment       = var.ENABLEDFORTEMPLATEDEPLOYMENT
  enabledForDeployment               = var.ENABLEDFORDEPLOYMENT
  enabledForSoftDelete               = var.ENABLEDFORSOFTDELETE
  key_vault_soft_delete_retention_days = var.KEY_VAULT_SOFT_DELETE_RETENTION_DAYS
  key_vault_purge_protection_enabled  = var.KEY_VAULT_PURGE_PROTECTION_ENABLED
  keysPermissions                     = var.KEYSPERMISSIONS
  secretsPermissions                  = var.SECRETPERMISSIONS
  servicePrincipalObjects             = var.SERVICEPRINCIPALOBJECTS
  key_vault_tags                      = var.KEY_VAULT_TAGS

}

# Add Role Assigments for Resource Group
module "role_assigment" {
  source                              = "./modules/rg-roleAssigments"
  resource_group_name            = azurerm_resource_group.resource_group.name
  addRBACToResource              = var.ADDRBACTORESOURCE
  resource_group_id              = azurerm_resource_group.resource_group.id
  principalIds                  = var.PRINCIPALIDS
  builtInRoleType                = var.BUILTINROLETYPE
}

# Create Storage Account
module "storage_account" {
  source                              = "./modules/storage-account"
  resource_group_name            = azurerm_resource_group.resource_group.name
  resource_location              = azurerm_resource_group.resource_group.location
  create_storage_account         = var.CREATE_STORAGE_ACCOUNT
  storage_account_name           = var.STORAGE_ACCOUNT_NAME
  account_tier                   = var.ACCOUNT_TIER
  account_replication            = var.ACCOUNT_REPLICATION
}