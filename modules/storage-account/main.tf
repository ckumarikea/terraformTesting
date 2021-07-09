resource "azurerm_storage_account" "storage_account" {
  count                    = "${var.create_storage_account ? 1 : 0}"
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication

}