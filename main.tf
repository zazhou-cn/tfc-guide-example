resource "tls_private_key" "fullnode" {
  algorithm = "RSA"
}

resource "alicloud_key_pair" "fullnode" {
  key_name   = "${var.ssh_key_name}-${local.resource_name}"
  public_key = tls_private_key.fullnode.public_key_openssh
}

# Store the private key into a file
resource "local_file" "private_key_pem" {
  filename = "${var.ssh_key_name}.pem"
  content  = tls_private_key.fullnode.private_key_pem
  file_permission = 400
}

resource "alicloud_instance" "fullnode" {
  
  availability_zone = data.alicloud_zones.my_zones.zones.0.id
  security_groups = alicloud_security_group.default.*.id
  instance_type        = data.alicloud_instance_types.default.instance_types.0.id
  system_disk_category = var.system_disk_category
  image_id             = var.os_image_id
  instance_name        = var.instance_name
  vswitch_id = alicloud_vswitch.vsw.id
  internet_max_bandwidth_out = var.bandwidth
  key_name = alicloud_key_pair.fullnode.key_name
  #password = "Tunwu2020$"

  connection {
    host = self.public_ip
    type = "ssh"
    user = "root"
    #password = "Tunwu2020$"
    private_key = tls_private_key.fullnode.private_key_pem
  }

  provisioner "file" {
    source = "jdk-8u271-linux-x64.tar.gz"
    destination = "/tmp/jdk"
  }

  provisioner "file" {
    source = "FullNode.jar"
    destination = "/tmp/FullNode.jar"
  }

  provisioner "file" {
    source = "config.conf"
    destination = "/tmp/config.conf"
  }

  provisioner "file" {
    source = "set_java_var.sh"
    destination = "/tmp/set_java_var.sh"
  }

  provisioner "remote-exec" {

  inline = [
   "set -e",
   "mkdir -p /usr/lib/jvm",
   "mkdir -p /project/tron",
   "cp /tmp/jdk /usr/lib/jvm",
   "chmod +x /tmp/set_java_var.sh",
   "cp /tmp/set_java_var.sh /usr/lib/jvm",
   "cp /tmp/FullNode.jar /project/tron",
   "cp /tmp/config.conf /project/tron",
   "cd /usr/lib/jvm",
   "tar xvzf jdk",
   "./set_java_var.sh",
  ]
 }
}