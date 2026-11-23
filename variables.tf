variable "resource_group_name" {
  description = "Name of the existing Resource Group provided by the lab."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used to name resources."
  type        = string
  default     = "cloudforge"
}

variable "vnet_address_space" {
  description = "IPv4 address space for the virtual network."
  type        = string
  default     = "10.20.0.0/16"
}

variable "subnet_address_prefix" {
  description = "IPv4 address range for the application subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "location" {
  description = "Reserved for clarity; resource location is inherited from the existing Resource Group."
  type        = string
  default     = "eastus"
}

variable "trusted_ssh_source" {
  description = "Trusted source CIDR allowed to reach TCP/22. Replace before deployment; use a narrow trusted range."
  type        = string
  default     = "192.0.2.10/32"
}

variable "tags" {
  description = "Common resource tags."
  type        = map(string)
  default = {
    project     = "cloudforge"
    environment = "lab"
    managed_by  = "terraform"
  }
}
