/*resource "azurerm_virtual_network" "vnet" {
  name                = "${local.resource_name_prefix}-${var.vnet_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
  tags                = local.common_tags
  
  dynamic "subnet" {
    for_each = var.subnet
    iterator = item 
    content {
        name = item.value.name 
        address_prefix = item.value.address_prefix
    }
  }
}

subnet = []*/