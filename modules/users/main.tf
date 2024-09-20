resource "google_project_iam_member" "user_permission" {
  for_each = { for idx, role in var.roles : idx => role }
  project = var.project_id
  role    = each.value
  member  = "${var.type}:${var.email}"
}