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

variable "redis_version_map" {
  type = map
  default = {
    "v6.2.5" = "V625"
    "v6.0.4" = "V604"
    "v5.0.5" = "V505"
  }
}

variable "server_count" {
}

variable "shard_count" {
}

variable "size"{
}

variable "size_map"{
  type = map
  default = {
    "Micro(2 vCPU,2GB RAM, 1/8 baseline)" = "Micro"
    "Small(4 vCPU,4GB RAM, 1/2 baseline)" = "Small"
    "Medium(2 vCPU,8GB RAM)" = "Medium"
    "Large(4 vCPU,16GB RAM)" = "Large"
    "Xlarge(4 vCPU,30GB RAM)" = "Xlarge"
  }
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