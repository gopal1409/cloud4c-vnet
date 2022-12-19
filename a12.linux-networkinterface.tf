
resource "azurerm_network_interface" "web_linux_vm_nic" {
  #this for each loop refer to map value in input network
  for_each = var.web_linux_instance_count
  name = "${local.resource_name_prefix}-web-linux-nic-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name 
  location = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "web-linux-ip-1"
    subnet_id                     = azurerm_subnet.websubnet.id
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id = azurerm_public_ip.web_linux_publicip.id
  }
}