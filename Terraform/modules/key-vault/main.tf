data "azurerm_client_config" "gopl_key_vault_tenant_id" {}

resource "azurerm_key_vault" "gopl_key_vault" {
  count                           = "${var.create_gopl_key_vault == true ? 1 : 0}"
  name                            = var.gopl_key_vault_name
  location                        = var.gopl_key_vault_location
  resource_group_name             = var.gopl_key_vault_resource_group_name
  enabled_for_disk_encryption     = var.gopl_key_vault_enabled_for_disk_encryption
  enabled_for_deployment          = var.gopl_enabledForDeployment
  enabled_for_template_deployment = var.gopl_enabledForTemplateDeployment
  tenant_id                       = data.azurerm_client_config.gopl_key_vault_tenant_id.tenant_id
  //soft_delete_retention_days      = var.gopl_key_vault_soft_delete_retention_days
  //purge_protection_enabled        = var.gopl_key_vault_purge_protection_enabled
  sku_name                        = var.gopl_key_vault_sku_name
  tags                            = var.gopl_key_vault_tags
  
  access_policy {
  tenant_id                       = data.azurerm_client_config.gopl_key_vault_tenant_id.tenant_id
  object_id                       = data.azurerm_client_config.gopl_key_vault_tenant_id.object_id
  key_permissions                 = var.gopl_keysPermissions
  secret_permissions              = var.gopl_secretsPermissions
}

}

resource "azurerm_key_vault_access_policy" "kv_policy" {
  count                   = "${var.create_gopl_key_vault == true ? length(var.gopl_servicePrincipalObjects) : 0}"
  key_vault_id            = azurerm_key_vault.gopl_key_vault[0].id
  tenant_id               = data.azurerm_client_config.gopl_key_vault_tenant_id.tenant_id
  object_id               = var.gopl_servicePrincipalObjects[count.index].Id
  key_permissions         = var.gopl_servicePrincipalObjects[count.index].Permissions.keys
  secret_permissions      = var.gopl_servicePrincipalObjects[count.index].Permissions.secrets
  certificate_permissions = var.gopl_servicePrincipalObjects[count.index].Permissions.certificates
}