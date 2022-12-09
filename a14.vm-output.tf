##get the public ip in the terminal
output "web_linuxvm_public_ip" {
  description = "Web Linux CM IP"
  value = azurerm_public_ip.web_linux_publicip.ip_address
}