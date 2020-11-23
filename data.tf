data "alicloud_zones" "my_zones" {}
  
data "alicloud_instance_types" "default" {
  cpu_core_count       = var.cpu_core_count
  memory_size          = var.memory_size
  instance_type_family = var.instance_type_family
}