data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  count                           = "${var.addKeyVault == true ? 1 : 0}"
  name                            = var.kvname
  location                        = var.location
  resource_group_name             = var.rgname
  enabled_for_disk_encryption     = var.enabledForDiskEncryption
  enabled_for_deployment          = var.enabledForDeployment
  enabled_for_template_deployment = var.enabledForTemplateDeployment
  //soft_delete_enabled             = var.enabledForSoftDelete
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.sku
  tags                            = var.tagValues
  
  access_policy {
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  key_permissions     = var.keysPermissions
  secret_permissions  = var.secretsPermissions
}

}

resource "azurerm_key_vault_access_policy" "kv_policy" {
  count                   = "${var.addKeyVault == true ? length(var.servicePrincipalObjects) : 0}"
  key_vault_id            = azurerm_key_vault.key_vault[0].id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = var.servicePrincipalObjects[count.index].Id
  key_permissions         = var.servicePrincipalObjects[count.index].Permissions.keys
  secret_permissions      = var.servicePrincipalObjects[count.index].Permissions.secrets
  certificate_permissions = var.servicePrincipalObjects[count.index].Permissions.certificates
}
