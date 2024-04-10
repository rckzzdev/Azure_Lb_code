resource "azurerm_network_interface" "nic" {
    name="vm-nic"
    location = azurerm_resource_group.Rg11.location
    resource_group_name = azurerm_resource_group.Rg11.name
    depends_on = [ azurerm_public_ip.public ]


  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public.id
  }

}

resource "azurerm_network_interface" "nic1" {
    name="vm-nic1"
    location = azurerm_resource_group.Rg11.location
    resource_group_name = azurerm_resource_group.Rg11.name
depends_on = [ azurerm_network_interface.nic ]

  ip_configuration {
    name                          = "internal"
     subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public1.id
  }

}
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.NSG.id
}
resource "azurerm_subnet_network_security_group_association" "example2" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.NSG.id
  depends_on = [ azurerm_subnet_network_security_group_association.example ]
}