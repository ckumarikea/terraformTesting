variable "addRBACToResource" {
  type = bool
  default = false
}

variable "principalIds" {
  type = list(string)
  default = [ ]
  description = "Provide the list of existing Principal IDs that needs to be given access."
}

variable "builtInRoleType" {
  type = string
  default  = "Owner"
}

variable "resource_group_name" {
    type = string
    default = "goplTerraformRG007" 
  
}

variable "resource_group_id" {
    type = string
}