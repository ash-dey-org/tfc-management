
resource "tfe_project" "project" {
  name         = "prj-${var.project}"
  organization = var.organization
}

# create workspaces - dev, tst, uat, prd
resource "tfe_workspace" "a-workspace" {

  for_each = toset(var.environments)

  name                          = "${var.project}-${each.key}"
  organization                  = var.organization
  description                   = "This workspace belongs to project ${var.project}"
  tag_names                     = var.tags
  project_id                    = tfe_project.project.id
  execution_mode                = var.execution
  structured_run_output_enabled = false
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_dev_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}


