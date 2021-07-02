variable "gopl_key_vault_name" {
    type = string
    default = "gopl-sbxkeyvault786"
    description = "Specifies the name of the key vault."
}

variable "create_gopl_key_vault" {
  type = bool
  default = false
}
variable "gopl_key_vault_resource_group_name" {
    type = string
    default = "rg-MyFirstTerraform"
}
variable "gopl_key_vault_location" {
    type = string
    default = "westus"
}
variable "gopl_key_vault_sku_name" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "gopl_key_vault_enabled_for_disk_encryption" {
    type = bool
    default = true
    description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
}

variable "gopl_enabledForTemplateDeployment" {
    type = bool
    default = true
    description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
}

variable "gopl_enabledForDeployment" {
    type = bool
    default = true
    description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."  
}
variable "enabledForSoftDelete" {
    type = bool
    default = true
    description = "Specifies whether Azure Resource Manager is permitted to soft delete secrets from the key vault."  
}

variable "gopl_key_vault_soft_delete_retention_days" {
    type = number
    default = 7
}

variable "gopl_key_vault_purge_protection_enabled" {
    type = bool
    default = true
}

variable "gopl_keysPermissions" {
    type = list(string)
    default = [ "get",
                "list",
                "update",
                "create",
                "import",
                "delete",
                "recover",
                "backup",
                "restore"]
    description = "Specifies the permissions to keys in the vault. Valid values are: all, encrypt, decrypt, wrapKey, unwrapKey, sign, verify, get, list, create, update, import, delete, backup, restore, recover, and purge."  
}

variable "gopl_secretsPermissions" {
    type = list(string)
    default = [ "get",
                "list",
                "set",
                "delete",
                "recover",
                "backup",
                "restore"]
    description = "Specifies the permissions to secrets in the vault. Valid values are: all, get, list, set, delete, backup, restore, recover, and purge."  
}

variable "gopl_servicePrincipalObjects" {
  type = list(object({
    Display_User_Name = string
    Id = string
    Permissions = object({
        keys = list(string)
        secrets = list(string)
        certificates = list(string)
    })
  }))
  default = [
  {
      Display_User_Name = "AzureDatabricks",
      Id= "6805fedc-3a0b-43f6-ac1f-b1f4301f5787", 
      Permissions = {
                keys = ["get",
                    "list",
                    "update",
                    "create",
                    "import",
                    "delete",
                    "recover",
                    "backup",
                    "restore"]
                 secrets = ["get",
                    "list",
                    "set",
                    "delete",
                    "recover",
                    "backup",
                    "restore"]
                 certificates = []
                 }
         },
         {
            Display_User_Name = "s-batch2-a-iosseelm@ikea.com",
            Id = "c78e8c0f-b9ad-47b3-94a3-73faee2fc58a", 
            Permissions = {
                keys = ["get",
                   "list",
                   "update",
                   "create",
                   "import",
                   "delete",
                   "recover",
                   "backup",
                   "restore"]
                secrets =  ["get",
                   "list",
                   "set",
                   "delete",
                   "recover",
                   "backup",
                   "restore"]
                certificates:[]
                }
         }
        ]
      }

variable "gopl_key_vault_tags" {
  type = object({
      application = string
      note = string
  })
  default = {
      application = "Gap Overlap in Product Lifecycle"
      note = "Subscription level deployment"
  }
}
