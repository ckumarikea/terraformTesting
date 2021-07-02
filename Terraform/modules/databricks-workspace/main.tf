resource "azurerm_databricks_workspace" "gopl_databricks_workspace" {
  count                       	= var.enable_databricks_worspace ? 1 : 0
  name                		      = var.gopl_databricks_workspace_name
  resource_group_name         	= var.gopl_resource_group_name 
  location                    	= var.gopl_databricks_workspace_location 
  sku                         	= var.gopl_databricks_sku
  managed_resource_group_name 	= var.gopl_databricks_managed_resource_group_name
  tags                        	= var.gopl_databricks_workspace_tags
}