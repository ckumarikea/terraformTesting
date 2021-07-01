resource "azurerm_databricks_workspace" "db_workspace" {
  name                = var.workspaceName
  resource_group_name = var.rgname
  location            = var.location
  sku                 = var.sku

  managed_resource_group_name = var.managedResourceGroupName

}
