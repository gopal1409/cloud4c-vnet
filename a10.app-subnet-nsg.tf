
#create websubnet
resource "azurerm_subnet" "appsubnet" {
  name = "${azurerm_virtual_network.vnet.name}-${var.app_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name 
  virtual_network_name = azurerm_virtual_network.vnet.name 
  address_prefixes = var.app_subnet_address
}

#create nsg
resource "azurerm_network_security_group" "app_subnet_nsg" {
    #security group name is combination of websubnet name + nsg
  name = "${azurerm_subnet.appsubnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name 
  location            = azurerm_resource_group.rg.location
}

#assocaite the nsg with subnet
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_associate" {
  depends_on = [
    azurerm_network_security_rule.app_nsg_rule_inbound
  ]
  #it will create an explicit dependency on those resources
  #it will increase the time to create the resource. 
  #every nsg rule you have created will be disassociate from nsg and it will re associate. 
   subnet_id                 = azurerm_subnet.appsubnet.id
   network_security_group_id = azurerm_network_security_group.app_subnet_nsg.id
}

locals {
  app_inbound_port = {
    "110" : "3389",
    "120" : "3306" #in terraform if your key start with numberic agains the key the value you are going to put : value
  }
}
#nsg inbound rule for webtier subnet
resource "azurerm_network_security_rule" "app_nsg_rule_inbound" {
  for_each = local.app_inbound_port
    name                       = "Rule-Port-${each.value}"
    priority                   = each.key
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = each.value
    source_address_prefix      = "12.12.12.0/24"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.rg.name 
    network_security_group_name = azurerm_network_security_group.app_subnet_nsg.name 
  }


