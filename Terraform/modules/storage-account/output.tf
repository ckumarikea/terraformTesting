output "primary_key" {
    description     = "The primary access key for the storage account"
    value           = azurerm_storage_account.gopl_storage_account.*.primary_access_key
    sensitive       = true
}