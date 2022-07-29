terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }
  }
  required_version = ">= 1.0"
}

variable "cluster_name" {
}

variable "redis_version" {
}

variable "server_count" {
}

variable "shard_count" {
}

variable "size"{
}

variable "cidr_list"{
}

variable "machine_pool_list"{
}

variable "backup_interval"{
}

variable "scalegrid_username"{
}

variable "scalegrid_password"{
}

# data "oci_core_services" "all_services" {
# }

# data oci_identity_availability_domain AD-1 {
#   compartment_id = var.compartment_ocid
#   ad_number      = "1"
# }
# data oci_identity_availability_domain AD-2 {
#   compartment_id = var.compartment_ocid
#   ad_number      = "2"
# }
# data oci_identity_availability_domain AD-3 {
#   compartment_id = var.compartment_ocid
#   ad_number      = "3"
# }

# data oci_objectstorage_namespace os_namespace {
#   compartment_id = var.compartment_ocid
# }