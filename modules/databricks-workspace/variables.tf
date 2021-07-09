variable "databricks_workspace_name" {
    type = string
    default = "default-db-workspace"
}

variable "databricks_workspace_location" {
  type = string
  default = "East US"
}

variable "databricks_sku" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "resource_group_name" {
    type = string
    default = "rg-MyFirstTerraform"
}

variable "databricks_managed_resource_group_name" {
    type = string
    default = "goplTerraformRgmanage"
}

variable "databricks_workspace_tags" {
    type = object({
      application = string
      note = string
  })
  default = {
      application = "Gap Overlap in Product Lifecycle"
      note = "Subscription level deployment"
  }
}

variable "enable_databricks_workspace" {
    type = bool
    default = true
}