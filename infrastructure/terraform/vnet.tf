# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "${var.az_group_name}"
  location = "${var.az_region}"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "main" {
  name                = "${var.az_group_name}-network"
  address_space       = ["${var.az_vnet_address_block}"]
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
}

resource "azurerm_subnet" "test" {
  count                = "${length(var.az_vnet_subnets)}"
  name                 = "${format("%s-%s-%s", azurerm_virtual_network.main.name, element(keys(var.az_vnet_subnets), count.index), "subnet")}"
  resource_group_name  = "${azurerm_resource_group.main.name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "${element(values(var.az_vnet_subnets), count.index)}"
}
