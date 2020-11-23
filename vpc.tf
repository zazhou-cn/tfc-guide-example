resource "alicloud_vpc" "vpc" {
  name       = "noops_tron_fullnode_vpc"
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = cidrsubnet(alicloud_vpc.vpc.cidr_block, 4, 0)
  availability_zone = data.alicloud_zones.my_zones.zones.0.id
}

resource "alicloud_security_group" "default" {
  name = "default"
  vpc_id = alicloud_vpc.vpc.id
}

resource "alicloud_security_group_rule" "allow_all_tcp" {
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  port_range        = "1/65535"
  priority          = 1
  security_group_id = alicloud_security_group.default.id
  cidr_ip           = "0.0.0.0/0"
}