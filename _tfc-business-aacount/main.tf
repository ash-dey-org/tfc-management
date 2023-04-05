# To Do - loop through environments

/*

# not supported by terraform yet, feature request submitted
data "tfe_project" "project-mgmt" {
  name         = "prj-${var.tfc-management}"
  organization = var.organization
}


# remove the following data for workspace, once data in project is avalable
data "tfe_workspace" "workspace-mgmt" {
  name         = "${var.tfc-management}-${var.project}"
  organization = var.organization
}

*/

data "tfe_team" "team-dev" {
  for_each = {
    for team in var.dev_workspace_access :
    team.name => team
  }

  name         = each.value.name
  organization = var.organization
}

data "tfe_team" "team-tst" {
  for_each = {
    for team in var.tst_workspace_access :
    team.name => team
  }

  name         = each.value.name
  organization = var.organization
}

data "tfe_team" "team-uat" {
  for_each = {
    for team in var.uat_workspace_access :
    team.name => team
  }

  name         = each.value.name
  organization = var.organization
}

data "tfe_team" "team-prd" {
  for_each = {
    for team in var.prd_workspace_access :
    team.name => team
  }

  name         = each.value.name
  organization = var.organization
}

data "tfe_team" "team_ops" {
  for_each = toset(var.teams_ops)

  name         = each.key
  organization = var.organization
}

/*
# to be used once data on tfe_project feature is available
resource "tfe_workspace" "workspace-mgmt" {
  name         = "${var.tfc-management}-${var.project}"
  organization = var.organization
  description = "This workspace manages project ${var.project}"
  tag_names    = var.tags
  project_id   = data.tfe_project.project-mgmt.id
}

resource "tfe_workspace_variable_set" "test" {
  variable_set_id = data.tfe_variable_set.my-var-set.id
  workspace_id    = data.tfe_workspace.workspace-mgmt.id
}

*/

resource "tfe_project" "project" {
  name         = "prj-${var.project}"
  organization = var.organization
}

resource "tfe_team_project_access" "admin" {
  for_each = toset(var.teams_ops)

  access     = "admin"
  team_id    = data.tfe_team.team_ops[each.key].id
  project_id = tfe_project.project.id
}

# create workspaces - dev, tst, uat, prd
resource "tfe_workspace" "workspace-dev" {
  name           = "${var.project}-${var.dev_env}"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_dev_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}

resource "tfe_workspace" "workspace-tst" {
  name           = "${var.project}-${var.tst_env}"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_tst_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
  */
}

resource "tfe_workspace" "workspace-uat" {
  name           = "${var.project}-${var.uat_env}"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_uat_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}

resource "tfe_workspace" "workspace-prd" {
  name           = "${var.project}-${var.prd_env}"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_prd_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}


# create workspaces - dev, tst, uat, prd for DR
resource "tfe_workspace" "workspace-dev-dr" {
  name           = "${var.project}-${var.dev_env}-dr"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_dev_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}

resource "tfe_workspace" "workspace-tst-dr" {
  name           = "${var.project}-${var.tst_env}-dr"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_tst_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
  */
}

resource "tfe_workspace" "workspace-uat-dr" {
  name           = "${var.project}-${var.uat_env}-dr"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_uat_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}

resource "tfe_workspace" "workspace-prd-dr" {
  name           = "${var.project}-${var.prd_env}-dr"
  organization   = var.organization
  description    = "This workspace belongs to project ${var.project}"
  tag_names      = var.tags
  project_id     = tfe_project.project.id
  execution_mode = var.execution
  /*
  vcs_repo {
    identifier     = "${var.vcs_organization}/${var.project}"
    branch         = var.vcs_prd_branch
    oauth_token_id = var.vcs_repo_oauth_token_id
  }
*/
}

# provide team access to workspaces
resource "tfe_team_access" "dev-workspace" {
  for_each = {
    for team in var.dev_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-dev[each.value.name].id
  workspace_id = tfe_workspace.workspace-dev.id
}

resource "tfe_team_access" "tst-workspace" {
  for_each = {
    for team in var.tst_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-tst[each.value.name].id
  workspace_id = tfe_workspace.workspace-tst.id
}

resource "tfe_team_access" "uat-workspace" {
  for_each = {
    for team in var.uat_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-uat[each.value.name].id
  workspace_id = tfe_workspace.workspace-uat.id
}

resource "tfe_team_access" "prd-workspace" {
  for_each = {
    for team in var.prd_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-prd[each.value.name].id
  workspace_id = tfe_workspace.workspace-prd.id
}


# provide team access to DR workspaces
resource "tfe_team_access" "dev-workspace-dr" {
  for_each = {
    for team in var.dev_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-dev[each.value.name].id
  workspace_id = tfe_workspace.workspace-dev-dr.id
}

resource "tfe_team_access" "tst-workspace-dr" {
  for_each = {
    for team in var.tst_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-tst[each.value.name].id
  workspace_id = tfe_workspace.workspace-tst-dr.id
}

resource "tfe_team_access" "uat-workspace-dr" {
  for_each = {
    for team in var.uat_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-uat[each.value.name].id
  workspace_id = tfe_workspace.workspace-uat-dr.id
}

resource "tfe_team_access" "prd-workspace-dr" {
  for_each = {
    for team in var.prd_workspace_access :
    team.name => team
  }

  access       = each.value.access
  team_id      = data.tfe_team.team-prd[each.value.name].id
  workspace_id = tfe_workspace.workspace-prd-dr.id
}
