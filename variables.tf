variable "organization" {
  type = string
}

/*
variable "vcs_organization" {
  type    = string
  default = "Standards-Australia"
}

*/

variable "project" {
  type = string
}

variable "execution" {
  type = string
}

variable "environments" {
  type = list(string)

  default = []
}

variable "tags" {
  type = list(string)

  default = []
}

/*
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

variable "vcs_repo_oauth_token_id" {
  type = string
}
*/
