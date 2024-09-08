# Variáveis para receber o nome do grupo, membros e papéis
variable "group_name" {
  type = string
}

variable "members" {
  type = list(object({
    user = string
  }))
}

variable "roles" {
  type = list(string)
}

variable "project_id" {
  type = string
}

variable "domain" {
  description = "The domain for the group email"
  type        = string
  default     = "example.com"
}

variable "parent" {
  description = "The parent ID, e.g., 'customers/my_customer'"
  type        = string
  default     = "customers/my_customer"  # Ajuste conforme necessário
}