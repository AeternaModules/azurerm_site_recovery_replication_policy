variable "site_recovery_replication_policies" {
  description = <<EOT
Map of site_recovery_replication_policies, attributes below
Required:
    - application_consistent_snapshot_frequency_in_minutes
    - name
    - recovery_point_retention_in_minutes
    - recovery_vault_name
    - resource_group_name
EOT

  type = map(object({
    application_consistent_snapshot_frequency_in_minutes = number
    name                                                 = string
    recovery_point_retention_in_minutes                  = number
    recovery_vault_name                                  = string
    resource_group_name                                  = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.site_recovery_replication_policies : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.site_recovery_replication_policies : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.site_recovery_replication_policies : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.site_recovery_replication_policies : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

