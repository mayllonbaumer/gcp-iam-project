variable "project_id" {
  description = "The ID do projeto GCP"
  type        = string
}

variable "region" {
  description = "Região onde os recursos serão criados"
  type        = string
  default     = "eurepo-west1"
}