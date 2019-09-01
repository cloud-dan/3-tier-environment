data "azurerm_resource_group" "this" {
  name = format("%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code)
}

data "azurerm_virtual_network" "this" {
  name                = lower(format("%s-%s-%s-%s-%s-%s", var.company, var.product, var.environment, var.instance, var.region_code, "vnt"))
  resource_group_name = data.azurerm_resource_group.this.name
}

data "azurerm_subnet" "this" {
  name                 = format("%s%s", var.vm_subnet, "Subnet")
  virtual_network_name = format("%s-%s", data.azurerm_resource_group.this.name, "VNT")
  resource_group_name  = data.azurerm_resource_group.this.name
}

resource "azurerm_network_interface" "nic" {
  name = lower(format("%s%s%s%s%s%s%s-%s", var.product, var.environment, var.instance, var.region_code, var.vm_role, "0", (count.index + 1), "NIC"))

  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = data.azurerm_subnet.this.id
    private_ip_address_allocation = "dynamic"
  }

  count = var.vm_count
}

resource "azurerm_virtual_machine" "main" {
  name                  = lower(format("%s%s%s%s%s%s%s", var.product, var.environment, var.instance, var.region_code, var.vm_role, "0", (count.index + 1)))
  location              = data.azurerm_resource_group.this.location
  resource_group_name   = data.azurerm_resource_group.this.name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  vm_size               = "Standard_B2ms"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = lower(format("%s%s%s%s%s%s%s-%s", var.product, var.environment, var.instance, var.region_code, var.vm_role, "0", (count.index + 1), "OSDisk"))
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = upper(format("%s%s%s%s%s%s%s", var.product, var.environment, var.instance, var.region_code, var.vm_role, "0", (count.index + 1)))
    admin_username = var.vm_local_admin
    admin_password = var.vm_local_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  count = var.vm_count
}
