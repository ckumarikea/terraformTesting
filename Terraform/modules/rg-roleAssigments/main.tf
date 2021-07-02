resource "azurerm_role_assignment" "gopl_role_assignment" {
  count                   = "${var.gopl_addRBACToResource == true ? length(var.gopl_principalIds) : 0}"
  scope                   = var.gopl_resource_group_id
  role_definition_name    = var.gopl_builtInRoleType
  principal_id            = var.gopl_principalIds[count.index]
}