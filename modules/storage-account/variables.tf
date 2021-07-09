variable "storage_account_name" {
    type = string
    description = "Name of storage account"
    default = "goplDevStorage001"
}
variable "resource_group_name" {
    type = string
    description = "Name of resource group"
    default = "goplResourceGroup"
}
variable "resource_location" {
    type = string
    description = "Azure location of storage account environment"
    default = "westus2"
}
variable "account_tier" {
    type = string
    default = "Standard"
}
variable "account_replication" {
    type = string
    default = "GRS"
}
variable "create_storage_account"{
    type = bool
    default = false
}