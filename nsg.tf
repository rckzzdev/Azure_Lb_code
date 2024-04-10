resource "azurerm_network_security_group" "NSG" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.Rg11.location
  resource_group_name = azurerm_resource_group.Rg11.name
  depends_on = [ azurerm_network_interface.nic ]

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  
}
