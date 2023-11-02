Manage Terraform cloud workspace using Terraform
================================================

## Creates workspaces for various enviroments for a project/app


##### If you are using terraform business account (that supports team), use the code in _tfc-business-account folder. That will allow much more granular access control to workspaces to various teams.

Assumptions:
1. You are using a terraform cloud personal/free account.
2. Top level workspace exisits for the app, if not, follow the instructions in tfc-top-level folder and create that workspace first.


##### Terraform cloud worspace high level design

![image info](./images/tfc-workspace-architecture.png)

##### Instructions:

Steps:
1. Update the content of ./project_name.txt file with the name of the project/app.
2. It is assumed that the top level workspace (e.g. tfc-management-<app_git_repo_name>) exisits for the app and the variable-set apllied to the workspace.
3. Create a folder, name it same as the app git repo name e.g tf-azure-networking. There are several folders that already exists for any of the exisitng apps that is deployed through this code. DO NOT delete any of those folders.
4. copy the ./example/terraform.tfvars file into the newly created folder and update the content of the terraform.tfvars file to adjust the permission needed for the new app.
5. Create a pull request to develop branch. When the code is merged into develop branch, it will run a plan showing the resources that will be created.
6. Observe the output of the plan in github actions, and when you are happy with the plan output, create a pull request to main branch. Once the code is merged into the main branch, terrafom will create necessary projects and workspaces and add appropriate permissions.
7.  Go to terrafrom cloud portal and validate all the resource creation and permissions are correct.
