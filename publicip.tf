resource "azurerm_public_ip" "public" {
    name = "standardpubip"
    location = azurerm_resource_group.Rg11.location
    resource_group_name = azurerm_resource_group.Rg11.name
    allocation_method = "Static"

}
resource "azurerm_public_ip" "public1" {
    name = "standardpubip2"
    location = azurerm_resource_group.Rg11.location
    resource_group_name = azurerm_resource_group.Rg11.name
    allocation_method = "Static"

}