# main.tf - Azure networking resources

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = var.region
}

# Virtual Network
resource "azurerm_virtual_network" "example_vnet" {
  name                = "example-vnet"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = var.vnet_address_space
}

# Subnet A
resource "azurerm_subnet" "subnet_a" {
  name                 = var.subnet_a_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = [var.subnet_a_prefix]
}

# Subnet B
resource "azurerm_subnet" "subnet_b" {
  name                 = var.subnet_b_name
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = [var.subnet_b_prefix]
}

# Network Security Group
resource "azurerm_network_security_group" "example_nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = var.ssh_port
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "deny-all"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate NSG with Subnet A
resource "azurerm_subnet_network_security_group_association" "subnet_a_nsg" {
  subnet_id                 = azurerm_subnet.subnet_a.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}

# Associate NSG with Subnet B
resource "azurerm_subnet_network_security_group_association" "subnet_b_nsg" {
  subnet_id                 = azurerm_subnet.subnet_b.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}

# Optional: Public IP (for testing, if needed)
resource "azurerm_public_ip" "example_ip" {
  name                = "example-public-ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Basic"
}
