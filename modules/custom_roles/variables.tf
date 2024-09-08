variable "name" {
  type = string
}
variable "title" {
  type = string
}
variable "description" {
  type = string
}
variable "project_id" {
  type = string
}
variable "permissions" {
  type = list(object({
    user = string
  }))
}