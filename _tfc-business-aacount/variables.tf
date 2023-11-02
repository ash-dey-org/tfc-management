variable "organization" {
  type = string
}

variable "vcs_organization" {
  type    = string
  default = ""
}

variable "project" {
  type = string
}

variable "tags" {
  type = list(string)

  default = []
}

variable "dev_env" {
  type    = string
  default = "dev"
}
variable "tst_env" {
  type    = string
  default = "tst"
}
variable "uat_env" {
  type    = string
  default = "uat"
}
variable "prd_env" {
  type    = string
  default = "prd"
}

variable "execution" {
  type = string
}

variable "dev_workspace_access" {
  type = list(object({
    name   = string
    access = string
  }))

  default = []
}

variable "tst_workspace_access" {
  type = list(object({
    name   = string
    access = string
  }))

  default = []
}

variable "uat_workspace_access" {
  type = list(object({
    name   = string
    access = string
  }))

  default = []
}

variable "prd_workspace_access" {
  type = list(object({
    name   = string
    access = string
  }))

  default = []
}

variable "teams_ops" {
  type = list(string)

  default = []
}

variable "vcs_dev_branch" {
  type    = string
  default = "develop"
}

variable "vcs_tst_branch" {
  type    = string
  default = "test"
}

variable "vcs_uat_branch" {
  type    = string
  default = "uat"
}

variable "vcs_prd_branch" {
  type    = string
  default = "main"
}
/*
variable "vcs_repo_oauth_token_id" {
  type = string
}
*/
