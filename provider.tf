provider "alicloud" {
  access_key = var.access_key
  secret_key = var.access_key_secret
  region     = var.region
  version    = "~> 1.58"
}