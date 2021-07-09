// Resource Group Variables
variable "RESOURCE_GROUP_NAME" {
  type = string
  default = "terraformrg0078"
}

variable "RESOURCE_GROUP_LOCATION" {
  type = string
  default = "westus"
}

// DataBricks Workspace Variables

variable "DATABRICKS_WORKSPACE_NAME" {
    type = string
    default = "default-db-workspace"
}

variable "DATABRICKS_SKU" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "DATABRICKS_MANAGED_RESOURCE_GROUP_NAME" {
    type = string
    default = "goplTerraformRgmanage"
}

variable "DATABRICKS_WORKSPACE_TAGS" {
    type = object({
      application = string
      note = string
  })
  default = {
      application = "Gap Overlap in Product Lifecycle"
      note = "Subscription level deployment"
  }
}

variable "ENABLE_DATABRICKS_WORKSPACE" {
    type = bool
    default = true
}
// DataBricks Cluster Variables

variable "CREATE_DATABRICKS_CLUSTER" {
  type = bool
  default = false
}

variable "DATABRICKS_WORKSPACE_ID" {
  type = string
  default = ""
}
variable "DEFAULTCLUSTERPROPERTY" {
  type = list(object({
    autoscale = object({
        min_workers = number
        max_workers = number
    })
    cluster_name = string
    spark_version = string
    spark_conf = object({})
    node_type_id = string
    driver_node_type_id = string
    ssh_public_keys = list(string)
    custom_tags = object({})
    spark_env_vars = object({
        PYSPARK_PYTHON = string
    })
    autotermination_minutes = number
    init_scripts = list(string)
    Update = bool
  }))
  
  default = [
  {
        autoscale = {
               min_workers = 1
               max_workers = 2
                 },
        cluster_name = "admin",
        spark_version= "latest-stable-scala2.11", 
        spark_conf = {},
        node_type_id = "Standard_DS3_v2",
        driver_node_type_id = "Standard_DS3_v2",
        ssh_public_keys = [],
        custom_tags = {},
        spark_env_vars = {
            PYSPARK_PYTHON = "/databricks/python3/bin/python3"
        },
        autotermination_minutes = 30
        init_scripts = []
        Update = false
    }
]
}

// KeyVault Variables

variable "KEY_VAULT_NAME" {
    type = string
    default = "batmankakeyvalaut007"
    description = "Specifies the name of the key vault."
}

variable "CREATE_KEY_VAULT" {
  type = bool
  default = false
}
variable "key_vault_resource_group_name" {
    type = string
    default = "rg-MyFirstTerraform"
}
variable "key_vault_location" {
    type = string
    default = "westus"
}
variable "KEY_VAULT_SKU_NAME" {
    type = string
    default = "standard"
    description = "Specifies whether the key vault is a standard vault or a premium vault."
}

variable "KEY_VAULT_ENABLED_FOR_DISK_ENCRYPTION" {
    type = bool
    default = true
    description = "Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
}

variable "ENABLEDFORTEMPLATEDEPLOYMENT" {
    type = bool
    default = true
    description = "Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
}

variable "ENABLEDFORDEPLOYMENT" {
    type = bool
    default = true
    description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."  
}
variable "ENABLEDFORSOFTDELETE" {
    type = bool
    default = true
    description = "Specifies whether Azure Resource Manager is permitted to soft delete secrets from the key vault."  
}

variable "KEY_VAULT_SOFT_DELETE_RETENTION_DAYS" {
    type = number
    default = 7
}

variable "KEY_VAULT_PURGE_PROTECTION_ENABLED" {
    type = bool
    default = true
}

variable "KEYSPERMISSIONS" {
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

variable "SECRETPERMISSIONS" {
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

variable "SERVICEPRINCIPALOBJECTS" {
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

variable "KEY_VAULT_TAGS" {
  type = object({
      application = string
      note = string
  })
  default = {
      application = "Gap Overlap in Product Lifecycle"
      note = "Subscription level deployment"
  }
}

// RG Role Assignments

variable "ADDRBACTORESOURCE" {
  type = bool
  default = false
}

variable "PRINCIPALIDS" {
  type = list(string)
  default = [ ]
  description = "Provide the list of existing Principal IDs that needs to be given access."
}

variable "BUILTINROLETYPE" {
  type = string
  default  = "Owner"
}

variable "resource_group_name" {
    type = string
    default = "goplTerraformRG007" 
  
}


// Storage Account Variables

variable "STORAGE_ACCOUNT_NAME" {
    type = string
    description = "Name of storage account"
    default = "batmankastg001"
}
# variable "resource_group_name" {
#     type = string
#     description = "Name of resource group"
#     default = "goplResourceGroup"
# }
# variable "resource_location" {
#     type = string
#     description = "Azure location of storage account environment"
#     default = "westus2"
# }
variable "ACCOUNT_TIER" {
    type = string
    default = "Standard"
}
variable "ACCOUNT_REPLICATION" {
    type = string
    default = "GRS"
}
variable "CREATE_STORAGE_ACCOUNT"{
    type = bool
    default = false
}