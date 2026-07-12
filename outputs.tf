output "site_recovery_replication_policies_id" {
  description = "Map of id values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.id }
}
output "site_recovery_replication_policies_application_consistent_snapshot_frequency_in_minutes" {
  description = "Map of application_consistent_snapshot_frequency_in_minutes values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.application_consistent_snapshot_frequency_in_minutes }
}
output "site_recovery_replication_policies_name" {
  description = "Map of name values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.name }
}
output "site_recovery_replication_policies_recovery_point_retention_in_minutes" {
  description = "Map of recovery_point_retention_in_minutes values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.recovery_point_retention_in_minutes }
}
output "site_recovery_replication_policies_recovery_vault_name" {
  description = "Map of recovery_vault_name values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.recovery_vault_name }
}
output "site_recovery_replication_policies_resource_group_name" {
  description = "Map of resource_group_name values across all site_recovery_replication_policies, keyed the same as var.site_recovery_replication_policies"
  value       = { for k, v in azurerm_site_recovery_replication_policy.site_recovery_replication_policies : k => v.resource_group_name }
}

