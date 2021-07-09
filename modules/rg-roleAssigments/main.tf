resource "azurerm_role_assignment" "role_assignment" {
  count                   = "${var.addRBACToResource == true ? length(var.principalIds) : 0}"
  scope                   = var.resource_group_id
  role_definition_name    = var.builtInRoleType
  principal_id            = var.principalIds[count.index]
}