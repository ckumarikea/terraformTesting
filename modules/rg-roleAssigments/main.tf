resource "azurerm_role_assignment" "role_assigment" {
  count                   = "${var.addRBACToResource == true ? length(var.principalIds) : 0}"
  scope                   = var.rgid
  role_definition_name    = var.builtInRoleType
  principal_id            = var.principalIds[count.index]
}
