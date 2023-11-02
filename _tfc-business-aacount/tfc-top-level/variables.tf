variable "organization" {
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
  default = "tfc-management"
}

variable "variable_set" {
  type    = string
}

variable "top-project-id" {
  type = string
  default = ""
}
