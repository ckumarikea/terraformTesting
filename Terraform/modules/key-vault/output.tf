output "gopl_key_vault_id" {
    value = azurerm_key_vault.gopl_key_vault.*.id
}

output "key_vault_name" {
    value = azurerm_key_vault.gopl_key_vault.*.name
}