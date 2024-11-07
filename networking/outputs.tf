# outputs.tf - Define outputs for easy access

output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.example_vnet.id
}

output "subnet_a_id" {
  description = "The ID of Subnet A"
  value       = azurerm_subnet.subnet_a.id
}

output "subnet_b_id" {
  description = "The ID of Subnet B"
  value       = azurerm_subnet.subnet_b.id
}

output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.example_nsg.id
}

output "public_ip" {
  description = "The public IP address of the resource"
  value       = azurerm_public_ip.example_ip.ip_address
}
