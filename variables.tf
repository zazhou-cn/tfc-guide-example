# Variables
variable "access_key" {
  description = "Alibaba Cloud access key"
}

variable "access_key_secret" {
  description = "Alibaba Cloud access key secret"
}

variable "region" {
  description = "Alibaba Cloud Region. Another example is cn-shanghai"
}

variable "cpu_core_count" {
  description = "The cpu core count of the ECS"
  default     = 1
}

variable "memory_size" {
  description = "The memory size(GB) of the ECS"
  default     = 2
}

variable "bandwidth" {
  description = "The band width(MB/s) of the ECS"
  default     = 2
}

variable "os_image_id" {
  description = "Disk image ID for EC2 boot disk: Ubuntu 20.04"
  default     = "ubuntu_20_04_x64_20G_alibase_20200914.vhd"
}

variable "ssh_key_name" {
  description = "SSH key pair for instance login"
}

variable "system_disk_category" {
  description = "The category of the system disk"
  default     = "cloud_efficiency"
}

variable "instance_name" {
  description = "The instance name of the full node"
  default     = "noops_fullnode"
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC(Virtual Private Cloud)"
  default     = "172.16.0.0/12"
}

variable "instance_type_family" {
  description = "Filter the results based on their family name. For example: 'ecs.n4'."
  default     = "ecs.n4"
}

variable "iaas_provider" {
  description = "name of the iaas provider (lowercase), it is usually alicloud, only a placeholder for change"
  type        = string
  default     = "alicloud"
}

variable "environment" {
  description = "resource environment, e.g. production, staging, testing etc."
  type        = string
  default     = "testing"
}

variable "protocol" {
  description = "name of the protocol (lowercase), it is usually tron, only a placeholder for change"
  type        = string
  default     = "tron"
}

variable "network" {
  description = "The version of tron you are targeting. nile for testnet, or mainnet"
  type        = string
  default     = "nile"
}

variable "client" {
  description = "name of the client (lowercase)"
  type        = string
}

variable "name" {
  description = "name of the node (lowercase)"
  type        = string
}