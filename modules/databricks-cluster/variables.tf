variable "create_databricks_cluster" {
  type = bool
  default = false
}

variable "databricks_workspace_id" {
  type = string
  default = ""
}
variable "DefaultClusterProperty" {
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
    },
    {
          autoscale = {
               min_workers = 1
               max_workers = 2
                 },
        cluster_name = "project",
        spark_version= "latest-stable-scala2.11", 
        spark_conf = {},
        node_type_id = "Standard_DS4_v2",
        driver_node_type_id = "Standard_DS4_v2",
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