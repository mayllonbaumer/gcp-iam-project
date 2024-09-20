locals {
  groups_data  = yamldecode(file("${path.module}/settings/users.yaml"))
}

module "users" {
  for_each = { for user in local.groups_data.users : user.email => user }

  source = "./modules/users"

  email      = each.key
  type       = each.value.type
  roles      = each.value.roles
  project_id = var.project_id
}