variable "az_group_name" {
  type    = "string"
  default = "prometheus-testing"
}

variable "az_region" {
  type    = "string"
  default = "East US 2"
}

variable "az_vnet_address_block" {
  type    = "string"
  default = "10.10.220.0/24"
}

variable "az_vnet_subnets" {
  type = "map"

  default = {
    gateway = "10.10.220.0/28"
    tools   = "10.10.220.16/28"
    compute = "10.10.220.32/27"
    data    = "10.10.220.64/27"
  }
}
