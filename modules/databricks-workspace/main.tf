resource "azurerm_databricks_workspace" "databricks_workspace" {
  count                       	= var.enable_databricks_workspace ? 1 : 0
  name                		      = var.databricks_workspace_name
  resource_group_name         	= var.resource_group_name 
  location                    	= var.databricks_workspace_location 
  sku                         	= var.databricks_sku
  managed_resource_group_name 	= var.databricks_managed_resource_group_name
  tags                        	= var.databricks_workspace_tags
}