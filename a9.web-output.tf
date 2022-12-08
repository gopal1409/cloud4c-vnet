output "virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.vnet.name 
}

output "virtual_network_id" {
  description = "Virtual Network Id"
  value = azurerm_virtual_network.vnet.id
}

output "web_subnet_name" {
  description = "Web Subnet Name"
  value = azurerm_subnet.websubnet.name
}
output "web_subnet_id" {
  description = "Web Subnet id"
  value = azurerm_subnet.websubnet.id
}

##3network sg
output "web_subnet_nsg_name" {
     description = "Web Subnet nsg name"
  value = azurerm_network_security_group.web_subnet_nsg.name 
    
  }
output "web_subnet_nsg_id" {
     description = "Web Subnet nsg id"
  value = azurerm_network_security_group.web_subnet_nsg.id
    
  }