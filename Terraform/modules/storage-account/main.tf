resource "azurerm_storage_account" "gopl_storage_account" {
  count                    = "${var.create_gopl_storage_account ? 1 : 0}"
  name                     = var.gopl_storage_account_name
  resource_group_name      = var.gopl_resource_group_name
  location                 = var.gopl_resource_location
  account_tier             = var.gopl_account_tier
  account_replication_type = var.gopl_account_replication

}