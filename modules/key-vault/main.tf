data "azurerm_client_config" "key_vault_tenant_id" {}

resource "azurerm_key_vault" "key_vault" {
  count                           = "${var.create_key_vault == true ? 1 : 0}"
  name                            = var.key_vault_name
  location                        = var.key_vault_location
  resource_group_name             = var.key_vault_resource_group_name
  enabled_for_disk_encryption     = var.key_vault_enabled_for_disk_encryption
  enabled_for_deployment          = var.enabledForDeployment
  enabled_for_template_deployment = var.enabledForTemplateDeployment
  tenant_id                       = data.azurerm_client_config.key_vault_tenant_id.tenant_id
  soft_delete_retention_days      = var.key_vault_soft_delete_retention_days
  purge_protection_enabled        = var.key_vault_purge_protection_enabled
  sku_name                        = var.key_vault_sku_name
  tags                            = var.key_vault_tags
  
  access_policy {
  tenant_id                       = data.azurerm_client_config.key_vault_tenant_id.tenant_id
  object_id                       = data.azurerm_client_config.key_vault_tenant_id.object_id
  key_permissions                 = var.keysPermissions
  secret_permissions              = var.secretsPermissions
}

}

resource "azurerm_key_vault_access_policy" "kv_policy" {
  count                   = "${var.create_key_vault == true ? length(var.servicePrincipalObjects) : 0}"
  key_vault_id            = azurerm_key_vault.key_vault[0].id
  tenant_id               = data.azurerm_client_config.key_vault_tenant_id.tenant_id
  object_id               = var.servicePrincipalObjects[count.index].Id
  key_permissions         = var.servicePrincipalObjects[count.index].Permissions.keys
  secret_permissions      = var.servicePrincipalObjects[count.index].Permissions.secrets
  certificate_permissions = var.servicePrincipalObjects[count.index].Permissions.certificates
}