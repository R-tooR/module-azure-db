variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "password" {
  type = string
}
variable "mysql_storage_size" {
  type    = number
  default = 5120
}
variable "mysql_sku_name" {
  type    = string
  default = "B_Gen5_1"
}
variable "redis_capacity" {
  type    = number
  default = 0
}
variable "redis_family" {
  type    = string
  default = "C"
}
variable "redis_sku_name" {
  type    = string
  default = "Basic"
}
