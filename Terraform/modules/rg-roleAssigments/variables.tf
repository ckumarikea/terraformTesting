variable "addRBACToResource" {
  type = bool
  default = false
}

variable "principalIds" {
  type = list(string)
  default = [ "2e4a088c-63ac-4cce-88e3-dc916b1266df", "b9088628-62ca-4467-b005-629f8f6b3b2d"]
}

variable "builtInRoleType" {
  type = string
  default  = "Owner"
}

variable "rgname" {
    type = string
    default = "Terraformrg" 
  
}

variable "rgid" {
    type = string
}