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

variable "machine_pool_map"{
  type = map
  default = {
    "ap-mumbai-1" = "5051"
    "ap-melbourne-1" = "5088"
    "ap-sydney-1" = "5092"
    "oci-byoc-mumbai" = "6470"
  }
}

variable "machine_pool_list"{
}

variable "backup_interval"{
}

variable "scalegrid_username"{
  default = "owiweihow@outlook.com"
}

variable "scalegrid_password"{
  default = "P@ssw0rd2022"
}