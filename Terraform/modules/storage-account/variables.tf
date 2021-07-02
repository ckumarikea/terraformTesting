variable "gopl_storage_account_name" {
    type = string
    description = "Name of storage account"
    default = "gopldevstorage001"
}
variable "gopl_resource_group_name" {
    type = string
    description = "Name of resource group"
    default = "goplResourceGroup"
}
variable "gopl_resource_location" {
    type = string
    description = "Azure location of storage account environment"
    default = "West Europe"
}
variable "gopl_account_tier" {
    type = string
    default = "Standard"
}
variable "gopl_account_replication" {
    type = string
    default = "GRS"
}
variable "create_gopl_storage_account"{
    type = bool
    default = false
}