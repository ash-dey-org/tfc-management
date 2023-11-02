
data "tfe_project" "top-proj" {
  name = "prj-${var.tfc-management}"
  organization = var.tfc-organization
}

data "tfe_variable_set" "my-var-set" {
  name         = var.variable_set
  organization = var.tfc-organization
}

resource "tfe_workspace" "tfc-app-Workspace" {

  count = length(var.projects)

  name         = "${var.tfc-management}-${var.projects[count.index].name}"
  organization = var.tfc-organization
  tag_names    = var.projects[count.index].tags
  project_id   = data.tfe_project.top-proj.id
}

resource "tfe_workspace_variable_set" "test" {

  count = length(tfe_workspace.tfc-app-Workspace.*.name)

  variable_set_id = data.tfe_variable_set.my-var-set.id
  workspace_id    = tfe_workspace.tfc-app-Workspace[count.index].id
}
