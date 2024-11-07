# Azure Region for resource deployment
variable "region" {
  description = "The Azure region where resources will be deployed"
  type        = string
  default     = "East US"  #your region
}

# Virtual Network Address Space
variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Subnet Address Prefixes
variable "subnet_a_prefix" {
  description = "Address prefix for subnet A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_b_prefix" {
  description = "Address prefix for subnet B"
  type        = string
  default     = "10.0.2.0/24"
}

# Network Security Group rules
variable "ssh_port" {
  description = "The port for SSH access"
  type        = number
  default     = 22
}

variable "nsg_name" {
  description = "Name for the Network Security Group"
  type        = string
  default     = "example-nsg"
}

# Define the names for subnets
variable "subnet_a_name" {
  description = "Name for subnet A"
  type        = string
  default     = "subnet-a"
}

variable "subnet_b_name" {
  description = "Name for subnet B"
  type        = string
  default     = "subnet-b"
}
