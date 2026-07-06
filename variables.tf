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
  # --- Unconfirmed validation candidates, derived from azurerm_site_recovery_replication_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: recovery_vault_name
  #   source:    validate.RecoveryServicesVaultName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: recovery_point_retention_in_minutes
  #   source:    validation.IntBetween(0, 365*24*60) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
  # path: application_consistent_snapshot_frequency_in_minutes
  #   source:    validation.IntBetween(0, 365*24*60) - bound(s) not a literal int (e.g. a named constant like math.MaxInt32) - resolve manually
}

