output "fullnode" {
  description = "Full Node"
  value = {
    instance_id          = alicloud_instance.fullnode.id
    instance_private_key = tls_private_key.fullnode.private_key_pem
    instance_public_ip   = alicloud_instance.fullnode.public_ip
    instance_private_ip  = alicloud_instance.fullnode.private_ip
  }
}