terraform {
  required_providers {
    databricks = {
      source = "databrickslabs/databricks"
    }
  }
}

resource "databricks_cluster" "databricks_cluster" {
  count                   = var.create_databricks_cluster ? length(var.DefaultClusterProperty) : 0
  cluster_name            = var.DefaultClusterProperty[count.index].cluster_name
  spark_version           = var.DefaultClusterProperty[count.index].spark_version
  node_type_id            = var.DefaultClusterProperty[count.index].node_type_id
  driver_node_type_id     = var.DefaultClusterProperty[count.index].driver_node_type_id
  ssh_public_keys         = var.DefaultClusterProperty[count.index].ssh_public_keys
  custom_tags             = var.DefaultClusterProperty[count.index].custom_tags
  spark_env_vars          = var.DefaultClusterProperty[count.index].spark_env_vars
  autotermination_minutes = var.DefaultClusterProperty[count.index].autotermination_minutes
  //init_scripts            = var.DefaultClusterProperty[count.index].init_scripts
  autoscale {
    min_workers           = var.DefaultClusterProperty[count.index].autoscale.min_workers
    max_workers           = var.DefaultClusterProperty[count.index].autoscale.max_workers
  }
}