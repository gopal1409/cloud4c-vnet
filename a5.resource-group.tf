resource "azurerm_resource_group" "rg" {
  name = "${local.resource_name_prefix}-${var.resource_group_location}-${random_string.myrandom.id}"
  location = var.resource_group_location
  tags = local.common_tags
}