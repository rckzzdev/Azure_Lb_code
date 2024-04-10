
resource "azurerm_availability_set" "avilset" {
  name = "avset1"
  resource_group_name = azurerm_resource_group.Rg11.name
  location = azurerm_resource_group.Rg11.location
  
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM"
  location              = azurerm_resource_group.Rg11.location
  resource_group_name   = azurerm_resource_group.Rg11.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_B1s"
  availability_set_id = azurerm_availability_set.avilset.id

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = "azradmin"
  disable_password_authentication = false
  admin_password = "Password@123"
  
}
resource "azurerm_linux_virtual_machine" "vmy_terraform_vm1" {
  name                  = "myVM2"
  location              = azurerm_resource_group.Rg11.location
  resource_group_name   = azurerm_resource_group.Rg11.name
  network_interface_ids = [azurerm_network_interface.nic1.id]
  size                  = "Standard_B1s"
  availability_set_id = azurerm_availability_set.avilset.id

  os_disk {
    name                 = "myOsDisk1"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = "azradmin"
  disable_password_authentication = false
  admin_password = "Password@123"
  depends_on = [ azurerm_subnet_network_security_group_association.example2]
  
}