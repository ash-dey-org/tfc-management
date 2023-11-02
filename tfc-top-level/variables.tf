variable "tfc-organization" {
  type = string
}

variable "projects" {
  type = list(object({
    name        = string
    tags        = list(string)
  }))
}

variable "tfc-management" {
  type    = string
}

variable "variable_set" {
  type    = string
}