variable "gopl_databricks_workspace_name" {
    type = string
    default = "gopl-databricks-workspace001"
}

variable "gopl_databricks_workspace_location" {
  type = string
  default = "West Europe"
}

variable "gopl_databricks_sku" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "gopl_resource_group_name" {
    type = string
    default = "rg-MyFirstTerraform"
}

variable "gopl_databricks_managed_resource_group_name" {
    type = string
    default = "goplTerraformRgmanage"
}

variable "gopl_databricks_workspace_tags" {
    type = object({
      application = string
      note = string
  })
  default = {
      application = "Gap Overlap in Product Lifecycle"
      note = "Subscription level deployment"
  }
}

variable "enable_databricks_worspace" {
    type = bool
    default = true
}