output "mysql_instance_id" {
  value = azurerm_mysql_server.mysql.id
}
output "mysql_endpoint" {
  value = azurerm_mysql_server.mysql.name
}
output "redis_instance_id" {
  value = azurerm_redis_cache.redis.id
}
