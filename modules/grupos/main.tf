# Criar o grupo usando a API do Cloud Identity
resource "google_cloud_identity_group" "group" {
  display_name = var.group_name
  group_key {
    id = "${var.group_name}@${var.domain}"
  }
  parent = var.parent
  labels = {
    "cloudidentity.googleapis.com/groups.discussion_forum" = ""
  }
}

# Adicionar membros ao grupo
resource "google_cloud_identity_group_membership" "group_membership" {
  for_each = { for member in var.members : member.user => member }

  group = google_cloud_identity_group.group.name
  preferred_member_key {
    id = each.key
  }
  roles {
    name = "MEMBER"
  }
}

# IAM Binding para associar papéis (roles) ao grupo
resource "google_project_iam_binding" "group_binding" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.key

  members = ["group:${google_cloud_identity_group.group.group_key[0].id}"]
}