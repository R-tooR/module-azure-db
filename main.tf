provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "db-resource" {
  location = var.location
  name     = "flight-reservations-data"
}

resource "azurerm_mysql_server" "mysql" {
  name                              = "flights-db"
  location                          = var.location
  resource_group_name               = azurerm_resource_group.db-resource
  administrator_login               = "mysqladm"
  administrator_login_password      = var.password
  sku_name                          = var.mysql_sku_name
  storage_mb                        = var.mysql_storage_size
  version                           = "5.7"
  auto_grow_enabled                 = false
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}


resource "azurerm_redis_cache" "redis" {
  name                = "reservations-db"
  location            = var.location
  resource_group_name = azurerm_resource_group.db-resource
  capacity            = var.redis_capacity
  family              = var.redis_family
  sku_name            = var.redis_sku_name
  enable_non_ssl_port = true
  minimum_tls_version = "1.2"

  redis_configuration {
  }
}