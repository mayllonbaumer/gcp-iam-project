# Carrega o arquivo YAML e decodifica para um objeto no Terraform
locals {
  groups_data  = yamldecode(file("${path.module}/groups.yaml"))
  custom_roles = yamldecode(file("${path.module}/custom_roles.yaml"))
}

resource "google_project_service" "cloud_identity" {
  project = var.project_id
  service = "cloudidentity.googleapis.com"
}

# Loop para criar recursos para cada grupo no YAML
module "custom_roles" {
  for_each = { for role in local.custom_roles.roles : group.name => role }

  source = "./modules/custom_roles"
  project_id = var.project_id
  name          = each.value.name
  title         = each.value.title
  description   = each.value.description
  permissions   = each.value.permissions

  depends_on = [
    google_project_service.cloud_identity,
  ]
}

# Loop para criar recursos para cada grupo no YAML
module "groups" {
  for_each = { for group in local.groups_data.groups : group.name => group }

  source = "./modules/group"

  name       = each.value.name
  members    = each.value.members
  roles      = each.value.roles

  depends_on = [
    module.custom_roles,
  ]
}
