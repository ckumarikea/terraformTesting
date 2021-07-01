variable "workspaceName" {
    type = string
    default = "default-db-workspace"
}

variable "location" {
  type = string
  default = "East US"
}

variable "sku" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "rgname" {
    type = string
    default = "rg-MyFirstTerraform"
}

variable "managedResourceGroupName" {
    type = string
    default = "terraformrg"
}