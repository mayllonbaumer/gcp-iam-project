# Create custom roles based on the YAML file
resource "google_project_iam_custom_role" "custom_roles" {
  for_each = { for role in local.custom_roles.roles : role.name => role }
  
  project     = var.project_id
  role_id     = each.value.name
  title       = each.value.title
  description = each.value.description
  permissions = each.value.permissions
}
