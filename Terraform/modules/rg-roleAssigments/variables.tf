variable "gopl_addRBACToResource" {
  type = bool
  default = false
}

variable "gopl_principalIds" {
  type = list(string)
  default = [ ]
  description = "Provide the list of existing Principal IDs that needs to be given access."
}

variable "gopl_builtInRoleType" {
  type = string
  default  = "Owner"
}

variable "gopl_resource_group_name" {
    type = string
    default = "goplTerraformRG007" 
  
}

variable "gopl_resource_group_id" {
    type = string
}