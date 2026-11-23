output "resource_group_name" {
  description = "Existing Resource Group used by this deployment."
  value       = data.azurerm_resource_group.lab.name
}

output "virtual_network_id" {
  description = "ID of the created Virtual Network."
  value       = azurerm_virtual_network.main.id
}

output "subnet_id" {
  description = "ID of the created application subnet."
  value       = azurerm_subnet.app.id
}

output "network_security_group_id" {
  description = "ID of the created Network Security Group."
  value       = azurerm_network_security_group.app.id
}

output "subnet_address_prefix" {
  description = "Address range assigned to the application subnet."
  value       = azurerm_subnet.app.address_prefixes
}
