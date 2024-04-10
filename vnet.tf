resource "azurerm_virtual_network" "vnet" {
    name="vnet01"
    address_space = ["10.1.0.0/16"]
    resource_group_name = azurerm_resource_group.Rg11.name
    location = azurerm_resource_group.Rg11.location
    depends_on = [ azurerm_resource_group.Rg11 ]
}
resource "azurerm_subnet" "subnet1" {
    name="sub1"
    address_prefixes = ["10.1.1.0/24"]
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = azurerm_resource_group.Rg11.name
    depends_on = [ azurerm_virtual_network.vnet ]
}
resource "azurerm_subnet" "subnet2" {
    name = "sub2"
    address_prefixes = ["10.1.2.0/24"]
    virtual_network_name = azurerm_virtual_network.vnet.name
    resource_group_name = azurerm_resource_group.Rg11.name

  
}