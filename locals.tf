locals {
  resource_name = uuidv5("x500", "E=${var.environment},P=${var.protocol},N=${var.network},C=${var.client},M=${var.name}")
  resource_tags = {
    Provider    = var.iaas_provider
    Environment = var.environment
    Protocol    = var.protocol
    Network     = var.network
    Client      = var.client
    Name        = var.name
  }
}